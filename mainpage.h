#ifndef MAINPAGE_H
#define MAINPAGE_H

#include <QObject>
#include <QStringList>
#include <QVariant>

class MainPage : public QObject
{
    Q_OBJECT
public:
    explicit MainPage(QObject *qml, QObject *parent = 0);
    
signals:
    void openTabMain(QVariant);
    void setPageContent(int,QString);
    
public slots:
    void openTabMainRequested();
    
};

#endif // MAINPAGE_H
