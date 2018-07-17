module Main where

import XMonad hiding ( (|||) )
-- import XMonad.Layout hiding ( (|||) )
import XMonad.Actions.CycleWS
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops (ewmh)
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.SetWMName
import XMonad.Layout.LayoutCombinators
import XMonad.Layout.Renamed
import XMonad.Layout.NoBorders
import XMonad.Util.EZConfig (additionalKeys, removeKeys)
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.Scratchpad
import qualified XMonad.StackSet as W
import System.IO
-- import System.Taffybar.Support.PagerHints (pagerHints)

import XMonad.Layout.Grid
import XMonad.Layout.Fullscreen
import XMonad.Layout.SimplestFloat
import XMonad.Layout.CenteredMaster
-- import XMonad.Layout.Maximize
-- http://hackage.haskell.org/package/xmonad-contrib-0.13/docs/XMonad-Layout-Maximize.html

-- TODO
-- - add scratchpad
-- - add scratchpad

main = do
    -- xmproc <- spawnPipe "taffybar"
    -- xmonad $ docks $ ewmh $ pagerHints def
    xmonad $ docks $ ewmh def
       { manageHook =  myManageHook
       , layoutHook = myLayoutHook
       , handleEventHook = fullscreenEventHook
       , startupHook = setWMName "LG3D"
       , borderWidth = 1
       , focusedBorderColor = "#D7005F"
       , normalBorderColor  = "#4D4D4C"
       , modMask = mod4Mask
       , terminal = "x-terminal-emulator"
       } `additionalKeys` myAdditionalKeys `removeKeys` [(mod4Mask, xK_space)]

myManageHook = manageDocks <+> composeAll
	[ className =? "Copyq" --> doFloat
	, className =? "Empathy" --> doFloat
	, className =? "Firefox" --> doFloat
	, className =? "Gajim" --> doFloat
	, className =? "Gimp" --> doFloat
	, className =? "Hexchat" --> doFloat
	, className =? "Jitsi" --> doFloat
	, className =? "Kio_uiserver" --> doFloat
	, className =? "Pidgin" --> doFloat
	, className =? "Psi-plus" --> doFloat
	, className =? "Rainlendar2" --> doFloat
	, className =? "Rambox" --> doFloat
	, className =? "Riot" --> doFloat
	, className =? "Scratchpad" --> doFloat
	, className =? "Skype" --> doFloat
	, className =? "Turpial" --> doFloat
	, className =? "Xchat" --> doFloat
	, className =? "copyq" --> doFloat
	, className =? "krunner" --> doFloat
	, className =? "skypeforlinux" --> doFloat
    ] <+> scratchpadManageHook (W.RationalRect 0.5 0.5 0.25 0.25) <+> fullscreenManageHook <+> manageHook def

myLayoutHook = avoidStruts $ renamed [Replace "tiled"] (smartBorders $ Tall 1 (3/100) (2/3))
  ||| renamed [Replace "grid"] (smartBorders Grid)
  ||| renamed [Replace "master"] (centerMaster $ smartBorders Grid)
  ||| renamed [Replace "full"] (fullscreenFull $ noBorders Full)
  ||| renamed [Replace "float"] (smartBorders simplestFloat)

myAdditionalKeys =
        -- dwm style layout bindings
        [ ((mod4Mask, xK_m ), sendMessage $ JumpToLayout "full")
        , ((mod4Mask, xK_t ), sendMessage $ JumpToLayout "tiled")
        , ((mod4Mask, xK_f ), sendMessage $ JumpToLayout "float")
        , ((mod4Mask, xK_g ), sendMessage $ JumpToLayout "grid")
        , ((mod4Mask, xK_y ), sendMessage $ JumpToLayout "master")
        , ((mod4Mask .|. shiftMask, xK_space), withFocused $ windows . W.sink)
        , ((mod4Mask, xK_Left), prevWS)
        , ((mod4Mask, xK_Right), nextWS)
        , ((mod4Mask .|. shiftMask, xK_Left), shiftToPrev)
        , ((mod4Mask .|. shiftMask, xK_Right), shiftToNext)
        , ((mod4Mask, xK_Down), prevScreen)
        , ((mod4Mask, xK_Up), nextScreen)
        , ((mod4Mask .|. shiftMask, xK_Down), shiftPrevScreen)
        , ((mod4Mask .|. shiftMask, xK_Up), shiftNextScreen)
        , ((mod4Mask, xK_Tab), toggleWS)
	, ((mod4Mask, xK_space), scratchpadSpawnActionTerminal "st")
        ]
