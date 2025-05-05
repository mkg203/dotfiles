#!/bin/fish

ps -e | rg caffeine > /dev/null

if test $status -eq 1
  caffeine & disown
else
  echo hi
  killall caffeine
end
