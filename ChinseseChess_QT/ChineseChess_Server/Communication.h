#pragma once
#ifndef COMMUNICATION_H
#define COMMUNICATION_H
#include <QObject>
#include <ChineseChessServer.h>
#include <Utility/Singleton.hpp>

class Communication : public QObject
{
    Q_OBJECT
public:
    Q_INVOKABLE bool startServer(QString ip="127.0.0.1",QString port="999")
    {
        return getSingleton(ChineseChessServer).startServer(ip,port.toInt());
    }
};



#endif // COMMUNICATION_H
