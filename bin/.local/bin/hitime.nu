#!/usr/bin/env nu

def main [time: duration = 30sec, message: string = "time's up", ...rest] {
  let full_message = ([$message] | append $rest | str join " ")
  print $"The timer will be up at (date now | $in + $time)"
  sleep $time
  notify-send -t 600000 -e -a HiTime $full_message
}
