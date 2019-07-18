import XMonad
import XMonad.Hooks.SetWMName
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Layout.NoBorders
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import Graphics.X11.ExtraTypes.XF86
import System.IO
import qualified XMonad.StackSet as W
import Control.Monad (liftM2)

myManageHook = composeAll
  [ className =? "Chromium-browser"  --> viewShift "="
  , resource  =? "desktop_window"    --> doIgnore
  , className =? "Galculator"        --> doFloat
  , className =? "trayer"            --> doIgnore
  , className =? "stalonetray"       --> doIgnore
  , className =? "Firefox"           --> viewShift "1:web"
  , className =? "Atom"              --> viewShift "4:atom"
  , className =? "jetbrains-idea-ce" --> viewShift "3:idea"
  , className =? "URxvt"             --> viewShift "2:term"
  , manageDocks
  ]
  where viewShift = doF . liftM2 (.) W.greedyView W.shift

myWorkspaces = ["1:web","2:term","3:idea","4:atom","5","6","7","8","9","0","-","="]

main = do
    xmproc <- spawnPipe "xmobar"
    xmonad $ defaultConfig
        { manageHook      = myManageHook <+> manageHook defaultConfig
        , layoutHook      = avoidStruts  $  layoutHook defaultConfig
        , handleEventHook = handleEventHook defaultConfig <+> docksEventHook
        , logHook = dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "green" "" . shorten 50
                        , ppCurrent = xmobarColor "red" ""
                        }
        , modMask = mod4Mask     -- Rebind Mod to the Windows key
        , startupHook = setWMName "LG3D" -- wor
        , terminal = "urxvt"
        , focusFollowsMouse = False
        , normalBorderColor = "#000000"
        , focusedBorderColor = "#940099"
        , borderWidth = 1
        , workspaces = myWorkspaces
        } `additionalKeys`
        [ ((mod4Mask .|. shiftMask, xK_z), spawn "dm-tool lock")
        , ((0 , xF86XK_AudioLowerVolume), spawn "amixer set Master on && amixer sset Master 2%-")
        , ((0 , xF86XK_AudioRaiseVolume), spawn "amixer set Master on && amixer sset Master 2%+")
        , ((0 , xF86XK_AudioMute), spawn "amixer set Master toggle")
        ]
