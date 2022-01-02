#pragma once
#ifndef DATABASE_H
#define DATABASE_H

#include <Utility/Trie.hpp>
#include <vector>
#include <string>

using namespace std;
using namespace LB;
class DataBase
{
    LB::Trie<string> users;
public:
    DataBase()
    {
       users.insert(string("admin"),string("admin"));
    }
    bool signIn(const string& id,const string& password)
    {
        if(users.empty(id))
          return false;
        if(users.at(id)==password)
            return true;
        else
            return false;

    }
    bool singUp(const string& id,const string& password)
    {
        if(!users.empty(id))
            return false;
        return users.insert(id,password);
    }
};

#endif // DATABASE_H
