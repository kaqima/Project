
import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtMultimedia

Item {

    Image {
        anchors.fill: parent
        source: "qrc:/source/chessImage/logBg.jpg"
        fillMode: Image.PreserveAspectFit
    }


    Rectangle
    {
        anchors.centerIn: parent
        width: parent.width/3;
        height: parent.height/2
        color: "transparent"
        ColumnLayout
        {
            anchors.fill: parent;
            RowLayout
            {
                Label
                {
                    text:qsTr("账号")
                    color: "deepskyblue"
                }

                TextField
                {
                    id:accondText_Online
                    color: "deeppink"
                    inputMask: "9999999999"
                }
            }
            RowLayout
            {
                Label
                {
                    text:qsTr("密码")
                    color: "deepskyblue"

                }

                TextField
                {
                    id: passwordText_Online
                    color: "deeppink"
                    echoMode: "PasswordEchoOnEdit"
                }
            }
            Button
            {
                text:qsTr("登录")
                Layout.alignment: Qt.AlignHCenter
                onClicked:
                {
                    Communication.connectServer_Online();
                    Communication.requestLogin_Online(accondText_Online,passwordText_Online);
                }
            }
        }
    }
}
