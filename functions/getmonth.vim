
function! Getmonth()
  :read !cal | awk '{ print " "$0; getline; print " Mo Tu We Th Fr Sa Su"; getline; if (substr($0,1,2) == " 1") print "                    1 "; do { prevline=$0; if (getline == 0) exit; print " " substr(prevline,4,17) " " substr($0,1,2) " "; } while (1) }'

endfunction
:command! Getmonth :call Getmonth()
