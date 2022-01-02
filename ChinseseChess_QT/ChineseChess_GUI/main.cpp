#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <GlobalStorage.h>
#include <Utility/Singleton.hpp>
#include <Communication.h>
#include <QtQml>
#include <VsChineseChess.h>

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    getSingleton(GlobalStorage).engine=&engine;
    engine.rootContext()->setContextProperty("Communication",&getSingleton(Communication));
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
