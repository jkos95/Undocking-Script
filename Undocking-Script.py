# IMPORTS

import sys

#modules needed to create a GUI. QtWidgets contains all major widgets
from PyQt5.QtWidgets import QApplication, QWidget, QLabel, QPushButton, QMessageBox

# Declare arrays to store info
winID = []
winXpos = []
winYpos = []
winHeight = []
winWidth = []

# MAIN

def dialog():
    mbox = QMessageBox()

    mbox.setText("Your allegiance has been noted")
    mbox.setDetailedText("You are now a disciple and subject of the all-knowing Guru")
    mbox.setStandardButtons(QMessageBox.Ok | QMessageBox.Cancel)

    mbox.exec_()

if __name__ == "__main__":

    # create object of QApplication class. All GUIs must create an instance of the QApplication as an entry to the app.
    app = QApplication(sys.argv)

    # create object of the QWidget class and add modifiers below.
    w = QWidget()
    w.resize(350, 200)
    w.setWindowTitle("Undocking Script")

    # creates label for object w and assigns to "label"
    label = QLabel(w)
    label.setText("Behold the Guru, Guru99")
    label.move(100,130)
    label.show()

    # creates button for object w and assigns to "btn"
    btn = QPushButton(w)
    btn.setText('Beheld')
    btn.move(110,150)
    btn.show()
    btn.clicked.connect(dialog)


    # displays widget by object name
    w.show()

    # app.exec_() starts the Qt/C++ event loop. This passes execution from Python over to Qt, and Python will wait until the GUI is closed to proceed.
    sys.exit(app.exec_())
