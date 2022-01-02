#ifndef VSCHINESECHESS_H
#define VSCHINESECHESS_H

#include <Others/ChineseChess.hpp>
#include <QTcpSocket>
#include <QHostAddress>
#include <iostream>
#include <Utility/Utility.hpp>
#include <Utility/Trie.hpp>
#include <functional>
#include <string>
#include <QString>
#include <QByteArray>
#include <GlobalStorage.h>
#include <Utility/Singleton.hpp>
#include <QMetaObject>
#include <QObject>
#include <QVariant>
#include <QQmlApplicationEngine>
#include <QUrl>


class VsChineseChess:public QTcpSocket
{
public:
    LB::ChineseChess chess;
    LB::ChineseChess chessOnline;
    QHostAddress address_Online;
    quint16 port_Online;
    bool isConnected_Online=false;
    bool isRed_Online=true;
    int synchronous=-1;
    LB::Trie<function<
    void(
            std::vector<std::string>&
        )
                        >
            >analyzeTree;
    VsChineseChess()
    {

        QObject::connect(this,&QTcpSocket::connected,[&](){
            isConnected_Online=true;
            std::cout<<"client succeed to connect to Server"<<endl;
        });

        QObject::connect(this,&QTcpSocket::errorOccurred,[&]()
        {
            isConnected_Online=false;
            std::cout<<"client fail to connect to "<<address_Online.toString().toStdString()<<":"<<LB::intToString(port_Online)<<endl;
        });

        QObject::connect(this,&QTcpSocket::readyRead,[&]()
        {
            QByteArray Qresult= readAll();
            std::string result;
            result.append(Qresult.data(),Qresult.size());
            analyze(result);
        });

        analyzeTree.insert(string("requestMove"),[&](std::vector<std::string>& args)
        {
            int index,x,y;
            index=LB::stringToInt(args[0]);
            x=LB::stringToInt(args[1]);
            y=LB::stringToInt(args[2]);
            QObject* pa=getSingleton(GlobalStorage).engine->rootObjects().first()->findChild<QObject*>("playArea_Online");

            int result=chessOnline.moveChess(index,LB::Point2i(x,y));
            switch(result)
            {
            case -1: break;
            case 0: break;
            case 1:QMetaObject::invokeMethod(pa,"updateChess"); QMetaObject::invokeMethod(getSingleton(GlobalStorage).engine->rootObjects().first()->findChild<QObject*>("moveChessSouncd_Online"),"play");break;
            case 2:QMetaObject::invokeMethod(pa,"updateChess"); QMetaObject::invokeMethod(getSingleton(GlobalStorage).engine->rootObjects().first()->findChild<QObject*>("jiangJunSound_Online"),"play"); break;
            case 3:QMetaObject::invokeMethod(pa,"updateChess"); break;
            case 4:QMetaObject::invokeMethod(pa,"updateChess"); break;
            }
        });

        analyzeTree.insert(std::string("responseLogin"),[&](std::vector<std::string>& args)
        {
            QObject* stackView=getSingleton(GlobalStorage).engine->rootObjects().first()->findChild<QObject*>("stackView");
            QUrl url("qrc:/Home.qml");
            if(args[0]==std::string("agree"))
            {

                QMetaObject::invokeMethod(stackView,"loadHome");
            }

        });


        analyzeTree.insert(std::string("responseRegret"),[&](std::vector<std::string>& args)
        {
            QObject* ca=getSingleton(GlobalStorage).engine->rootObjects().first()->findChild<QObject*>("chatArea_Online");
            if(args[0]==std::string("agree"))
            {
                chessOnline.regretChess();
                QMetaObject::invokeMethod(getSingleton(GlobalStorage).engine->rootObjects().first()->findChild<QObject*>("playArea_Online"),"updateChess");
                ca->setProperty("text",QVariant(ca->property("text").toString().append("\n对方同意悔棋") ));
            }
            else
            {
                ca->setProperty("text",QVariant(ca->property("text").toString().append("\n对方不同意悔棋")));
            }

        });
        analyzeTree.insert(std::string("responseDraw"),[&](std::vector<std::string>& args)
        {
            QObject* ca=getSingleton(GlobalStorage).engine->rootObjects().first()->findChild<QObject*>("chatArea_Online");

            if(args[0]==std::string("agree"))
            {
                chessOnline.draw();
                ca->setProperty("text",QVariant(ca->property("text").toString().append("\nopponent agree to regret") ));
            }
            else
            {
                ca->setProperty("text",QVariant(ca->property("text").toString().append("\nopponent disagree to regret")));
            }
        });

        analyzeTree.insert(std::string("requestRegret"),[&](std::vector<std::string>& args)
        {
            if((chessOnline.getIsRedTurn()!=isRed_Online)||!chessOnline.canRegret())
                return;
            QObject* mp=getSingleton(GlobalStorage).engine->rootObjects().first()->findChild<QObject*>("messagePop_Online");
            QObject* pm=getSingleton(GlobalStorage).engine->rootObjects().first()->findChild<QObject*>("popMessage_Online");
            mp->setProperty("state",QVariant(1));
            pm->setProperty("text",QVariant(QString("对方请求悔棋")));
            mp->setProperty("standardButtons",81920);
            QMetaObject::invokeMethod(mp,"open");
        });

        analyzeTree.insert(std::string("requestDraw"),[&](std::vector<std::string>& args)
        {
            QObject* mp=getSingleton(GlobalStorage).engine->rootObjects().first()->findChild<QObject*>("messagePop_Online");
            QObject* pm=getSingleton(GlobalStorage).engine->rootObjects().first()->findChild<QObject*>("popMessage_Online");
            pm->setProperty("text",QVariant(QString("对方请求和棋")));
            mp->setProperty("state",QVariant(2));
            mp->setProperty("standardButtons",81920);
            QMetaObject::invokeMethod(mp,"open");
        });
        analyzeTree.insert(std::string("chat"),[&](std::vector<std::string>& args)
        {
            QObject* ca=getSingleton(GlobalStorage).engine->rootObjects().first()->findChild<QObject*>("chatArea_Online");
            ca->setProperty("text",QVariant(ca->property("text").toString().append('\n').append(QString::fromStdString(args[0])) ));

        });

        analyzeTree.insert(std::string("responseMatch"),[&](std::vector<std::string>& args)
        {
            if(args[0]==string("red"))
                isRed_Online=true;
            else
                isRed_Online=false;
            QMetaObject::invokeMethod(getSingleton(GlobalStorage).engine->rootObjects().first()->findChild<QObject*>("stackView"),"loadGame");

        });

        analyzeTree.insert(std::string("checkNetWork"),[&](std::vector<std::string>& args)
        {
        });
    }

    void connectToServer(QString ip="127.0.0.1",quint16 p=999)
    {
        address_Online.setAddress(ip);
        port_Online=p;
        connectToHost(address_Online,port_Online);
    }

    int requestMoveChess_Online(int index,LB::Point2i destination)
    {
        std::string cmd;
        //  2 command 31 args 3
        cmd.push_back(2);
        auto result=chessOnline.moveChess(index,destination);
        if(result>0)
        {
            cmd.append("requestMove");
            cmd.push_back(31);
            cmd.append(LB::intToString(index));
            cmd.push_back(31);
            cmd.append(LB::intToString(destination.x));
            cmd.push_back(31);
            cmd.append(LB::intToString(destination.y));
            cmd.push_back(3);
            write(cmd.data(),cmd.size());
        }
        return result;
    }

    bool isDead_Online(int index)
    {
        return chessOnline.getChessMans()[index].isDead;
    }

    LB::Point2i getPositionByIndex_Online(int index)
    {
        return chessOnline.getChessMans()[index].position;
    }

    bool getIsRed_Online()
    {
        return isRed_Online;
    }

    bool getIsRedTurn_Online()
    {
        return chessOnline.getIsRedTurn();
    }

    bool getIsDeadByIndex_Online(int index)
    {
        return chessOnline.getChessMans()[index].isDead;
    }
    void requestRegret_Online()
    {
        if(getSingleton(VsChineseChess).isRed_Online==getSingleton(VsChineseChess).getIsRedTurn_Online())
            return;
        string cmd;
        cmd.push_back(2);
        cmd.append("requestRegret");
        cmd.push_back(3);
        write(cmd.data(),cmd.size());
    }
    void responseRegret_Online(bool isAgree)
    {
        string cmd;
        cmd.push_back(2);
        cmd.append("responseRegret");
        cmd.push_back(31);
        if(isAgree)
        {
            cmd.append("agree");
            chessOnline.regretChess();
            QMetaObject::invokeMethod(getSingleton(GlobalStorage).engine->rootObjects().first()->findChild<QObject*>("playArea_Online"),"updateChess");
        }
        else
            cmd.append("disagree");
        cmd.push_back(3);
        write(cmd.data(),cmd.size());
    }

    void requestDraw_Online()
    {
        string cmd;
        cmd.push_back(2);
        cmd.append("responseDraw");
        cmd.push_back(3);
        write(cmd.data(),cmd.size());
    }

    void responseDraw_Online(bool isAgree)
    {
        string cmd;
        cmd.push_back(2);
        cmd.append("reponseDraw");
        cmd.push_back(31);
        if(isAgree)
            cmd.append("agree");
        else
            cmd.append("disagree");
        cmd.push_back(3);
        write(cmd.data(),cmd.size());
    }

    void requestLogin(string account,string password)
    {
        if(!waitForConnected())
            cout<<" fail to login"<<endl;
        string cmd;
        cmd.push_back(2);
        cmd.append("requestLogin");
        cmd.push_back(31);
        cmd.append(account);
        cmd.push_back(31);
        cmd.append(password);
        cmd.push_back(3);
        if(isConnected_Online)
            write(cmd.data(),cmd.size());
    }
    void requestMatch()
    {
        string cmd;
        cmd.push_back(2);
        cmd.append("requestMatch");
        cmd.push_back(3);
        //if(isLogin_Online)
            write(cmd.data(),cmd.size());

    }
    void chatOnline(string message)
    {
        string cmd;
        cmd.push_back(2);
        cmd.append("chat");
        cmd.push_back(31);
        cmd.append(message);
        cmd.push_back(3);
        write(cmd.data(),cmd.size());
    }
    bool synchronFrame()
    {
        if(!isConnected_Online)
            return false;
        string cmd_1,cmd;
        cmd_1.push_back(2);
        cmd_1.append("synchronous");
        cmd_1.push_back(31);


    }
private:
    void analyze(string command)
    {

        auto cmds=LB::subStringBetween(command,2,3);

        for(auto& each_cmd:cmds)
        {
            auto cmd=LB::splitString(each_cmd,31);
            // print received cmd
            for(auto& each: cmd)
               std::cout<<each<<' ';
            std::cout<<endl;

            std::vector<string> args;
            for(int i=1;i<cmd.size();i++)
                args.push_back(cmd[i]);
            if(!analyzeTree.empty(cmd[0]))
            {
                analyzeTree.at(cmd[0])(args);
            }
        }
    }
};


#endif // VSCHINESECHESS_H
