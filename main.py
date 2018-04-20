from PyQt5.QtCore import pyqtProperty, QRectF, QUrl
from PyQt5.QtGui import QColor, QGuiApplication, QPainter, QPen
from PyQt5.QtQml import qmlRegisterType
from PyQt5.QtQuick import QQuickPaintedItem, QQuickView

if __name__ == '__main__':
    import os
    import sys

    app = QGuiApplication(sys.argv)
    view = QQuickView()
    view.setResizeMode(QQuickView.SizeRootObjectToView)
    view.setSource(QUrl.fromLocalFile(os.path.join(os.path.dirname(__file__),'staticRoute.qml')))
    view.show()
    sys.exit(app.exec_())
