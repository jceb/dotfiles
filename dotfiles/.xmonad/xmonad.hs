{-# LANGUAGE MultiWayIf     #-}
{-# LANGUAGE NamedFieldPuns #-}
module Main where

import           XMonad                                hiding ((|||))
import qualified XMonad.Prelude                        as Pre
import           XMonad.Prelude                        hiding ((!?))
-- import XMonad.Layout hiding ( (|||) )
import           XMonad.Actions.CycleWorkspaceByScreen
import           XMonad.Actions.CycleWS
import           XMonad.Hooks.DynamicLog
-- import           XMonad.Hooks.DynamicProperty
import           XMonad.Hooks.OnPropertyChange
import           XMonad.Hooks.EwmhDesktops             (ewmh, ewmhFullscreen)
import           XMonad.Hooks.ManageDocks
import           XMonad.Hooks.ManageHelpers
import           XMonad.Hooks.SetWMName
import           XMonad.Hooks.WorkspaceHistory         (workspaceHistoryHook)
import           XMonad.Layout.CenteredMaster
import           XMonad.Layout.Fullscreen              (fullscreenFull,
                                                        fullscreenManageHook)
import qualified XMonad.Util.ExtensibleConf            as XC
-- import XMonad.Layout.Grid
import           Data.Map                              as M
import           System.IO
import           XMonad.Layout.GridVariants
import           XMonad.Layout.LayoutCombinators
-- http://hackage.haskell.org/package/xmonad-contrib/docs/XMonad-Layout-Maximize.html
import           XMonad.Layout.Maximize
import           XMonad.Layout.NoBorders
import           XMonad.Layout.Renamed
import XMonad.Layout.FocusTracking
import           XMonad.Layout.SimplestFloat
-- import           XMonad.Layout.StateFull
import           XMonad.Layout.TrackFloating
import qualified XMonad.StackSet                       as W
import           XMonad.Util.EZConfig                  (additionalKeys,
                                                        removeKeys)
import           XMonad.Util.NamedScratchpad
import           XMonad.Util.Run                       (spawnPipe)

-- myewmhDesktopsEventHookCustom  handle function
import qualified Data.Monoid                           as DM
import qualified XMonad.Util.ExtensibleState           as XS
import           XMonad.Util.WorkspaceCompare
import           XMonad.Util.XUtils                    (fi)

toggleFloat :: Window -> X ()
toggleFloat w = do
    floats <- gets (W.floating . windowset)
    if w `M.member` floats
    then withFocused $ windows . W.sink
    else float w

swapMasterOrSlave :: W.StackSet i l a s sd -> W.StackSet i l a s sd
swapMasterOrSlave = W.modify' $ \c -> case c of
    W.Stack _ [] [] -> c    -- already master.
    W.Stack t [] rs -> W.Stack x [] (t:xs) where (x:xs) = rs  -- swap master with next window - optimum would be to swap it with a previously swapped window
    W.Stack t ls rs -> W.Stack t [] (x:xs ++ rs) where (x:xs) = reverse ls

-- myDynamicPropertyChange :: String -> ManageHook -> Event -> X All
-- myDynamicPropertyQuery prop hook PropertyEvent { ev_window = w, ev_atom = a, ev_propstate = ps } = do
--   pa <- getAtom prop
--   when (ps == propertyNewValue && a == pa) $ do
--     g <- appEndo <$> userCodeDef (Endo id) (runQuery hook w)
--     windows g
--   return mempty -- so anything else also processes it
-- myDynamicPropertyQuery _ _ _ = return mempty
-- myDynamicTitle :: ManageHook -> Event -> X All
-- myDynamicTitle = myDynamicPropertyQuery "_NET_WM_NAME"

scratchpads = [
  NS "standardnotes" "/etc/profiles/per-user/jceb/bin/standardnotes" (className =? "Standard Notes") (customFloating $ W.RationalRect (1/20) (1/20) (9/10) (9/10)),
  -- NS "thingking" "firefox --new-window https://noteself.org/online/" (title =? "thingking — JC's thinking system — Mozilla Firefox") (customFloating $ W.RationalRect (1/20) (1/20) (18/20) (18/20)),
  -- NS "thingking" "firefox --new-window https://noteself.org/online/" (title =? "thingking") (customFloating $ W.RationalRect (1/20) (1/20) (18/20) (18/20)),
  -- NS "thingking" "firefox --new-window https://noteself.org/online/" (className =? "firefox") (customFloating $ W.RationalRect (1/20) (1/20) (18/20) (18/20)),
  NS "journal" "xournalpp" (className =? "Xournalpp") (customFloating $ W.RationalRect (1/20) (1/20) (18/20) (18/20)),
  NS "floating-terminal" "/home/jceb/.local/bin/yeahtmux" (className =? "Floating.Terminal") (customFloating $ W.RationalRect (1/40) (1/40) (19/20) (1/2))
  -- NS "floating-terminal" "/etc/profiles/per-user/jceb/bin/alacritty --class Floating.Terminal --title Floating.Terminal -e tmux new-session -A -t yeah" (title =? "Floating.Terminal") (customFloating $ W.RationalRect (1/40) (1/40) (19/20) (1/2))
  -- NS "floating-terminal-fullscreen" "alacritty --class Floating.Terminal --title Floating.Terminal -e tmux new-session -A -t yeah" (title =? "Floating.Terminal") (customFloating $ W.RationalRect (1/40) (1/40) (19/20) (19/20))
  ]

main = do
  xmonad $ docks . ewmhFullscreen . myewmhDesktopsEventHookConfig . ewmh $ def
    { manageHook =  myManageHook <+> manageHook def
    -- { manageHook =  manageHook def
    , layoutHook = myLayoutHook
    -- , handleEventHook =  myewmhDesktopsEventHookCustom id <+> dynamicPropertyChange "WM_NAME" myManageHook <+> handleEventHook def
    , startupHook = setWMName "LG3D"
    , logHook = workspaceHistoryHook <+> logHook def
    , borderWidth = 1
    , focusedBorderColor = "#8b008b"
    , normalBorderColor  = "#4D4D4C"
    , modMask = mod4Mask
    -- , terminal = "/home/jceb/.local/bin/x-terminal-emulator"
    } `removeKeys` [(mod4Mask, xK_space), (mod4Mask, xK_comma), (mod4Mask, xK_period), (mod4Mask, xK_w), (mod4Mask, xK_e), (mod4Mask, xK_r), (mod4Mask, xK_p), (mod4Mask .|. shiftMask, xK_p), (mod4Mask .|. shiftMask, xK_w), (mod4Mask .|. shiftMask, xK_e), (mod4Mask .|. shiftMask, xK_r), (mod4Mask .|. shiftMask, xK_Return)] `additionalKeys` myAdditionalKeys

-- https://github.com/xmonad/xmonad-contrib/issues/776
data EwmhDesktopsConfig =
    EwmhDesktopsConfig
        { workspaceSort   :: X WorkspaceSort
            -- ^ configurable workspace sorting/filtering
        , workspaceRename :: X (String -> WindowSpace -> String)
            -- ^ configurable workspace rename (see 'XMonad.Hooks.StatusBar.PP.ppRename')
        , activateHook    :: ManageHook
            -- ^ configurable handling of window activation requests
        }

instance Default EwmhDesktopsConfig where
    def = EwmhDesktopsConfig
        { workspaceSort = getSortByIndex
        , workspaceRename = pure pure
        , activateHook = doFocus
        }
myewmhDesktopsEventHookConfig :: XConfig a -> XConfig a
myewmhDesktopsEventHookConfig c = c { handleEventHook = myewmhDesktopsEventHook <> handleEventHook c }

myewmhDesktopsEventHook :: Event -> X All
myewmhDesktopsEventHook = XC.withDef . myewmhDesktopsEventHookCustom

-- only change: swap W.view with W.greedyView so that a click on the taskbar
-- leads to the current tag being changed to the selected one
myewmhDesktopsEventHookCustom :: Event -> EwmhDesktopsConfig -> X All
myewmhDesktopsEventHookCustom
        ClientMessageEvent{ev_window = w, ev_message_type = mt, ev_data = d}
        EwmhDesktopsConfig{workspaceSort, activateHook} =
    withWindowSet $ \s -> do
        sort' <- workspaceSort
        let ws = sort' $ W.workspaces s

        a_cd <- getAtom "_NET_CURRENT_DESKTOP"
        a_d <- getAtom "_NET_WM_DESKTOP"
        a_aw <- getAtom "_NET_ACTIVE_WINDOW"
        a_cw <- getAtom "_NET_CLOSE_WINDOW"

        if  | mt == a_cd, n : _ <- d, Just ww <- ws Pre.!? fi n ->
                if W.currentTag s == W.tag ww then mempty else windows $ W.greedyView (W.tag ww)
            | mt == a_cd ->
                trace $ "Bad _NET_CURRENT_DESKTOP with data=" ++ show d
            | mt == a_d, n : _ <- d, Just ww <- ws Pre.!? fi n ->
                if W.findTag w s == Just (W.tag ww) then mempty else windows $ W.shiftWin (W.tag ww) w
            | mt == a_d ->
                trace $ "Bad _NET_WM_DESKTOP with data=" ++ show d
            | mt == a_aw, 2 : _ <- d ->
                -- when the request comes from a pager, honor it unconditionally
                -- https://specifications.freedesktop.org/wm-spec/wm-spec-1.3.html#sourceindication
                if W.peek s == Just w then mempty else windows $ W.focusWindow w
            | mt == a_aw -> do
                if W.peek s == Just w then mempty else windows . appEndo =<< runQuery activateHook w
            | mt == a_cw ->
                killWindow w
            | otherwise ->
                -- The Message is unknown to us, but that is ok, not all are meant
                -- to be handled by the window manager
                mempty

        mempty
myewmhDesktopsEventHookCustom _ _ = mempty
-- -- myewmhDesktopsEventHookCustom END

myManageHook = manageDocks <+> composeAll
               [
               isFullscreen --> doFullFloat
               , isDialog --> doCenterFloat
               -- , title =? "thingking — JC's thinking system — Mozilla Firefox" --> doFloat
               , className =? "Calendar" --> doFloat
               , className =? "copyq" --> doRectFloat (W.RationalRect (11/20) (1/20) (8/20) (8/20))
               , className =? "Empathy" --> doFloat
               , className =? "Floating.Terminal" --> doRectFloat (W.RationalRect (1/40) (1/40) (19/20) (1/2))
               -- , className =? "Floating.Terminal" --> doFloat
               , className =? "Gajim" --> doFloat
               , className =? "Hexchat" --> doFloat
               , className =? "Jitsi" --> doFloat
               , className =? "Kio_uiserver" --> doFloat
               , className =? "pavucontrol" --> doFloat
               , className =? "Pidgin" --> doFloat
               , className =? "Psi-plus" --> doFloat
               , className =? "Rainlendar2" --> doFloat
               , className =? "Riot" --> doFloat
               , className =? "Scratchpad" --> doFloat
               , className =? "xournalpp" --> doFloat
               , className =? "Skype" --> doFloat
               -- , className =? "Standard Notes" --> doFloat
               , className =? "Turpial" --> doFloat
               , className =? "Xchat" --> doFloat
               , className =? "krunner" --> doFloat
               , className =? "skypeforlinux" --> doFloat
               , className =? "Yeahconsole" --> doFloat
               , className =? "linphone" --> doFloat
               , className =? "zoom" --> doFloat
               , className =? "ramboxpro" --> doShift "1"
               , className =? "nsp" --> doShift "NSP"
               -- , className =? "Thunderbird" --> doShift "8"
               ] <+> namedScratchpadManageHook scratchpads <+> fullscreenManageHook

-- myLayoutHook = avoidStruts $ renamed [Replace "tiled"] (focusTracking $ maximizeWithPadding 1 $ smartBorders $ Tall 1 (3/100) (2/3))
myLayoutHook = avoidStruts $ renamed [Replace "tiled"] (focusTracking $ maximizeWithPadding 1 $ smartBorders $ Tall 1 (3/100) (2/3))
               -- ||| renamed [Replace "grid"] (focusTracking $ maximizeWithPadding 1 $ smartBorders $ Grid (16/9))
               ||| renamed [Replace "grid"] (maximizeWithPadding 1 $ smartBorders $ Grid (16/9))
               -- ||| renamed [Replace "master"] (focusTracking $ centerMaster $ smartBorders $ Grid (16/9))
               ||| renamed [Replace "master"] (centerMaster $ smartBorders $ Grid (16/9))
               -- ||| renamed [Replace "grid"] (focusTracking $ maximizeWithPadding 1 $ smartBorders $ TallGrid 2 3 (2/3) (16/9) (5/100))
               -- ||| renamed [Replace "master"] (focusTracking $ centerMaster $ smartBorders $ TallGrid 2 3 (2/3) (16/9) (5/100))
               -- ||| renamed [Replace "full"] (fullscreenFull $ noBorders StateFull)
               -- ||| renamed [Replace "full"] (fullscreenFull $ noBorders TrackFloating)
               ||| renamed [Replace "full"] (focusTracking $ fullscreenFull $ noBorders Full)
               ||| renamed [Replace "float"] (smartBorders simplestFloat)


myAdditionalKeys =
  -- dwm style layout bindings
  [ ((mod4Mask, xK_m ), sendMessage $ JumpToLayout "full")
  -- , ((mod4Mask, xK_m ), withFocused (sendMessage . maximizeRestore))
  , ((mod4Mask, xK_t ), sendMessage $ JumpToLayout "tiled")
  , ((mod4Mask, xK_f ), sendMessage $ JumpToLayout "float")
  , ((mod4Mask, xK_g ), sendMessage $ JumpToLayout "grid")
  , ((mod4Mask, xK_y ), sendMessage $ JumpToLayout "master")
  , ((mod4Mask, xK_b ), sendMessage $ ToggleStrut U)
  , ((mod4Mask, xK_0 ), moveTo Next emptyWS)
  , ((mod4Mask, xK_grave ), moveTo Prev emptyWS)
  , ((mod4Mask, xK_c ), kill)
  , ((mod4Mask, xK_Return), windows swapMasterOrSlave)
  -- , ((mod4Mask .|. shiftMask, xK_Return), spawn "/home/jceb/.local/bin/x-terminal-emulator")
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
  , ((mod4Mask .|. shiftMask, xK_comma), shiftPrevScreen)
  , ((mod4Mask .|. shiftMask, xK_period), shiftNextScreen)
  -- , ((mod4Mask, xK_Tab), toggleWS)
  , ((mod4Mask, xK_Tab), cycleWorkspaceOnCurrentScreen [xK_Super_L, xK_Super_R] xK_Tab xK_grave)
  , ((mod4Mask, xK_i), sendMessage (IncMasterN 1)) -- %! Increment the number of windows in the master area
  , ((mod4Mask, xK_o), sendMessage (IncMasterN (-1))) -- %! Deincrement the number of windows in the master area
  , ((mod4Mask .|. shiftMask, xK_equal), sendMessage $ IncMasterCols 1)
  , ((mod4Mask .|. shiftMask, xK_minus), sendMessage $ IncMasterCols (-1))
  , ((mod4Mask .|. controlMask, xK_equal), sendMessage $ IncMasterRows 1)
  , ((mod4Mask .|. controlMask, xK_minus), sendMessage $ IncMasterRows (-1))
  , ((mod4Mask .|. shiftMask, xK_m), windows W.focusMaster) -- %! Move focus to the master window
  , ((mod1Mask, xK_space), namedScratchpadAction scratchpads "floating-terminal")
  -- , ((mod1Mask .|. controlMask, xK_space), namedScratchpadAction scratchpads "floating-terminal-fullscreen")
  , ((mod4Mask, xK_space), namedScratchpadAction scratchpads "standardnotes")
  -- , ((mod4Mask  .|. mod1Mask, xK_space), namedScratchpadAction scratchpads "thingking")
  , ((mod4Mask .|. controlMask, xK_space), namedScratchpadAction scratchpads "journal")
  ]
