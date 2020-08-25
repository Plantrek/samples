#include <QFile>
#include <QTextStream>
#include <iostream>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QVariant>
#include <string>
#include "QApplication"
#include "welcome.h"


using namespace std;


QString readTextFile(QString path){
    QFile file(path);

    if(file.open(QIODevice::ReadOnly | QIODevice::Text)){
        QTextStream in(&file);

        return in.readAll();
    }

    return "";

}
int main(int c, char** args){


        QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

        QGuiApplication app(c, args);

        Welcome welcome;
        if(!welcome.initialize())
                return -1;


        return app.exec();





}

