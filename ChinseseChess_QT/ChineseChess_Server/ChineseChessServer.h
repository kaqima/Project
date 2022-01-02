#ifndef CHINESECHESSSERVER_H
#define CHINESECHESSSERVER_H

#include <QTcpServer>
#include <QTcpSocket>
#include <Utility/Singleton.hpp>
#include <Utility/Trie.hpp>
#include <vector>
#include <string>
#include <ChessPlayer.h>
#include <Utility/List.hpp>
#include <Utility/Utility.hpp>
#include <DataBase.h>
#include <QTimer>
using namespace std;
using namespace LB;

class ChineseChessServer:public QTcpServer
{
public:
    unsigned id_remember=0;
    bool isRunning=false;
    QHostAddress address;
    quint16 port;
    LB::Trie<std::function<void(std::vector<std::string>&,int,int)>> analyzeTree;// analyze game play
    LB::Trie<std::function<void(std::vector<std::string>&,int)>> analyzeTree_other;// analyze others except game play
    LB::List<ChessGame> games;
    LB::List<ChessPlayer> player_idle;
    LB::List<ChessPlayer> player_Match;
    ChineseChessServer()
    {

        connect(this,&QTcpServer::newConnection,[&](){
            ChessPlayer player;
            player.socket=nextPendingConnection();
            connect(player.socket,&QTcpSocket::readyRead,[&](){
                for(int i=0;i<player_idle.size();i++)
                {
                    if(player_idle[i].socket->bytesAvailable())
                    {
                        string receive;
                        auto result=player_idle[i].socket->readAll();
                        receive.append(result.data(),result.size());
                        analyze_idle(receive,i);
                    }
                }
                for(;player_Match.size()>1;)
                {
                    string red,blue;
                    red.push_back(2);
                    red.append("responseMatch");
                    red.push_back(31);
                    red.append("red");
                    red.push_back(3);

                    blue.push_back(2);
                    blue.append("responseMatch");
                    blue.push_back(31);
                    blue.append("blue");
                    blue.push_back(3);

                    ChessGame game;
                    games.lock();
                    player_Match.lock();
                    game.players.push_back(player_Match.takeNodeByIndex(0));
                    game.players.push_back(player_Match.takeNodeByIndex(0));
                    game.gameId=id_remember;
                    id_remember++;
                    player_Match.unlock();

                    game.players[0].socket->write(red.data(),red.size());
                    game.players[1].socket->write(blue.data(),blue.size());

                    games.push_back(game);
                    games.unlock();
                }

                for(int i=0;i<games.size();i++)
                {
                    for(int j=0;j<games[i].players.size();j++)
                    {
                        if(games[i].players[j].socket->bytesAvailable())
                        {

                            string receive;
                            auto result=games[i].players[j].socket->readAll();
                            receive.append(result.data(),result.size());
                            analyze_game(receive,i,j);
                        }
                    }

                }

            });
            player_idle.lock();
            player_idle.push_back(player);
            player_idle.unlock();
        });


        analyzeTree.insert(string("requestMove"),[&](vector<string>& args,int game_index,int player_index){
            string cmd;
            cmd.push_back(2);
            cmd.append("requestMove");
            for(auto& each:args)
            {
                cmd.push_back(31);
                cmd.append(each);
            }
            cmd.push_back(3);
            games[game_index].frames.push_back(cmd);
            games.lock();
            for(int ii=0;ii<games[game_index].players.size();ii++)
                {
                    if(ii!=player_index)
                        games[game_index].players[ii].socket->write(cmd.data(),cmd.size());
                }
            games.unlock();

        });
        analyzeTree.insert(string("requestRegret"),[&](vector<string>& args,int game_index,int player_index){
            auto& game=games[game_index];
            string cmd;
            cmd.push_back(2);
            cmd.append("requestRegret");
            for(auto& each:args)
            {
                cmd.push_back(31);
                cmd.append(each);
            }
            cmd.push_back(3);
            games[game_index].frames.pop_back();
            for(int ii=0;ii<game.players.size();ii++)
                {
                    if(ii!=player_index)
                        game.players[ii].socket->write(cmd.data(),cmd.size());
                }
        });
        analyzeTree.insert(string("responseRegret"),[&](vector<string>& args,int game_index,int player_index){
            string cmd;
            cmd.push_back(2);
            cmd.append("responseRegret");
            for(auto& each:args)
            {
                cmd.push_back(31);
                cmd.append(each);
            }
            cmd.push_back(3);
            games.lock();
            for(int ii=0;ii<games[game_index].players.size();ii++)
                {
                    if(ii!=player_index)
                        games[game_index].players[ii].socket->write(cmd.data(),cmd.size());
                }
            games.unlock();


        });
        analyzeTree.insert(string("reponseDraw"),[&](vector<string>& args,int game_index,int player_index){
            string cmd;
            cmd.push_back(2);
            cmd.append("responseDraw");
            for(auto& each:args)
            {
                cmd.push_back(31);
                cmd.append(each);
            }
            cmd.push_back(3);
            games.lock();
            for(int ii=0;ii<games[game_index].players.size();ii++)
                {
                    if(ii!=player_index)
                        games[game_index].players[ii].socket->write(cmd.data(),cmd.size());
                }
            games.unlock();


        });

        analyzeTree.insert(string("chat"),[&](vector<string>& args,int game_index,int player_index){
            string cmd;
            cmd.push_back(2);
            cmd.append("chat");
            for(auto& each:args)
            {
                cmd.push_back(31);
                cmd.append(each);
            }
            cmd.push_back(3);
            games.lock();
            for(int ii=0;ii<games[game_index].players.size();ii++)
                {
                    if(ii!=player_index)
                        games[game_index].players[ii].socket->write(cmd.data(),cmd.size());
                }
            games.unlock();

        });

        analyzeTree.insert(string("gameOver"),[&](vector<string>& args,int game_index,int player_index){
            games.lock();
            player_idle.lock();
            if(games[game_index].players.size()==1)
            {
                player_idle.push_back(games[game_index].players.takeNodeByIndex(player_index));
                games.takeNodeByIndex(game_index);
            }
            else
            {
                player_idle.push_back(games[game_index].players.takeNodeByIndex(player_index));
            }

            player_idle.unlock();
            games.unlock();


        });

        analyzeTree_other.insert(string("requestMatch"),[&](vector<string>& args,int player_index)
        {
            player_idle.lock();
            player_Match.lock();
            player_Match.push_back(player_idle.takeNodeByIndex(player_index));
            player_Match.unlock();
            player_idle.unlock();

        });
        analyzeTree_other.insert(string("requestLogin"),[&](vector<string>& args,int player_index)
        {
            string cmd;
            cmd.push_back(2);
            cmd.append("responseLogin");
            cmd.push_back(31);
            if(args[0]!=string("admin"));
            cmd.append("agree");
            cmd.push_back(3);
            player_idle[player_index].socket->write(cmd.data(),cmd.size());

        });
        analyzeTree_other.insert(string("requestQuit"),[&](vector<string>& args,int player_index)
        {

        });


    }

    bool startServer(QString a="127.0.0.1",quint16 p=999)
    {
        if(isRunning)
            return true;
        address.setAddress(a);
        port=p;
        return listen(address,port);

    }
private:
    void analyze_game(string& receive,int i,int j)
    {
        auto cmds=LB::subStringBetween(receive,2,3);
        for(auto& cmd:cmds)
        {
            vector<string> c=LB::splitString(cmd,31);
            for(auto& each: c)
               std::cout<<each<<',';
            std::cout<<endl;
            vector<string> args;
            for(int ii=1;ii<c.size();ii++)
            {
                args.push_back(c[ii]);
            }
            if(!analyzeTree.empty(c[0]))
                analyzeTree.at(c[0])(args,i,j);
        }

    }
    void analyze_idle(string& receive,int i)
    {
        auto cmds=LB::subStringBetween(receive,2,3);
        for(auto& cmd:cmds)
        {
            vector<string> c=LB::splitString(cmd,31);
            for(auto& each: c)
               std::cout<<each<<' ';
            std::cout<<endl;
            vector<string> args;
            for(int ii=1;ii<c.size();ii++)
            {
                args.push_back(c[ii]);
            }
            if(!analyzeTree_other.empty(c[0]))
                analyzeTree_other.at(c[0])(args,i);
        }
    }
};

#endif // CHINESECHESSSERVER_H
