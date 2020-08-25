#include <QQmlContext>
#include "DomReader.h"
#include "welcome.h"



Welcome::Welcome(QObject *parent) : QObject(parent)
{

    this->projectList = readProjects(":/files/projects.xml");

}

bool Welcome::initialize()
{
      resetModel();
      mEngine.load(QUrl("qrc:/welcome.qml"));
      if (mEngine.rootObjects().isEmpty()){
          return false;
      }

      return true;

}

QList<QObject *> Welcome::projects()
{
   return this->projectList;
}

QList<QObject*> Welcome::readProjects(QString fileName){

      DomReader reader(this);
      return reader.readProjects(fileName, this);

}

void Welcome::resetModel()
{
    mEngine.rootContext()->setContextProperty("Wrapper",this);
    mEngine.rootContext()->setContextProperty("projects",QVariant::fromValue(projects()));

}
