#include "DomReader.h"
#include "Project.h"
#include <string>
#include <QtXml>
#include <iostream>
#include <Project.h>


using namespace std;

DomReader::DomReader(QObject *parent)
{
    this->parent = parent;
}

QDomDocument DomReader::buildDom(QString str){
    QDomDocument dom;
    dom.setContent(str);
    return dom;
}

Project* DomReader::buildProject(QDomElement element, QObject* parent){

    QDomAttr pathNode = element.attributeNode("path").toAttr();
    QDomAttr nameNode = element.attributeNode("name").toAttr();

    return new Project(nameNode.value().toUtf8().constData(), pathNode.value().toUtf8().constData(), parent);

}


QList<QObject*> DomReader::listElements(QDomElement root, QObject* parent){
    QDomNodeList domList  = root.elementsByTagName("project");

    QList<QObject*> list;
    int length = domList.count();


    for(int i = 0; i < length; i++){

        QDomNode node = domList.at(i);
        Project* project = buildProject(node.toElement(), parent);
        list.push_back(project);

    }

    return list;


}




QList<QObject*> DomReader::readProjects(QString fileName, QObject* parent)
{
//    QString qFileName = QString::fromStdWString(fileName);

    QFile file(fileName);
    if(file.exists()){
        if (!file.open(QFile::ReadOnly | QFile::Text)){
            return {};
        }

        QTextStream in(&file);

        QString xmlString = in.readAll();

        QDomDocument dom =  buildDom(xmlString);


        QDomElement root = dom.firstChildElement();

       return listElements(root, parent);


    }

    else {
        qInfo() << "Projects file does not exist.";
    }

    return {};

}


