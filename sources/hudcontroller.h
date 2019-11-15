#ifndef HUDCONTROLLER_H
#define HUDCONTROLLER_H

#include <QObject>
#include <QSharedMemory>
#include <QTimer>

class HudController : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int rpmValue READ rpmValue NOTIFY rpmValueChanged)
public:
    explicit HudController(QObject *parent = nullptr);
    Q_INVOKABLE int rpmValue();

signals:
    void rpmValueChanged(int value);

private:
    QSharedMemory shmem;
    QTimer m_tmr;
    int getRPMValue();
    int m_rpm;
};

#endif // HUDCONTROLLER_H
