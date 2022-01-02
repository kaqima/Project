import QtQuick 2.0
import QtQuick.Controls 2.12

Item {

    Button
    {
        text:"开始匹配"
        onClicked:
        {
            Communication.requestMatch();
        }
    }
}
