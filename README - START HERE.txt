iPad Screen Mirror (with pen)
=============================

SETUP (one time)
  1. Right-click the zip > Extract All.
  2. Open the extracted folder and double-click  Install.bat
     - Installs to your user folder (no admin needed) and adds a desktop icon + Start menu entries.
     - At the end it offers to open Settings: check the name and the PIN, then click
       "Save and restart mirror". Write down your PIN - your iPad asks for it when it connects.
  3. If Windows says "Windows protected your PC": click More info > Run anyway.
  4. The first time, the mirror app may ask to install "Bonjour" - say yes (it lets the iPad find your PC).

USE
  Double-click "iPad Screen Mirror" on the desktop. The mirror starts (tray icon) and the pen toolbar
  appears at the top of the screen. On the iPad: Control Centre > Screen Mirroring > pick your PC.
  The pen closes by itself when you quit the mirror app.

PEN TOOLBAR
  Drawing ON/OFF   ON = draw on screen. OFF = mouse works normally (drawing stays). Esc = OFF.
  Pen, Highlighter, Eraser
  Line, Arrow, Box, Circle   click and drag
  Text             click, type, Enter. Right-click a label to delete it.
  Colours, S/M/L size
  Undo, Clear (undo brings it back), Hide/Show
  Board            Off > White > Grid > Dark  (a whiteboard to work things out on)
  Pages            "+ Page" for a blank page, < > to flip between pages
  Follow mirror    sticks the drawing to the iPad window (turn on BEFORE drawing)
  Record           video of screen + drawing -> Videos\iPad Mirror Recordings (no sound, 15 fps)
  Save image       picture -> Pictures\iPad Mirror Drawings
  ?                help.   X  closes the pen.
  The toolbar itself doesn't show up in recordings/screenshots (Windows 10 2004 or newer).

SHORTCUTS (work from any app while the pen is open)
  Ctrl+Shift+1 drawing on/off     Ctrl+Shift+4 next board style
  Ctrl+Shift+2 undo               Ctrl+Shift+5 hide/show drawing
  Ctrl+Shift+3 clear page         Ctrl+Shift+6 start/stop recording

SETTINGS  (Start menu > iPad Screen Mirror > Mirror settings)
  Name the iPad sees, PIN, quality (Standard / Smooth 60fps / 4K), rotate/flip,
  audio delay, full screen. The mirror app's own tray menu still works too.

WITHOUT INSTALLING
  "Start iPad Mirror with Pen.bat" and "Mirror Settings.bat" run straight from this folder.

UNINSTALL
  Start menu > iPad Screen Mirror > Uninstall. (Bonjour, if installed, stays: remove it from
  Settings > Apps if you want.)

Based on uxplay-windows / UxPlay (open source, see LICENSE.rtf).
