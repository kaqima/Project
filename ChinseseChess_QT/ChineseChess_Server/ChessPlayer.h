#ifndef CHESSPLAYER_H
#define CHESSPLAYER_H
#include <QTcpSocket>
#include <string>
#include <Utility/List.hpp>

class ChessPlayer
{
public:
    std::string nickName;
    QTcpSocket* socket;
};

class ChessGame
{
public:
    unsigned gameId;
    LB::List<ChessPlayer> players;
    vector<string> frames;
    int time_red=30,red_blue=30;
    bool gameOver=false;
};



#endif // CHESSPLAYER_H
