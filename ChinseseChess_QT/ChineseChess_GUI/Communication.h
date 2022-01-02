#ifndef COMMUNICATION_H
#define COMMUNICATION_H

#include <QObject>
#include <VsChineseChess.h>
#include <Utility/Singleton.hpp>
#include <QPoint>
#include <Template/Point.hpp>

class Communication : public QObject
{
    Q_OBJECT
public:

    Q_INVOKABLE QPoint getPositionByIndex(int index)
    {
        auto p=getSingleton(VsChineseChess).chess.getChessMans()[index].position;
        return QPoint(p.x,p.y);

    }

    Q_INVOKABLE bool isDead(int index)
    {
        return getSingleton(VsChineseChess).chess.getChessMans()[index].isDead;

    }

    Q_INVOKABLE bool isRed(int index)
    {
        return  getSingleton(VsChineseChess).chess.getChessMans()[index].isRed;
    }

    Q_INVOKABLE int moveChess(int index,int x,int y)
    {
        return getSingleton(VsChineseChess).chess.moveChess(index,LB::Point2i(x,y));
    }

    Q_INVOKABLE bool isRedTurn()
    {
        return getSingleton(VsChineseChess).chess.getIsRedTurn();
    }
    Q_INVOKABLE void regret()
    {
        getSingleton(VsChineseChess).chess.regretChess();
    }


    Q_INVOKABLE bool getIsRedTurn_Online()
    {
        return getSingleton(VsChineseChess).chessOnline.getIsRedTurn();
    }
    Q_INVOKABLE QPoint getPositionByIndex_Online(int index)
    {
        if(index<0||index>31)
            return QPoint(0,0);
        LB::Point2i tem=getSingleton(VsChineseChess).chessOnline.getChessMans()[index].position;
        if(getSingleton(VsChineseChess).isRed_Online)
        {
            return QPoint(tem.x,9-tem.y);
        }
        else
            return QPoint(tem.x,tem.y);
    }
    Q_INVOKABLE bool getIsDead_Online(int index)
    {
        if(index<0||index>31)
            return false;
        return getSingleton(VsChineseChess).chessOnline.getChessMans()[index].isDead;
    }
    Q_INVOKABLE bool getIsRed_Online()
    {

        return getSingleton(VsChineseChess).isRed_Online;
    }
    Q_INVOKABLE int moveChess_Online(int index,int x,int y)
    {
        if(index<0||index>31)
            return -1;
        if(getSingleton(VsChineseChess).chessOnline.isGameOver())
            return 0;
        LB::Point2i tem(x,y);
        if(getSingleton(VsChineseChess).getIsRed_Online())
            tem.y=9-tem.y;
        return getSingleton(VsChineseChess).requestMoveChess_Online(index,tem);
    }
    Q_INVOKABLE void connectServer_Online()
    {
        getSingleton(VsChineseChess).connectToServer();
    }
    Q_INVOKABLE void requestMatch()
    {
        getSingleton(VsChineseChess).requestMatch();
    }
    Q_INVOKABLE void requestRegret_Online()
    {
        getSingleton(VsChineseChess).requestRegret_Online();
    }
    Q_INVOKABLE void requestDraw_Online()
    {
        getSingleton(VsChineseChess).requestDraw_Online();
    }
    Q_INVOKABLE void responseRegret_Online(bool isAgree)
    {
        getSingleton(VsChineseChess).responseRegret_Online(isAgree);
    }
    Q_INVOKABLE void responseDraw_Online(bool isAgree)
    {
        getSingleton(VsChineseChess).responseDraw_Online(isAgree);
    }
    Q_INVOKABLE bool canRegret_Online()
    {
        auto & tem=getSingleton(VsChineseChess);
        if(!tem.chessOnline.canRegret()||(tem.getIsRedTurn_Online()==getIsRed_Online()))
        {
            return false;
        }
        else
            return true;
    }
    Q_INVOKABLE void chat_Online(QString message)
    {
        getSingleton(VsChineseChess).chatOnline(message.toStdString());
    }
    Q_INVOKABLE void requestLogin_Online(QString account,QString password)
    {
        getSingleton(VsChineseChess).requestLogin(account.toStdString(),password.toStdString());
    }
    Q_INVOKABLE void gameOver_Online()
    {
        getSingleton(VsChineseChess).chessOnline.initChessBoard();
    }

};

#endif // COMMUNICATION_H
