import QtQuick
import QtQuick.Controls
import QtMultimedia

ApplicationWindow {
    id: window
    width: 640
    height: 480
    visible: true
    title: qsTr("Stack")
    minimumHeight: 480
    minimumWidth: 680
    background: Rectangle
    {
        color:"white"
    }




    StackView {
        function loadHome()
        {
            push("qrc:/Home.qml");
        }
         function loadGame()
         {
             push("qrc:/PlayChessOnline.qml");
         }
        id: stackView
        objectName: "stackView"
        initialItem: "Login.qml"
        anchors.fill: parent
    }
}
