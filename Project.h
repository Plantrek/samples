#ifndef PROJECT_H
#define PROJECT_H

#include <QObject>

class Project : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString name READ name WRITE setName)
    Q_PROPERTY(QString path READ path WRITE setPath)

    QString m_name;

    QString m_path;

public:

    Project(const QString &name, const QString &path, QObject *parent);

    QString name() const;

    QString path() const;

    void setName(QString name);

    void setPath(QString path);



};

#endif // PROJECT_H
