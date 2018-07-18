module Main where

import XMonad hiding ( (|||) )
-- import XMonad.Layout hiding ( (|||) )
import XMonad.Actions.CycleWS
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops (ewmh)
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.SetWMName
import XMonad.Hooks.WorkspaceHistory (workspaceHistoryHook)
import XMonad.Layout.CenteredMaster
import XMonad.Layout.Fullscreen
import XMonad.Layout.Grid
import XMonad.Layout.LayoutCombinators
-- import XMonad.Layout.Maximize
-- http://hackage.haskell.org/package/xmonad-contrib-0.13/docs/XMonad-Layout-Maximize.html
import XMonad.Layout.NoBorders
import XMonad.Layout.Renamed
import XMonad.Layout.SimplestFloat
import XMonad.Util.EZConfig (additionalKeys, removeKeys)
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.NamedScratchpad
import qualified XMonad.StackSet as W
import System.IO
import Data.Map as M

-- TODO
-- - [90%] make s-enter swap master

toggleFloat :: Window -> X ()
toggleFloat w = do
    floats <- gets (W.floating . windowset)
    if w `M.member` floats
    then withFocused $ windows . W.sink
    else float w

swapMasterOrSlave :: W.StackSet i l a s sd -> W.StackSet i l a s sd
swapMasterOrSlave = W.modify' $ \c -> case c of
    W.Stack _ [] []  -> c    -- already master.
    W.Stack t [] rs -> W.Stack x [] (t : xs) where (x:xs) = rs  -- swap master with next window - optimum would be to swap it with a previously swapped window
    W.Stack t ls rs -> W.Stack t [] (xs ++ x : rs) where (x:xs) = reverse ls

scratchpads = [
  NS "default" "nvim-qt" (className =? "nvim-qt") (customFloating $ W.RationalRect (1/6) (1/6) (2/3) (2/3))
  ]

main = do
  xmonad $ docks $ ewmh def
    { manageHook =  myManageHook <+> manageHook def
    , layoutHook = myLayoutHook
    , handleEventHook =  myHandleEventHook <+> handleEventHook def
    , startupHook = setWMName "LG3D"
    , logHook = workspaceHistoryHook <+> logHook def
    , borderWidth = 1
    , focusedBorderColor = "#D7005F"
    , normalBorderColor  = "#4D4D4C"
    , modMask = mod4Mask
    , terminal = "x-terminal-emulator"
    } `removeKeys` [(mod4Mask, xK_space), (mod4Mask, xK_comma), (mod4Mask, xK_period)] `additionalKeys` myAdditionalKeys

myHandleEventHook = fullscreenEventHook

myManageHook = manageDocks <+> composeAll
               [ className =? "Copyq" --> doFloat
               , className =? "Empathy" --> doFloat
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
               ] <+> namedScratchpadManageHook scratchpads <+> fullscreenManageHook

myLayoutHook = avoidStruts (renamed [Replace "tiled"] (smartBorders $ Tall 1 (3/100) (2/3)))
               ||| avoidStruts (renamed [Replace "grid"] (smartBorders Grid))
               ||| avoidStruts (renamed [Replace "master"] (centerMaster $ smartBorders Grid))
               ||| renamed [Replace "full"] (fullscreenFull $ noBorders Full)
               ||| renamed [Replace "float"] (smartBorders simplestFloat)

myAdditionalKeys =
  -- dwm style layout bindings
  [ ((mod4Mask, xK_m ), sendMessage $ JumpToLayout "full")
  , ((mod4Mask, xK_t ), sendMessage $ JumpToLayout "tiled")
  , ((mod4Mask, xK_f ), sendMessage $ JumpToLayout "float")
  , ((mod4Mask, xK_g ), sendMessage $ JumpToLayout "grid")
  , ((mod4Mask, xK_y ), sendMessage $ JumpToLayout "master")
  , ((mod4Mask, xK_Return), windows swapMasterOrSlave)
  , ((mod4Mask .|. shiftMask, xK_space), withFocused toggleFloat)
  , ((mod4Mask, xK_Left), prevWS)
  , ((mod4Mask, xK_Right), nextWS)
  , ((mod4Mask .|. shiftMask, xK_Left), shiftToPrev)
  , ((mod4Mask .|. shiftMask, xK_Right), shiftToNext)
  , ((mod4Mask, xK_Down), prevScreen)
  , ((mod4Mask, xK_Up), nextScreen)
  , ((mod4Mask, xK_comma), prevScreen)
  , ((mod4Mask, xK_period), nextScreen)
  , ((mod4Mask .|. shiftMask, xK_Down), shiftPrevScreen)
  , ((mod4Mask .|. shiftMask, xK_Up), shiftNextScreen)
  , ((mod4Mask, xK_Tab), toggleWS)
  , ((mod4Mask, xK_i), sendMessage (IncMasterN 1)) -- %! Increment the number of windows in the master area
  , ((mod4Mask, xK_o), sendMessage (IncMasterN (-1))) -- %! Deincrement the number of windows in the master area
  , ((mod4Mask .|. shiftMask, xK_m), windows W.focusMaster) -- %! Move focus to the master window
  , ((mod4Mask, xK_space), namedScratchpadAction scratchpads "default")
  ]
