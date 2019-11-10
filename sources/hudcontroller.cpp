#include "hudcontroller.h"
#include <QBuffer>
#include <QDataStream>
#include <QDebug>

HudController::HudController(QObject *parent) : QObject(parent)
{
    shmem.setKey("HmiSpeed");

    m_tmr.setInterval(200);
    connect(&m_tmr, &QTimer::timeout, [=](){
        m_rpm = getRPMValue();
        emit rpmValueChanged(m_rpm);
    });
    m_tmr.start();
}

int HudController::rpmValue()
{
    return m_rpm;
}

int HudController::getRPMValue()
{
    int value(-1);

    if (!shmem.attach()) {
        qWarning() << "Unable to attach to shared memory segment.";
        return -1;
    }

    QBuffer buffer;
    QDataStream in(&buffer);

    shmem.lock();
    buffer.setData((char*)shmem.constData(), shmem.size());
    buffer.open(QBuffer::ReadOnly);
    in >> value;
    shmem.unlock();
    shmem.detach();
    return value;
}
