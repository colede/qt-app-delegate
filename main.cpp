#include <QtGui/QGuiApplication>
#include "qtquick2applicationviewer.h"
#include "QtAppDelegate-C-Interface.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QtAppDelegateInitialize();
    QtQuick2ApplicationViewer viewer;
    viewer.setMainQmlFile(QStringLiteral("qml/qt-app-delegate/main.qml"));
    viewer.showExpanded();

    return app.exec();
}
