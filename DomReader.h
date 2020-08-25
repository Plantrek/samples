#ifndef DOMREADER_H
#define DOMREADER_H


#include <string>
#include<Project.h>
#include <QString>
#include <vector>
#include <QObject>
#include <QDomElement>

using namespace std;

class DomReader
{


public:
    DomReader(QObject* parent);

    QList<QObject *> readProjects(QString fileName, QObject *parent);
private:
    QList<QObject*> listElements(QDomElement root, QObject* parent);

    QDomDocument buildDom(QString str);

    Project* buildProject(QDomElement element, QObject* parent);

     static const std::string PROJECT_FILE;
     const static int TRIAL_TIME;
     QObject* parent;
};

#endif
// DOMREADER_H
