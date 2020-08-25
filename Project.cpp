#include "Project.h"



Project::Project(const QString &n, const QString &p, QObject *parent):
    QObject(parent),m_name(n), m_path(p)//initialization
{

}

QString Project::name() const
{
    return m_name;
}

QString Project::path() const
{
    return m_path;
}

void Project::setName(QString name)
{
    m_name = name;
}

void Project::setPath(QString path)
{
    m_path = path;
}
