function refresh -d "(deprecated) Refresh fish session by replacing current process"
  printf 'warning: function %srefresh%s is deprecated and will be removed soon.\n %s\n' \
  (set_color -u) (set_color normal) \
  (status -t)[5] >&2

  set -q CI
    and return 0

  type -q omf.core.reload
    and omf.core.reload

  history --save
  exec fish
end
