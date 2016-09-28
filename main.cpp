#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "fileio.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));
    qmlRegisterType<FileIO,1>("FileIO",1,0,"FileIO");

    return app.exec();
}
