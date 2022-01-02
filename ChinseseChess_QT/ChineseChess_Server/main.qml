import QtQuick
import QtQuick.Layouts 1.12

import QtQuick.Controls

ApplicationWindow {
    width: 640
    height: 480
    visible: true
    title: qsTr("Scroll")

        TextArea
        {
            id:messageLog
            text:qsTr("输出显示");
            Layout.preferredHeight: parent.height/2
            Layout.preferredWidth:  parent.width
        }
    Drawer
    {
        Component.onCompleted:
        {
            open();
        }

        id:drawer
        edge: Qt.TopEdge
        x: parent.width/2-width/2
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside

        RowLayout
        {
            anchors.fill: parent
            Label
            {
                text: qsTr("端口号：")

            }

            TextField
            {
                id:portText
                text:"999"
            }
            Button
            {
                text: qsTr("启动服务")

                onClicked:
                {
                    if(Communication.startServer("127.0.0.1",portText.text))
                    {
                        messageLog.text=messageLog.text+"\nsucceed to start server";
                    }

                }

            }
        }
    }
    Button
    {
        x:drawer.x+drawer.width/2-width/2;
        width: 50;
        height: 20
        Image {
            anchors.fill: parent
            source: "qrc:/drag.png"
        }
        onClicked:
        {
            if(drawer.opened)
                drawer.close();
            else
                drawer.open();
        }
        transform: Translate
        {
            y:drawer.y+drawer.height;
        }
    }
}
