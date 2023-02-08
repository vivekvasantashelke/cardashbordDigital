#include "userD.h"


user::user(QObject *parent):QObject(parent)
{
//d.setDatabaseName("C:/Users/admin/Downloads/CarDashbordDisp-main (1)/CarDashbordDisp-main/DashBord_Digital/user.db");
//if( !d.open()  )
//{
//    qDebug() << "Error: Failed to connect to databases.";
//}
//else
//    qDebug()<<"created";




// QSqlQuery query1(d);
// query1.exec("CREATE TABLE table1 (id INTEGER PRIMARY KEY, name TEXT)");
//// Close the databases db1.close();
// d.close();



}

user::user(const QString &path)
{

    *dbuser=QSqlDatabase::addDatabase("QSQLITE");


    dbuser->setDatabaseName(path);
    if(!dbuser->open())
    {
        qDebug()<<"error"<<"\n";
    }
    else
    {
        qDebug()<<"ok"<<"\n";
    }



}





user::~user()
{
    if(dbuser->isOpen())
    {
        dbuser->close();
    }
}

bool user::createTableforadduser()
{
    bool success = false;

    QSqlQuery query;
    query.prepare("CREATE TABLE user(id INTEGER PRIMARY KEY, Name TEXT,BGC TEXT,NeedleC TEXT);");

    if (!query.exec())
    {
        qDebug() << "Couldn't create the table 'user': one might already exist.";

        success = false;
    }

   // qDebug()<<"creted";

    return success;

}

bool user::isOpen() const
{

}

void user::adduserDatafromDB(QString Name, QString BGC, QString NeedleC)
{
 qDebug()<<"callll"<<Name<<BGC<<NeedleC;

    bool success = false;

        if (!Name.isEmpty()||!BGC.isEmpty()||!NeedleC.isEmpty())
    {
        QSqlQuery queryAdd;
        queryAdd.prepare("INSERT INTO user (Name,BGC,NeedleC) VALUES (:Name,:BGC,:NeedleC)");
        queryAdd.bindValue(":Name", Name);
         queryAdd.bindValue(":BGC", BGC);
          queryAdd.bindValue(":NeedleC", NeedleC);


        if(queryAdd.exec())
        {

            qDebug()<<"add succefully";
         //   accessDatafromDB();

        }
        else
        {
            qDebug() << "add person failed: " << queryAdd.lastError();
        }
    }
    else
    {
        qDebug() << "add person failed: mobilen cannot be empty";
        }
}

void user::addinDBfromqml(QString Name, QString BGC, QString NeedleC)
{
    adduserDatafromDB(Name,BGC,NeedleC);

//  qDebug()<<"callll"<<Name<<BGC<<NeedleC;
}
