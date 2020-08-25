#ifndef WELCOME_H
#define WELCOME_H

#include <QObject>
#include <QQmlApplicationEngine>

class Welcome : public QObject
{
    Q_OBJECT
public:
    explicit Welcome(QObject *parent = nullptr);

    bool initialize();
    QList<QObject*> projects();

signals:

private:
    QList<QObject*> readProjects(const QString fileName);
    void resetModel();

    QList<QObject*> projectList;//This should be QObject*, QProject* is not going to work in QML
    QQmlApplicationEngine mEngine;

};

#endif // WELCOME_H
