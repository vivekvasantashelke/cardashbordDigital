#pragma once
#include <QObject>
#include <QTimer>
//#include <QVariant>
#include <QSqlError>
#include <QSqlRecord>
#include <QSqlQuery>
#include <QDebug>

//#include <QSound>
//#include <QFile>
class dataEkm:public QObject
{

    Q_OBJECT
public:
    explicit dataEkm(QObject *parent = nullptr);

    dataEkm(const QString &path);
    ~dataEkm();
    bool createTable();
  bool createTableforadduser();

    bool isOpen() const;

signals:

    void totaltimeenginsignals(QString tet);



private slots:

    void notifytotaltimeenginslots();

public slots:
    int accessDatafromDBh();
     int accessDatafromDBm();
      int accessDatafromDBs();

     QVector<QString> accessfromDBusername();
//     QList<QVariant> settertochanged(QString);
   void settertochanged(QString);

    void addTET(QString,QString,QString,QString,QString);
      void adduserDatafromDB(QString,QString,QString);

    int km();

    void stopButton(QString,QString,QString,QString);
    void addinDBfromqml(QString,QString,QString);


    void updating(QString,QString,QString);


QString name();
QString backgroundcolor();
QString needlecolor();
private:
    QSqlDatabase *db=new QSqlDatabase;
     QSqlDatabase *db2=new QSqlDatabase;
    QTimer *t=new QTimer(this);

};
