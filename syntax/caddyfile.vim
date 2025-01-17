" Language: Caddyfile
" Author:   Josh Glendenning <josh@isobit.io>

if exists("b:current_syntax")
	finish
endif

syn match caddyDirective "^\s*\([a-zA-Z0-9_]\+\)" nextgroup=caddyDirectiveArgs skipwhite
syn region caddyDirectiveArgs start="" end="\({\|#\|$\)"me=s-1 oneline contained contains=caddyPlaceholder,caddyString,caddyNamedMatcher nextgroup=caddyDirectiveBlock skipwhite
syn region caddyDirectiveBlock start="{" skip="\\}" end="}" contained contains=caddySubdirective,caddyComment

syn match caddySubdirective "^\s*\([a-zA-Z0-9_]\+\)" contained nextgroup=caddySubdirectiveArgs skipwhite
syn region caddySubdirectiveArgs start="" end="\(#\|$\)"me=s-1 oneline contained contains=caddyPlaceholder,caddyString,caddyNamedMatcher

syn match caddyHost "\(https\?:\/\/\)\?\(\(\w\{1,}\.\)\(\w\{2,}\.\?\)\+\|localhost\)\(:[0-9]\{1,5}\)\?" nextgroup=caddyHostBlock skipwhite
syn region caddyHostBlock start="{" skip="\\}" end="}" contained contains=caddyDirective,caddyComment

syn region caddyPlaceholder start="{" skip="\\}" end="}" oneline contained
syn region caddyString start='"' skip='\\\\\|\\"' end='"' oneline
syn match caddyComment "#.*$"
syn match caddyNamedMatcher "\(\s\|^\)@[a-z]\+"

hi link caddyDirective Keyword
hi link caddySubdirective Structure
hi link caddyHost Identifier
hi link caddyPlaceholder Special
hi link caddyString String
hi link caddyComment Comment
hi link caddyNamedMatcher Identifier

let b:current_syntax = "caddyfile"
