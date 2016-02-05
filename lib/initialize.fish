function initialize -d "Initialize a package"
  for init in $argv
    set -l IFS '/'
    echo $init | read -la components

    set package $components[-2]
    set path (printf '/%s' $components[1..-2])
    set bundle $path/bundle
    set dependencies

    if test -f $bundle
      set -l IFS ' '
      while read -l type dependency
        if test "$type" = package
          require "$dependency"
          set dependencies $dependencies $dependency
        end
      end < $bundle
    end

    source $init $path
    emit init_$package $path

    set -g omf_packages_loaded $omf_packages_loaded $package
  end
end
