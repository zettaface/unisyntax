" Vim syntax file
" Language:         TLV parser results
" Maintainer:       V. Efimov
" Latest Revision:  2017-10-10
" Changes:          2017-10-26

if exists("b:current_syntax")
  finish
endif
let b:current_syntax = "tlv"

syn region header start=/^\z(\s\+\)\x\+\s\-\s.*$/ end=/^\%(\z1\s*\)\@!\s+\S/me=s-1 fold keepend transparent
syn match value /^\s\+\x\+\s*$/ 
syn match tagname /\x\+\s-\s/me=e-3 

hi def link tagname Keyword
hi def link value Number
