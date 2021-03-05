from PyQt4.QtGui import *

fqd=QFileDialog()

title="Open File"

path=QgsProject.instance().readPath("./")

f=QFileDialog.getOpenFileName(fqd,title,path)
