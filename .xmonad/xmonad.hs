{-import XMonad hiding (Tall)-}
import XMonad hiding ( (|||) )
import XMonad.Config.Gnome
import XMonad.Actions.CycleWS as C
import XMonad.Config.Desktop
import XMonad.Hooks.FadeInactive
import XMonad.Hooks.SetWMName
import XMonad.Layout.NoBorders
import XMonad.Layout.Named
import XMonad.Util.Scratchpad
-- import XMonad.Layout.HintedTile
import XMonad.Layout.LayoutCombinators
import qualified Data.Map as M
import qualified XMonad.StackSet as W

	 {-layoutHook = desktopLayoutModifiers . smartBorders $ tiled ||| Full,-}
	{-xmproc <- spawnPipe "/usr/bin/xmobar /home/jceb/.xmobarrc"-}

-- mylayoutHook = desktopLayoutModifiers $ smartBorders (HintedTile 1 0.03 0.5 TopLeft Tall) ||| desktopLayoutModifiers $ noBorders Full
-- mylayoutHook = desktopLayoutModifiers $ (smartBorders (Tall 1 0.03 0.5)) ||| desktopLayoutModifiers $ (noBorders (Full))
mylayoutHook = desktopLayoutModifiers (named "my tiled" (smartBorders (Tall 1 0.03 0.5)) ||| named "my fullscreen" (noBorders (Full)))
main = do
	xmonad $ gnomeConfig {
	layoutHook = mylayoutHook,
	modMask = mod4Mask,
	terminal = "x-terminal-emulator",
	keys = \c -> myKeys c `M.union` keys desktopConfig c,
	startupHook = startupHook gnomeConfig >> setWMName "LG3D",
	logHook = logHook desktopConfig >> fadeInactiveLogHook 0xcccccccc,
	manageHook = myManageHook <+> manageHook gnomeConfig,
	workspaces = map show [1..10],
	focusedBorderColor = "#ff0000",
	normalBorderColor = "#aaaaaa"
	-- moving workspaces
}

-- tiled = HintedTile 1 0.03 0.5 TopLeft Tall

myKeys conf@(XConfig {modMask = modm}) = M.fromList $
	[((modm, xK_semicolon), sendMessage (IncMasterN (-1))),
	((mod4Mask, xK_Tab), C.toggleWS),
	-- ((mod1Mask .|. shiftMask, xK_Tab), windows W.focusUp),
	-- ((mod1Mask, xK_Tab), windows W.focusDown),
	((mod4Mask, xK_i), sendMessage NextLayout),
	((mod4Mask, xK_f), sendMessage $ JumpToLayout "my fullscreen"),
	((mod4Mask, xK_d), sendMessage $ JumpToLayout "my tiled"),
	((mod4Mask, xK_Left),    prevWS ),
	((mod4Mask, xK_Right),   nextWS ),
	((mod4Mask, xK_space),   scratchpadSpawnAction conf ),
	((mod4Mask .|.shiftMask, xK_Left),  shiftToPrev ),
	((mod4Mask .|.shiftMask, xK_Right), shiftToNext )] ++
	[((m .|. modm, k), windows $ f i)
	| (i, k) <- zip (workspaces conf) numBepo,
	(f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]

-- numBepo = [0x22,0xab,0xbb,0x28,0x29,0x40,0x2b,0x2d,0x2f,0x2a]
numBepo = [0x31,0x32,0x33,0x34,0x35,0x36,0x37,0x38,0x39,0x30]
numAzerty = [0x26,0xe9,0x22,0x27,0x28,0x2d,0xe8,0x5f,0xe7,0xe0]

myManageHook = scratchpadManageHook (W.RationalRect 0.25 0.25 0.5 0.5)
-- myManageHook = composeAll [className =? c --> doShift w | (w, cs) <- wcs, c <- cs]
-- 	where wcs = [("2", ["Midori", "Firefox"]),
-- 				("3", ["Gajim.py"]),
-- 				("4", ["Claws-mail"]),
-- 				("5", ["Gmpc"])]
