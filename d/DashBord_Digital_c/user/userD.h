#pragma once
#include <QObject>
#include <QTimer>
//#include <QVariant>
#include <QSqlError>
#include <QSqlRecord>
#include <QSqlQuery>
#include <QDebug>


class user:public QObject
{

    Q_OBJECT
public:
    explicit user(QObject *parent = nullptr);

    user(const QString &path);
    ~user();
    bool createTableforadduser();

    bool isOpen() const;

    void adduserDatafromDB(QString,QString,QString);

public slots:

    void addinDBfromqml(QString,QString,QString);

private:
    QSqlDatabase *dbuser=new QSqlDatabase;

QSqlDatabase d;


};
