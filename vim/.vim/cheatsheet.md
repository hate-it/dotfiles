# VIM Cheat Sheet

R - replace mode

H - move to top of screen
M - move to middle of screen
L - move to bottom of screen

J - join two lines into one

w/W - jump forwards to start of word
e/E - jump forwards to end of word
b/B - jump backwards to start of word

0 - jump start of line
$ - jump end of line

cc - change current line
c0 - change to beginning of line

:w !sudo tee % - write current file using sudo


:cn[ext] - jump to the next match
:cp[revious] - jump to the previous match
:cope[n] - open a window containing the list of matches
:ccl[ose] - close the quickfix window
 
^L - redraw screen

mx               - place bookmark
'x(Apostrophe.)  - Moves the cursor to the first character of the line marked by x.
`x(Backquote.)   - Moves the cursor to the character marked by x.
``(Backquotes.)  - Returns to the exact position of the previous mark or context aftera move.
''(Apostrophes.) - Returns to the beginning of the line of the previos mark or context

"+    - clipboard buffer
"*    - Primary Selection buffer
