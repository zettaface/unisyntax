" Vim syntax file
" Language:         Protocol.utx
" Maintainer:       V. Efimov
" Latest Revision:  2017-10-10
" Changes:          2017-10-26

if exists("b:current_syntax")
  finish
endif

syn keyword log_command Receive ReceiveAsync Intercept Send Repeat Call DumpCall Switch ActivateUnit If skipwhite contained
syn keyword log_keyword CMD TESTER HOST CORE VERIFY GENERATOR WARRIOR WIKIJET
syn match log_delimiter ' : ' nextgroup=log_command

syn region log_string 	start=/'/ end=/'/ end=/$/ skip=/\\./ contained
syn region log_string 	start=/"/ end=/"/ skip=/\\./ contained
syn region log_address start=/<\a/ end=/>/ 
syn region log_address start=/<\a/ end=/>/ contained
syn match log_number 	'\<0x[0-9a-fA-F]*\|\[<[0-9a-fA-F]\+[0-9]\+[0-a-fA-F]*>\]\|\<\d[0-9a-fA-F]*\>' 
syn match log_number 	'\<0x[0-9a-fA-F]*\|\[<[0-9a-fA-F]\+>\]\|\<[0-9a-fA-F]\+[0-9]\+[0-9a-fA-F]*\>' contained
syn match log_number 	'\<0x[0-9a-fA-F]*\|\[<[0-9a-f]\+>\]\|\<\d[0-9a-fA-F]*\>' contained
syn region cmd_line start=/\[[CMD\|TESTER\|HOST\|CORE\|VERIFY\]]/ end=/$/ contains=cmd_step,log_date,log_time,log_address,log_number,log_command,log_keyword,log_error
syn match cmd_step /\<\d\+\(-[0-9a-zA-Z\-]\+\)*\>/ contained

syn match   log_date '\(Jan\|Feb\|Mar\|Apr\|May\|Jun\|Jul\|Aug\|Sep\|Oct\|Nov\|Dec\) [ 0-9]\d *' 
syn match   log_date '\d\{4}.\d\d.\d\d' 
syn match   log_date '\d\{4}-\d\d-\d\d' 

syn match   log_time '\d\d:\d\d:\d\d\s*' 
syn match   log_time '\d\d:\d\d:\d\d.\d\d\d\s*' 
syn match   log_time '\c\d\d:\d\d:\d\d\(\.\d\+\)\=\([+-]\d\d:\d\d\|Z\)' 

syn match log_error 	'\c.*\<\(FATAL\|ERROR\|ERRORS\|FAIL\|FAILED\|FAILURE\)\>.*'
syn match log_warning 	/.*\c\<\(WARNING\|DELETE\|DELETING\|DELETED\|RETRY\|RETRYING\)\>.*/

syn region log_message start=/:\s/ end=/$/  contains=log_number,log_address,call_string

hi def link log_string 		String
hi def link log_number 		Number
hi def link log_date 		Constant
hi def link log_time 		Constant
hi def link log_error 		ErrorMsg
hi def link log_warning 	WarningMsg
hi def link log_address Statement
hi def link log_message Comment
hi def link log_command Function
hi def link log_keyword Keyword

let b:current_syntax = "protocol_utx"
