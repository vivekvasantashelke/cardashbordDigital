#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QObject>
#include<QQmlContext>
#include<QQuickStyle>
#include"VheicleDataSender/VheicleDataSender.h"
#include "DatatetKM/dataEkm.h"
#include "user/userD.h"


static const QString pathfile="C:/Users/admin/Downloads/CarDashbordDisp-main (1)/CarDashbordDisp-main/DashBord_Digital/DashbordData.db";

static const QString pathofuserData="C:/Users/admin/Downloads/CarDashbordDisp-main (1)/CarDashbordDisp-main/DashBord_Digital/userD.db";

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
QQuickStyle::setStyle("Imagine");
    QGuiApplication app(argc, argv);
VheicleDataSender Dsend;
dataEkm Databaseobj;
user userobj;

user dbuser(pathofuserData);
dataEkm db(pathfile);
dataEkm db2(pathofuserData);
//db.updating("vikas","h","y");



if(db.isOpen())
{
    db.createTable();
    db.createTableforadduser();

}

//if(db2.isOpen())
//{

//    db2.createTableforadduser();
//}

    QQmlApplicationEngine engine;
//engine.rootContext()->setContextProperty("testing",&data);

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);



   QQmlContext * rootContext=engine.rootContext();
   rootContext->setContextProperty("mainAccess",&Dsend);

   QQmlContext * rootContextForDataBase=engine.rootContext();
   rootContextForDataBase->setContextProperty("testData",&Databaseobj);


   QQmlContext * rootContextForDatabaseforuser=engine.rootContext();
   rootContextForDatabaseforuser->setContextProperty("usertest",&userobj);


    return app.exec();

}
