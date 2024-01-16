# IMPORTS

# tk is GUI presentation and control
import tkinter as tk

# Declare arrays to store info
winID = []
winXpos = []
winYpos = []
winHeight = []
winWidth = []

# MAIN

window = tk.Tk()

greeting = tk.Label(text="Hello world!")

# required by Tkinter. Tells it to run the main event loop.
# Tk will NOT run without this line
window.mainloop()
