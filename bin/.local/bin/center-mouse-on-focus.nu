#!/usr/bin/env -S nu

# Center mouse on window with currently active focus
def main [] {
  # print (xdotool getwindowgeometry (xdotool getactivewindow))

  let res = xdotool getwindowgeometry (xdotool getactivewindow) | lines | enumerate |
    reduce --fold {} {|v, acc|
      if $v.index == 0 {
        $acc | insert id ($v.item | split column " " | $in.column2 | get 0)
      } else if $v.index == 1 {
        $acc | insert position ($v.item | parse -r "(?P<x>[0-9]+),(?P<y>[0-9]+)" | each {|e| {x: ($e.x | into int), y: ($e.y | into int)}} | get 0)
      } else if $v.index == 2 {
        $acc | insert geometry ($v.item | parse -r "(?P<x>[0-9]+)x(?P<y>[0-9]+)" | each {|e| {x: ($e.x | into int), y: ($e.y | into int)}} | get 0)
      } else { $acc }
    }
  # $res | inspect
  xdotool mousemove -w $res.id ($res.geometry.x / 2) ($res.geometry.y / 2)
}
