" Vim syntax file
" Language: ngl
" Maintainer:  Luis Pedro Coelho <luis@luispedro.org>

syn keyword nglKeyword using
syn keyword nglImport ngless import version
syn keyword nglConditional if discard continue
syn keyword nglSpecial not true false True False
syn keyword nglOperator ? : == != > >= < <= + - % * /

syn match nglFunction "\<[a-zA-Z][a-zA-Z0-9_]*\s*("

syn region nglString        start=+"+  skip=+\\\\\|\\"+  end=+"+
syn region nglString        start=+'+  skip=+\\\\\|\\'+  end=+'+

syn match nglUsingVars "|[a-zA-Z0-9_ ,]\+|"
syn match nglSymbol "{[a-zA-Z0-9_]\+}"

" Numbers:
syn match  nglNumber "[-+]\=\(\<\d[[:digit:]_]*L\=\>\|0[xX]\x[[:xdigit:]_]*\>\)"
syn match  nglFloat  "[-+]\=\<\d[[:digit:]_]*[eE][\-+]\=\d\+"
syn match  nglFloat  "[-+]\=\<\d[[:digit:]_]*\.[[:digit:]_]*\([eE][\-+]\=\d\+\)\="
syn match  nglFloat  "[-+]\=\<\.[[:digit:]_]\+\([eE][\-+]\=\d\+\)\="

" Comments:
syn region nglComment start="/\*" end="\*/" contains=nglTodo
syn match nglComment "//.*$" contains=nglTodo
syn match nglComment "#.*$" contains=nglTodo
syn sync ccomment nglComment

" Todo.
syn keyword nglTodo TODO FIXME XXX DEBUG NOTE contained

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_c_syn_inits")
  if version < 508
    let did_c_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink nglComment     Comment
  HiLink nglOpWord      Label
  HiLink nglOperator    Operator
  HiLink nglType        Type
  HiLink nglSpecial     Special
  HiLink nglImport      Include
  HiLink nglConditional Conditional
  HiLink nglKeyword     Statement
  HiLink nglNumber      Number
  HiLink nglFloat       Float
  HiLink nglSymbol      Constant
  HiLink nglUsingVars   Constant
  HiLink nglAssignVar   Identifier
  HiLink nglString      String
  HiLink nglTodo        Todo
  HiLink nglFunction    Function


  delcommand HiLink
endif

let b:current_syntax = "ngl"

