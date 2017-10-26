" Vim syntax file
" Language:         Handlers.utx
" Maintainer:       V. Efimov <avd@reduct.ru>
" Latest Revision:  2017-10-10
" Changes:          2017-10-26

if exists("b:current_syntax")
  finish
endif
let b:current_syntax = "handlers_utx"

syn region comment start=/;/ end=/$/
syn region commandRegion start=/^\s\+\(Send\|Receive\|Verify\|Try\|Raise\|Invoke\|Answer\|Call\).*\n\z(\s\+\)\S/ end=/^\%(\z1\s*\)\@!\s*\S/me=s-1 keepend fold contains=commandRegion,keywords,messageHeader,log_command,commandRegion,comment,address
syn keyword keywords Receive Send Call Verify Invoke Await Answer Raise Set contained
syn keyword logicalConstants True False
syn region address start=/<\a/ end=/>/ contained
syn region messageHeader start=/^\z(\s\+\)\w\+\%(\.\w\+\)\+ : \d\+\s*$/ end=/^\z1\S/me=s-1 fold contains=messageName,vars,commandRegion keepend contained 
syn region vars start=/^\s\+[0-9a-zA-Z]\+\s*:/ end=/$/ oneline contained contains=variable,enumConstants,number,string,logicalConstants
syn match messageName '\w\+\(\.\w\+\)\+' contained
syn match variable /\w\+\s*:/me=e-1 contained
syn match enumConstants /<\w\+\%(\.\w\+\)\+>/ contained
syn match number 	'\<0x[0-9a-fA-F]*\|\[<[0-9a-fA-F]\+[0-9]\+[0-a-fA-F]*>\]\|\<\d[0-9a-fA-F]*\>' 
syn match number 	'\<0x[0-9a-fA-F]*\|\[<[0-9a-fA-F]\+>\]\|\<[0-9a-fA-F]\+[0-9]\+[0-9a-fA-F]*\>' 
syn match number 	'\<0x[0-9a-fA-F]*\|\[<[0-9a-f]\+>\]\|\<\d[0-9a-fA-F]*\>' 
syn region string 	start=/'/ end=/'/ end=/$/ skip=/\\./ contained
syn region string 	start=/"/ end=/"/ skip=/\\./ contained

hi def link comment Comment
hi def link vars Comment
hi def link messageName Function
hi def link keywords Keyword
hi def link logicalConstants Keyword
hi def link address Address
hi def link enumConstants PreProc

