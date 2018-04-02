#include <QtGui/QApplication>
#include <QDeclarativeItem>
#include "qmlapplicationviewer.h"
#include "mainpage.h"

Q_DECL_EXPORT int main(int argc, char *argv[])
{
    QScopedPointer<QApplication> app(createApplication(argc, argv));

    QmlApplicationViewer viewer;
    viewer.setOrientation(QmlApplicationViewer::ScreenOrientationAuto);
    viewer.setMainQmlFile(QLatin1String("qml/TestApp15/main.qml"));
    viewer.showExpanded();

    // Get the QML root object for signal-slot connections.
    QObject *qml = viewer.rootObject();

    // Create the back-end processor and pass in the root object.
    // Make viewer the parent object.
    new MainPage(qml,&viewer);

    return app->exec();
}
