#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <GlobalStorage.h>
#include <Communication.h>
#include <Utility/Singleton.hpp>
#include <ChineseChessServer.h>
#include <QtQml>
#include <QTimer>


int main(int argc, char *argv[])
{
    QTimer timer;
    timer.callOnTimeout([](){std::cout<<"timer call"<<std::endl;});
    timer.start(1000);


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
