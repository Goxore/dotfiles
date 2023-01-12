#!/bin/sh

awesome-client 'awful=require("awful");
  awful.spawn("sxiv \"'$1'\"", {
    floating  = true,
    sticky    = true,
    tag       = mouse.screen.selected_tag,
    placement = awful.placement.bottom_right,
})'
