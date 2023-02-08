#include "dataEkm.h"
#include <QVector>

     QString tet;

     int h,m,s,p1,p2,p3;     QChar c1,c2,c3;
     QVector<QString> vec;
QString n,bg,nd;

dataEkm::dataEkm(QObject *parent):QObject(parent)
{
    t->start(500);
    connect(t,&QTimer::timeout,this,&dataEkm::notifytotaltimeenginslots);

}

dataEkm::dataEkm(const QString &path)
{

    *db=QSqlDatabase::addDatabase("QSQLITE");
    db->setDatabaseName(path);
    if(!db->open())
    {
        qDebug()<<"error"<<"\n";
    }
    else
    {
        qDebug()<<"ok"<<"\n";
    }


}





dataEkm::~dataEkm()
{
    if(db->isOpen())
    {
        db->close();
    }
}

bool dataEkm::createTable()
{

    bool success = false;

    QSqlQuery query;
    query.prepare("CREATE TABLE DashbordData(id INTEGER PRIMARY KEY, TET TEXT,h TEXT,m TEXT,s TEXT,KM TEXT);");


    if (!query.exec())
    {
        qDebug() << "Couldn't create the table 'DashbordData': one might already exist.";

        //addTET("2534","11");


        success = false;
    }




    return success;

}





bool dataEkm::createTableforadduser()
{
    bool success = false;

    QSqlQuery query2;
    query2.prepare("CREATE TABLE userD(id INTEGER PRIMARY KEY, Name TEXT,BGC TEXT,NeedleC TEXT);");

    if (!query2.exec())
    {
        qDebug() << "Couldn't create the table 'userD': one might already exist.";

        success = false;
    }

    qDebug()<<"creted";

    return success;

}



void dataEkm::adduserDatafromDB(QString Name, QString BGC, QString NeedleC)
{
 //qDebug()<<"callll"<<Name<<BGC<<NeedleC;

    bool success = false;

        if (!Name.isEmpty()||!BGC.isEmpty()||!NeedleC.isEmpty())
    {
        QSqlQuery queryAdd;
        queryAdd.prepare("INSERT INTO userD (Name,BGC,NeedleC) VALUES (:Name,:BGC,:NeedleC)");
        queryAdd.bindValue(":Name", Name);
         queryAdd.bindValue(":BGC", BGC);
          queryAdd.bindValue(":NeedleC", NeedleC);


        if(queryAdd.exec())
        {

            qDebug()<<"add succefully";
         //   accessDatafromDB();
           // accessfromDBusername();

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



bool dataEkm::isOpen() const
{

}

void dataEkm::notifytotaltimeenginslots()
{

    //qDebug()<<"calllll";
    emit totaltimeenginsignals(QString (tet));

}

int dataEkm::accessDatafromDBh()
{
    QSqlQuery query("SELECT * FROM DashbordData");
    int idName = query.record().indexOf("h");
   while (query.next())
    {
         tet = query.value(idName).toString();

   }

   bool conversionSuccessful;
   int convertedValue = tet.toInt(&conversionSuccessful);
   return convertedValue;


}

int dataEkm::accessDatafromDBm()
{
    QSqlQuery query("SELECT * FROM DashbordData");
    int idName = query.record().indexOf("m");
   while (query.next())
    {
         tet = query.value(idName).toString();

   }

   bool conversionSuccessful;
   int convertedValue = tet.toInt(&conversionSuccessful);
   return convertedValue;
}

int dataEkm::accessDatafromDBs()
{
    QSqlQuery query("SELECT * FROM DashbordData");
    int idName = query.record().indexOf("s");
   while (query.next())
    {
         tet = query.value(idName).toString();

   }

   bool conversionSuccessful;
   int convertedValue = tet.toInt(&conversionSuccessful);
   return convertedValue;
}
QVector<QString> dataEkm::accessfromDBusername()
{

    QSqlQuery query("SELECT * FROM userD");
    int idName = query.record().indexOf("Name");

   while (query.next())
    {

       QString name = query.value(idName).toString();
        vec.push_back(name);
        //  qDebug() << "name--" << name;
    }
   return vec;

}

void dataEkm::settertochanged(QString usrNam)
{

    QSqlQuery query;
query.prepare("SELECT Name, BGC, NeedleC"
              " FROM userD WHERE Name = :usrNam");
query.bindValue(":usrNam", usrNam);
//query.bindValue(":psswrd", psswrd);

QList<QVariant> list;

if (!query.exec()) {
    qDebug() << "Query failed!";
} else {
    if (query.first())
    {
        list.append(query.value("Name"));
        list.append(query.value("BGC"));
        list.append(query.value("NeedleC"));
      //  list.append(query.value("Username"));
       // list.append(query.value("Password"));
    } else {
        qDebug () << "Data not found";
    }
}

//for(auto i:list)



n=list.value(0).toString();
bg=list.value(1).toString();
nd=list.value(2).toString();

qDebug()<<n<<"->"<<bg<<" ->"<<nd;

//return list;




}

void dataEkm::addTET(QString tet,QString h,QString m,QString s, QString km)
{


    bool success = false;

        if (!tet.isEmpty()||!km.isEmpty())
    {
        QSqlQuery queryAdd;
        queryAdd.prepare("INSERT INTO DashbordData (tet,h,m,s,km) VALUES (:TET,:h,:m,:s,:KM)");
        queryAdd.bindValue(":TET", tet);
         queryAdd.bindValue(":h", h);
          queryAdd.bindValue(":m", m);
           queryAdd.bindValue(":s", s);
        queryAdd.bindValue(":KM", km);

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

int dataEkm::km()
{
    QSqlQuery query("SELECT * FROM DashbordData");
    int idName = query.record().indexOf("KM");
   while (query.next())
    {
         tet = query.value(idName).toString();

   }

   bool conversionSuccessful;
   int convertedValue = tet.toInt(&conversionSuccessful);
   return convertedValue;
}

void dataEkm::stopButton(QString tets,QString tetm,QString teth,QString kms)
{
    QString all=teth + ":" + tetm + ":" + tets;
    qDebug()<<"stoped";
  addTET(all,teth,tetm,tets,kms);
t->stop();
}
void dataEkm::addinDBfromqml(QString Name, QString BGC, QString NeedleC)
{
    adduserDatafromDB(Name,BGC,NeedleC);

    //  qDebug()<<"callll"<<Name<<BGC<<NeedleC;
}

void dataEkm::updating(QString n, QString bg, QString nd)
{

    qDebug()<<"called";

    QSqlQuery qry;


    QSqlRecord rec = qry.record();

       int idCol = rec.indexOf(n);

       qDebug()<<idCol;

//    qry.prepare("UPDATE userD SET (Name='n',BGC='bg',NeedleC='nd')"
//                "VALUES (?,?,?,?,?)"
//                "WHERE Name=n;"
//                );
  qry.prepare("UPDATE userD SET NeedleC = :nd, BGC = :bg WHERE Name = :n  ");

   //qry.prepare("UPDATE userD SET Name = 'PRATIK' WHERE BGC = 'red' ");

  //  qry.addBindValue(n);
       // qry.addBindValue(":NeedleC",nd);
          //  qry.addBindValue(nd);
          //  qry.addBindValue(TEL_LIVREUR);
          //  qry.addBindValue(DIPLOME);
  qry.bindValue(":n", n);

   qry.bindValue(":bg", bg);
  qry.bindValue(":nd", nd);


            if(qry.exec()){

               qDebug()<<"udated";
            }else{
                 qDebug()<<"not udated";
            }


}

QString dataEkm::name()
{
return n;
}

QString dataEkm::backgroundcolor()
{
return bg;
}

QString dataEkm::needlecolor()
{
return nd;
}


