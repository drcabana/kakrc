colorscheme zenburn

# buffer movement
map global user n ':eval %{buffer-next}<ret>' -docstring 'next buffer'
map global user N ':eval %{buffer-previous}<ret>' -docstring 'prev buffer'

# Deactivate the directional keys: h,l
map global normal h :nop<ret>
map global normal l :nop<ret>

# jj instead of escape key
hook global InsertChar j %{ try %{
  exec -draft hH <a-k>jj<ret> d
  exec <esc>
}}


# yank and paste to/from external clipboard
hook global NormalKey y|d|c %{ nop %sh{
  printf %s "$kak_reg_dquote" | xsel --input --clipboard
}}
map global user p '<a-!>xsel --output --clipboard<ret>' -docstring 'paste from clipboard'

