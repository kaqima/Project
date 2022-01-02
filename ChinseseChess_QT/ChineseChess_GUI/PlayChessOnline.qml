import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.12
import QtMultimedia

Item {
   // width:parent.width
   // height: width*10/9
    Item{
        id: playArea_Online
        objectName: "playArea_Online"
        height: parent.height
        width: parent.height*9/10
        onWidthChanged:
        {
            width=parent.height*9/10;
            updateChess();
        }
        onHeightChanged:
        {
            width=parent.height*9/10;
            updateChess();
        }

        enabled:Communication.getIsRed_Online()==Communication.getIsRedTurn_Online()
        property int selectedIndex: -1
        property int baseX: 0
        property int baseY: 0
        property int intervalX: width/9
        property int intervalY: height/10
        property point tem;

        function updateChess()
        {

            tem= Communication.getPositionByIndex_Online(hongChe_1.index);
            hongChe_1.x=tem.x*playArea_Online.intervalX+playArea_Online.baseX;
            hongChe_1.y=tem.y*playArea_Online.intervalY+playArea_Online.baseY;
            hongChe_1.enabled=Communication.getIsRed_Online()&&Communication.getIsRedTurn_Online();
            hongChe_1.visible=!Communication.getIsDead_Online(hongChe_1.index);

            tem= Communication.getPositionByIndex_Online(hongMa_1.index);
            hongMa_1.x=tem.x*playArea_Online.intervalX+playArea_Online.baseX;
            hongMa_1.y=tem.y*playArea_Online.intervalY+playArea_Online.baseY;
            hongMa_1.enabled=Communication.getIsRed_Online()&&Communication.getIsRedTurn_Online();
            hongMa_1.visible=!Communication.getIsDead_Online(hongMa_1.index);

            tem= Communication.getPositionByIndex_Online(hongXiang_1.index);
            hongXiang_1.x=tem.x*playArea_Online.intervalX+playArea_Online.baseX;
            hongXiang_1.y=tem.y*playArea_Online.intervalY+playArea_Online.baseY;
            hongXiang_1.enabled=Communication.getIsRed_Online()&&Communication.getIsRedTurn_Online();
            hongXiang_1.visible=!Communication.getIsDead_Online(hongXiang_1.index);

            tem= Communication.getPositionByIndex_Online(hongShi_1.index);
            hongShi_1.x=tem.x*playArea_Online.intervalX+playArea_Online.baseX;
            hongShi_1.y=tem.y*playArea_Online.intervalY+playArea_Online.baseY;
            hongShi_1.enabled=Communication.getIsRed_Online()&&Communication.getIsRedTurn_Online();
            hongShi_1.visible=!Communication.getIsDead_Online(hongShi_1.index);


            tem= Communication.getPositionByIndex_Online(hongJiang.index);
            hongJiang.x=tem.x*playArea_Online.intervalX+playArea_Online.baseX;
            hongJiang.y=tem.y*playArea_Online.intervalY+playArea_Online.baseY;
            hongJiang.enabled=Communication.getIsRed_Online()&&Communication.getIsRedTurn_Online();
            hongJiang.visible=!Communication.getIsDead_Online(hongJiang.index);

            tem= Communication.getPositionByIndex_Online(hongShi_2.index);
            hongShi_2.x=tem.x*playArea_Online.intervalX+playArea_Online.baseX;
            hongShi_2.y=tem.y*playArea_Online.intervalY+playArea_Online.baseY;
            hongShi_2.enabled=Communication.getIsRed_Online()&&Communication.getIsRedTurn_Online();
            hongShi_2.visible=!Communication.getIsDead_Online(hongShi_2.index);

            tem= Communication.getPositionByIndex_Online(hongXiang_2.index);
            hongXiang_2.x=tem.x*playArea_Online.intervalX+playArea_Online.baseX;
            hongXiang_2.y=tem.y*playArea_Online.intervalY+playArea_Online.baseY;
            hongXiang_2.enabled=Communication.getIsRed_Online()&&Communication.getIsRedTurn_Online();
            hongXiang_2.visible=!Communication.getIsDead_Online(hongXiang_2.index);


            tem= Communication.getPositionByIndex_Online(hongMa_2.index);
            hongMa_2.x=tem.x*playArea_Online.intervalX+playArea_Online.baseX;
            hongMa_2.y=tem.y*playArea_Online.intervalY+playArea_Online.baseY;
            hongMa_2.enabled=Communication.getIsRed_Online()&&Communication.getIsRedTurn_Online();
            hongMa_2.visible=!Communication.getIsDead_Online(hongMa_2.index);

            tem= Communication.getPositionByIndex_Online(hongChe_2.index);
            hongChe_2.x=tem.x*playArea_Online.intervalX+playArea_Online.baseX;
            hongChe_2.y=tem.y*playArea_Online.intervalY+playArea_Online.baseY;
            hongChe_2.enabled=Communication.getIsRed_Online()&&Communication.getIsRedTurn_Online();
            hongChe_2.visible=!Communication.getIsDead_Online(hongChe_2.index);

            tem= Communication.getPositionByIndex_Online(hongBing_1.index);
            hongBing_1.x=tem.x*playArea_Online.intervalX+playArea_Online.baseX;
            hongBing_1.y=tem.y*playArea_Online.intervalY+playArea_Online.baseY;
            hongBing_1.enabled=Communication.getIsRed_Online()&&Communication.getIsRedTurn_Online();
            hongBing_1.visible=!Communication.getIsDead_Online(hongBing_1.index);


            tem= Communication.getPositionByIndex_Online(hongBing_2.index);
            hongBing_2.x=tem.x*playArea_Online.intervalX+playArea_Online.baseX;
            hongBing_2.y=tem.y*playArea_Online.intervalY+playArea_Online.baseY;
            hongBing_2.enabled=Communication.getIsRed_Online()&&Communication.getIsRedTurn_Online();
            hongBing_2.visible=!Communication.getIsDead_Online(hongBing_2.index);

            tem= Communication.getPositionByIndex_Online(hongBing_3.index);
            hongBing_3.x=tem.x*playArea_Online.intervalX+playArea_Online.baseX;
            hongBing_3.y=tem.y*playArea_Online.intervalY+playArea_Online.baseY;
            hongBing_3.enabled=Communication.getIsRed_Online()&&Communication.getIsRedTurn_Online();
            hongBing_3.visible=!Communication.getIsDead_Online(hongBing_3.index);

            tem= Communication.getPositionByIndex_Online(hongBing_4.index);
            hongBing_4.x=tem.x*playArea_Online.intervalX+playArea_Online.baseX;
            hongBing_4.y=tem.y*playArea_Online.intervalY+playArea_Online.baseY;
            hongBing_4.enabled=Communication.getIsRed_Online&&Communication.getIsRedTurn_Online();
            hongBing_4.visible=!Communication.getIsDead_Online(hongBing_4.index);

            tem= Communication.getPositionByIndex_Online(hongBing_5.index);
            hongBing_5.x=tem.x*playArea_Online.intervalX+playArea_Online.baseX;
            hongBing_5.y=tem.y*playArea_Online.intervalY+playArea_Online.baseY;
            hongBing_5.enabled=Communication.getIsRed_Online()&&Communication.getIsRedTurn_Online();
            hongBing_5.visible=!Communication.getIsDead_Online(hongBing_5.index);

            tem= Communication.getPositionByIndex_Online(hongPao_1.index);
            hongPao_1.x=tem.x*playArea_Online.intervalX+playArea_Online.baseX;
            hongPao_1.y=tem.y*playArea_Online.intervalY+playArea_Online.baseY;
            hongPao_1.enabled=Communication.getIsRed_Online()&&Communication.getIsRedTurn_Online();
            hongPao_1.visible=!Communication.getIsDead_Online(hongPao_1.index);

            tem= Communication.getPositionByIndex_Online(hongPao_2.index);
            hongPao_2.x=tem.x*playArea_Online.intervalX+playArea_Online.baseX;
            hongPao_2.y=tem.y*playArea_Online.intervalY+playArea_Online.baseY;
            hongPao_2.enabled=Communication.getIsRed_Online()&&Communication.getIsRedTurn_Online();
            hongPao_2.visible=!Communication.getIsDead_Online(hongPao_2.index);
// blue start
            tem= Communication.getPositionByIndex_Online(lanChe_1.index);
            lanChe_1.x=tem.x*playArea_Online.intervalX+playArea_Online.baseX;
            lanChe_1.y=tem.y*playArea_Online.intervalY+playArea_Online.baseY;
            lanChe_1.enabled=!Communication.getIsRed_Online()&&!Communication.getIsRedTurn_Online();
            lanChe_1.visible=!Communication.getIsDead_Online(lanChe_1.index);

            tem= Communication.getPositionByIndex_Online(lanMa_1.index);
            lanMa_1.x=tem.x*playArea_Online.intervalX+playArea_Online.baseX;
            lanMa_1.y=tem.y*playArea_Online.intervalY+playArea_Online.baseY;
            lanMa_1.enabled=!Communication.getIsRed_Online()&&!Communication.getIsRedTurn_Online();
            lanMa_1.visible=!Communication.getIsDead_Online(lanMa_1.index);

            tem= Communication.getPositionByIndex_Online(lanXiang_1.index);
            lanXiang_1.x=tem.x*playArea_Online.intervalX+playArea_Online.baseX;
            lanXiang_1.y=tem.y*playArea_Online.intervalY+playArea_Online.baseY;
            lanXiang_1.enabled=!Communication.getIsRed_Online()&&!Communication.getIsRedTurn_Online();
            lanXiang_1.visible=!Communication.getIsDead_Online(lanXiang_1.index);

            tem= Communication.getPositionByIndex_Online(lanShi_1.index);
            lanShi_1.x=tem.x*playArea_Online.intervalX+playArea_Online.baseX;
            lanShi_1.y=tem.y*playArea_Online.intervalY+playArea_Online.baseY;
            lanShi_1.enabled=!Communication.getIsRed_Online()&&!Communication.getIsRedTurn_Online();
            lanShi_1.visible=!Communication.getIsDead_Online(lanShi_1.index);


            tem= Communication.getPositionByIndex_Online(lanJiang.index);
            lanJiang.x=tem.x*playArea_Online.intervalX+playArea_Online.baseX;
            lanJiang.y=tem.y*playArea_Online.intervalY+playArea_Online.baseY;
            lanJiang.enabled=!Communication.getIsRed_Online()&&!Communication.getIsRedTurn_Online();
            lanJiang.visible=!Communication.getIsDead_Online(lanJiang.index);

            tem= Communication.getPositionByIndex_Online(lanShi_2.index);
            lanShi_2.x=tem.x*playArea_Online.intervalX+playArea_Online.baseX;
            lanShi_2.y=tem.y*playArea_Online.intervalY+playArea_Online.baseY;
            lanShi_2.enabled=!Communication.getIsRed_Online()&&!Communication.getIsRedTurn_Online();
            lanShi_2.visible=!Communication.getIsDead_Online(lanShi_2.index);

            tem= Communication.getPositionByIndex_Online(lanXiang_2.index);
            lanXiang_2.x=tem.x*playArea_Online.intervalX+playArea_Online.baseX;
            lanXiang_2.y=tem.y*playArea_Online.intervalY+playArea_Online.baseY;
            lanXiang_2.enabled=!Communication.getIsRed_Online()&&!Communication.getIsRedTurn_Online();
            lanXiang_2.visible=!Communication.getIsDead_Online(lanXiang_2.index);


            tem= Communication.getPositionByIndex_Online(lanMa_2.index);
            lanMa_2.x=tem.x*playArea_Online.intervalX+playArea_Online.baseX;
            lanMa_2.y=tem.y*playArea_Online.intervalY+playArea_Online.baseY;
            lanMa_2.enabled=!Communication.getIsRed_Online()&&!Communication.getIsRedTurn_Online();
            lanMa_2.visible=!Communication.getIsDead_Online(lanMa_2.index);

            tem= Communication.getPositionByIndex_Online(lanChe_2.index);
            lanChe_2.x=tem.x*playArea_Online.intervalX+playArea_Online.baseX;
            lanChe_2.y=tem.y*playArea_Online.intervalY+playArea_Online.baseY;
            lanChe_2.enabled=!Communication.getIsRed_Online()&&!Communication.getIsRedTurn_Online();
            lanChe_2.visible=!Communication.getIsDead_Online(lanChe_2.index);

            tem= Communication.getPositionByIndex_Online(lanBing_1.index);
            lanBing_1.x=tem.x*playArea_Online.intervalX+playArea_Online.baseX;
            lanBing_1.y=tem.y*playArea_Online.intervalY+playArea_Online.baseY;
            lanBing_1.enabled=!Communication.getIsRed_Online()&&!Communication.getIsRedTurn_Online();
            lanBing_1.visible=!Communication.getIsDead_Online(lanBing_1.index);


            tem= Communication.getPositionByIndex_Online(lanBing_2.index);
            lanBing_2.x=tem.x*playArea_Online.intervalX+playArea_Online.baseX;
            lanBing_2.y=tem.y*playArea_Online.intervalY+playArea_Online.baseY;
            lanBing_2.enabled=!Communication.getIsRed_Online()&&!Communication.getIsRedTurn_Online();
            lanBing_2.visible=!Communication.getIsDead_Online(lanBing_2.index);

            tem= Communication.getPositionByIndex_Online(lanBing_3.index);
            lanBing_3.x=tem.x*playArea_Online.intervalX+playArea_Online.baseX;
            lanBing_3.y=tem.y*playArea_Online.intervalY+playArea_Online.baseY;
            lanBing_3.enabled=!Communication.getIsRed_Online()&&!Communication.getIsRedTurn_Online();
            lanBing_3.visible=!Communication.getIsDead_Online(lanBing_3.index);

            tem= Communication.getPositionByIndex_Online(lanBing_4.index);
            lanBing_4.x=tem.x*playArea_Online.intervalX+playArea_Online.baseX;
            lanBing_4.y=tem.y*playArea_Online.intervalY+playArea_Online.baseY;
            lanBing_4.enabled=!Communication.getIsRed_Online()&&!Communication.getIsRedTurn_Online();
            lanBing_4.visible=!Communication.getIsDead_Online(lanBing_4.index);

            tem= Communication.getPositionByIndex_Online(lanBing_5.index);
            lanBing_5.x=tem.x*playArea_Online.intervalX+playArea_Online.baseX;
            lanBing_5.y=tem.y*playArea_Online.intervalY+playArea_Online.baseY;
            lanBing_5.enabled=!Communication.getIsRed_Online()&&!Communication.getIsRedTurn_Online();
            lanBing_5.visible=!Communication.getIsDead_Online(lanBing_5.index);

            tem= Communication.getPositionByIndex_Online(lanPao_1.index);
            lanPao_1.x=tem.x*playArea_Online.intervalX+playArea_Online.baseX;
            lanPao_1.y=tem.y*playArea_Online.intervalY+playArea_Online.baseY;
            lanPao_1.enabled=!Communication.getIsRed_Online()&&!Communication.getIsRedTurn_Online();
            lanPao_1.visible=!Communication.getIsDead_Online(lanPao_1.index);

            tem= Communication.getPositionByIndex_Online(lanPao_2.index);
            lanPao_2.x=tem.x*playArea_Online.intervalX+playArea_Online.baseX;
            lanPao_2.y=tem.y*playArea_Online.intervalY+playArea_Online.baseY;
            lanPao_2.enabled=!Communication.getIsRed_Online()&&!Communication.getIsRedTurn_Online();
            lanPao_2.visible=!Communication.getIsDead_Online(lanPao_2.index);


            playArea_Online.enabled=Communication.getIsRed_Online()==Communication.getIsRedTurn_Online();
        }
        Component.onCompleted:
        {
            startGameSound_Online.play();
        }


        Image
        {
            id:chessBoardBackGround_Online
            objectName: "chessBoardBackGround_Online"
            anchors.fill: parent;
            source: "qrc:/source/chessImage/chessBoardImage.png"
            fillMode: Image.Stretch
        }
        Image {
            anchors.fill: parent;
            source: "qrc:/source/chessImage/chessBoardLine.png"
            fillMode: Image.Stretch
            anchors.margins: parent.height/20

        }
        SoundEffect
        {
            id:jiangJunSound_Online
            objectName: "jiangJunSound_Online"
            source:"qrc:/source/music/JiangJun.wav"
        }
        SoundEffect
        {
            id:moveChessSouncd_Online
            objectName: "moveChessSouncd_Online"
            source: "qrc:/source/music/moveChess.wav"
        }
        SoundEffect
        {
            id:startGameSound_Online
            objectName:"startGameSound_Online"
            source: "qrc:/source/music/drumStart.wav"

        }
        SoundEffect
        {
            id:endGameSound_Online
            objectName: "endGameSound_Online"

            source: "qrc:/source/music/drumEnd.wav"

        }
        SoundEffect
        {
            id:beiJiangJunSound_Online
            objectName: "beiJiangJunSound_Online"
            source: "qrc:/source/music/beiJIangjun.wav"
        }

        MouseArea
        {
            anchors.fill: parent
            onClicked:
            {
                if(playArea_Online.selectedIndex==-1)
                    return;
                switch(Communication.moveChess_Online(playArea_Online.selectedIndex,(mouseX-playArea_Online.baseX)/playArea_Online.intervalX,(mouseY-playArea_Online.baseY)/playArea_Online.intervalY))
                {
                case -1:beiJiangJunSound_Online.play();chatArea_Online.text=chatArea_Online.text+"\n你正在被将军!"; break;
                case 0: break;
                case 1: moveChessSouncd_Online.play();  break;
                case 2: jiangJunSound_Online.play(); break;
                case 3: endGameSound_Online.play();break;
                case 4: endGameSound_Online.play(); break;
                }

                parent.selectedIndex=-1;
                playArea_Online.updateChess();
            }
        }



        Image {
            id: hongChe_1
            enabled:Communication.getIsRed_Online()&&Communication.getIsRedTurn_Online()
            x: Communication.getPositionByIndex_Online(index).x*playArea_Online.intervalX+playArea_Online.baseX;
            y: Communication.getPositionByIndex_Online(index).y*playArea_Online.intervalX+playArea_Online.baseY;
            width: parent.width/9
            height: parent.height/10
            source:"qrc:/source/chessImage/redChess/che.png"
            property int index: 0;
            MouseArea {
                anchors.fill: parent
                onClicked:
                {
                    playArea_Online.selectedIndex=parent.index;

                }
            }
        }
        Image {
            id: hongMa_1
            enabled:Communication.getIsRed_Online()&&Communication.getIsRedTurn_Online()
            x: Communication.getPositionByIndex_Online(index).x*playArea_Online.intervalX+playArea_Online.baseX;
            y: Communication.getPositionByIndex_Online(index).y*playArea_Online.intervalX+playArea_Online.baseY;
            width: parent.width/9
            height: parent.height/10
            source:"qrc:/source/chessImage/redChess/ma.png"
            property int index: 1;
            MouseArea {
                anchors.fill: parent
                onClicked:
                {
                    playArea_Online.selectedIndex=parent.index;

                }
            }
        }
        Image {
            id: hongXiang_1
            enabled:Communication.getIsRed_Online()&&Communication.getIsRedTurn_Online()
            x: Communication.getPositionByIndex_Online(index).x*playArea_Online.intervalX+playArea_Online.baseX;
            y: Communication.getPositionByIndex_Online(index).y*playArea_Online.intervalX+playArea_Online.baseY;
            width: parent.width/9
            height: parent.height/10
            source:"qrc:/source/chessImage/redChess/xiang.png"
            property int index: 2;
            MouseArea {
                anchors.fill: parent
                onClicked:
                {
                    playArea_Online.selectedIndex=parent.index;

                }
            }
        }
        Image {
            id: hongShi_1
            enabled:Communication.getIsRed_Online()&&Communication.getIsRedTurn_Online()
            x: Communication.getPositionByIndex_Online(index).x*playArea_Online.intervalX+playArea_Online.baseX;
            y: Communication.getPositionByIndex_Online(index).y*playArea_Online.intervalX+playArea_Online.baseY;
            width: parent.width/9
            height: parent.height/10
            source:"qrc:/source/chessImage/redChess/shi.png"
            property int index: 3;
            MouseArea {
                anchors.fill: parent
                onClicked:
                {
                    playArea_Online.selectedIndex=parent.index;

                }
            }
        }
        Image {
            id: hongJiang
            enabled:Communication.getIsRed_Online()&&Communication.getIsRedTurn_Online()
            x: Communication.getPositionByIndex_Online(index).x*playArea_Online.intervalX+playArea_Online.baseX;
            y: Communication.getPositionByIndex_Online(index).y*playArea_Online.intervalX+playArea_Online.baseY;
            width: parent.width/9
            height: parent.height/10
            source:"qrc:/source/chessImage/redChess/jiang.png"
            property int index: 4;
            MouseArea {
                anchors.fill: parent
                onClicked:
                {
                    playArea_Online.selectedIndex=parent.index;

                }
            }
        }
        Image {
            id: hongShi_2
            enabled:Communication.getIsRed_Online()&&Communication.getIsRedTurn_Online()
            x: Communication.getPositionByIndex_Online(index).x*playArea_Online.intervalX+playArea_Online.baseX;
            y: Communication.getPositionByIndex_Online(index).y*playArea_Online.intervalX+playArea_Online.baseY;
            width: parent.width/9
            height: parent.height/10
            source:"qrc:/source/chessImage/redChess/shi.png"
            property int index: 5;
            MouseArea {
                anchors.fill: parent
                onClicked:
                {
                    playArea_Online.selectedIndex=parent.index;

                }
            }
        }
        Image {
            id: hongXiang_2
            enabled:Communication.getIsRed_Online()&&Communication.getIsRedTurn_Online()
            x: Communication.getPositionByIndex_Online(index).x*playArea_Online.intervalX+playArea_Online.baseX;
            y: Communication.getPositionByIndex_Online(index).y*playArea_Online.intervalX+playArea_Online.baseY;
            width: parent.width/9
            height: parent.height/10
            source:"qrc:/source/chessImage/redChess/xiang.png"
            property int index: 6;
            MouseArea {
                anchors.fill: parent
                onClicked:
                {
                    playArea_Online.selectedIndex=parent.index;

                }
            }
        }
        Image {
            id: hongMa_2
            enabled:Communication.getIsRed_Online()&&Communication.getIsRedTurn_Online()
            x: Communication.getPositionByIndex_Online(index).x*playArea_Online.intervalX+playArea_Online.baseX;
            y: Communication.getPositionByIndex_Online(index).y*playArea_Online.intervalX+playArea_Online.baseY;
            width: parent.width/9
            height: parent.height/10
            source:"qrc:/source/chessImage/redChess/ma.png"
            property int index: 7;
            MouseArea {
                anchors.fill: parent
                onClicked:
                {
                    playArea_Online.selectedIndex=parent.index;

                }
            }
        }
        Image {
            id: hongChe_2
            enabled:Communication.getIsRed_Online()&&Communication.getIsRedTurn_Online()
            x: Communication.getPositionByIndex_Online(index).x*playArea_Online.intervalX+playArea_Online.baseX;
            y: Communication.getPositionByIndex_Online(index).y*playArea_Online.intervalX+playArea_Online.baseY;
            width: parent.width/9
            height: parent.height/10
            source:"qrc:/source/chessImage/redChess/che.png"
            property int index: 8;
            MouseArea {
                anchors.fill: parent
                onClicked:
                {
                    playArea_Online.selectedIndex=parent.index;

                }
            }
        }
        Image {
            id: hongBing_1
            enabled:Communication.getIsRed_Online()&&Communication.getIsRedTurn_Online()
            x: Communication.getPositionByIndex_Online(index).x*playArea_Online.intervalX+playArea_Online.baseX;
            y: Communication.getPositionByIndex_Online(index).y*playArea_Online.intervalX+playArea_Online.baseY;
            width: parent.width/9
            height: parent.height/10
            source:"qrc:/source/chessImage/redChess/bing.png"
            property int index: 9;
            MouseArea {
                anchors.fill: parent
                onClicked:
                {
                    playArea_Online.selectedIndex=parent.index;

                }
            }
        }
        Image {
            id: hongBing_2
            enabled:Communication.getIsRed_Online()&&Communication.getIsRedTurn_Online()
            x: Communication.getPositionByIndex_Online(index).x*playArea_Online.intervalX+playArea_Online.baseX;
            y: Communication.getPositionByIndex_Online(index).y*playArea_Online.intervalX+playArea_Online.baseY;
            width: parent.width/9
            height: parent.height/10
            source:"qrc:/source/chessImage/redChess/bing.png"
            property int index: 10;
            MouseArea {
                anchors.fill: parent
                onClicked:
                {
                    playArea_Online.selectedIndex=parent.index;

                }
            }
        }
        Image {
            id: hongBing_3
            enabled:Communication.getIsRed_Online()&&Communication.getIsRedTurn_Online()
            x: Communication.getPositionByIndex_Online(index).x*playArea_Online.intervalX+playArea_Online.baseX;
            y: Communication.getPositionByIndex_Online(index).y*playArea_Online.intervalX+playArea_Online.baseY;
            width: parent.width/9
            height: parent.height/10
            source:"qrc:/source/chessImage/redChess/bing.png"
            property int index: 11;
            MouseArea {
                anchors.fill: parent
                onClicked:
                {
                    playArea_Online.selectedIndex=parent.index;

                }
            }
        }
        Image {
            id: hongBing_4
            enabled:Communication.getIsRed_Online()&&Communication.getIsRedTurn_Online()
            x: Communication.getPositionByIndex_Online(index).x*playArea_Online.intervalX+playArea_Online.baseX;
            y: Communication.getPositionByIndex_Online(index).y*playArea_Online.intervalX+playArea_Online.baseY;
            width: parent.width/9
            height: parent.height/10
            source:"qrc:/source/chessImage/redChess/bing.png"
            property int index: 12;
            MouseArea {
                anchors.fill: parent
                onClicked:
                {
                    playArea_Online.selectedIndex=parent.index;

                }
            }
        }
        Image {
            id: hongBing_5
            enabled:Communication.getIsRed_Online()&&Communication.getIsRedTurn_Online()
            x: Communication.getPositionByIndex_Online(index).x*playArea_Online.intervalX+playArea_Online.baseX;
            y: Communication.getPositionByIndex_Online(index).y*playArea_Online.intervalX+playArea_Online.baseY;
            width: parent.width/9
            height: parent.height/10
            source:"qrc:/source/chessImage/redChess/bing.png"
            property int index: 13;
            MouseArea {
                anchors.fill: parent
                onClicked:
                {
                    playArea_Online.selectedIndex=parent.index;

                }
            }
        }
        Image {
            id: hongPao_1
            enabled:Communication.getIsRed_Online()&&Communication.getIsRedTurn_Online()
            x: Communication.getPositionByIndex_Online(index).x*playArea_Online.intervalX+playArea_Online.baseX;
            y: Communication.getPositionByIndex_Online(index).y*playArea_Online.intervalX+playArea_Online.baseY;
            width: parent.width/9
            height: parent.height/10
            source:"qrc:/source/chessImage/redChess/pao.png"
            property int index: 14;
            MouseArea {
                anchors.fill: parent
                onClicked:
                {
                    playArea_Online.selectedIndex=parent.index;
                }
            }
        }
        Image {
            id: hongPao_2
            enabled:Communication.getIsRed_Online()&&Communication.getIsRedTurn_Online()
            x: Communication.getPositionByIndex_Online(index).x*playArea_Online.intervalX+Communication.getPositionByIndex_Online(index).x;
            y: Communication.getPositionByIndex_Online(index).y*playArea_Online.intervalX+playArea_Online.baseY;
            width: parent.width/9
            height: parent.height/10
            source:"qrc:/source/chessImage/redChess/pao.png"
            property int index: 15;
            MouseArea {
                anchors.fill: parent
                onClicked:
                {
                    playArea_Online.selectedIndex=parent.index;
                }
            }
        }
        // blue
        Image {
            id: lanChe_1
            enabled:!Communication.getIsRed_Online()&&!Communication.getIsRedTurn_Online()
            x: Communication.getPositionByIndex_Online(index).x*playArea_Online.intervalX+playArea_Online.baseX;
            y: Communication.getPositionByIndex_Online(index).y*playArea_Online.intervalX+playArea_Online.baseY;
            width: parent.width/9
            height: parent.height/10
            source:"qrc:/source/chessImage/blueChess/che.png"
            property int index: 16;
            MouseArea {
                anchors.fill: parent
                onClicked:
                {
                    playArea_Online.selectedIndex=parent.index;

                }
            }
        }
        Image {
            id: lanMa_1
            enabled:!Communication.getIsRed_Online()&&!Communication.getIsRedTurn_Online()
            x: Communication.getPositionByIndex_Online(index).x*playArea_Online.intervalX+playArea_Online.baseX;
            y: Communication.getPositionByIndex_Online(index).y*playArea_Online.intervalX+playArea_Online.baseY;
            width: parent.width/9
            height: parent.height/10
            source:"qrc:/source/chessImage/blueChess/ma.png"
            property int index: 17;
            MouseArea {
                anchors.fill: parent
                onClicked:
                {
                    playArea_Online.selectedIndex=parent.index;

                }
            }
        }
        Image {
            id: lanXiang_1
            enabled:!Communication.getIsRed_Online()&&!Communication.getIsRedTurn_Online()
            x: Communication.getPositionByIndex_Online(index).x*playArea_Online.intervalX+playArea_Online.baseX;
            y: Communication.getPositionByIndex_Online(index).y*playArea_Online.intervalX+playArea_Online.baseY;
            width: parent.width/9
            height: parent.height/10
            source:"qrc:/source/chessImage/blueChess/xiang.png"
            property int index: 18;
            MouseArea {
                anchors.fill: parent
                onClicked:
                {
                    playArea_Online.selectedIndex=parent.index;

                }
            }
        }
        Image {
            id: lanShi_1
            enabled:!Communication.getIsRed_Online()&&!Communication.getIsRedTurn_Online()
            x: Communication.getPositionByIndex_Online(index).x*playArea_Online.intervalX+playArea_Online.baseX;
            y: Communication.getPositionByIndex_Online(index).y*playArea_Online.intervalX+playArea_Online.baseY;
            width: parent.width/9
            height: parent.height/10
            source:"qrc:/source/chessImage/blueChess/shi.png"
            property int index: 19;
            MouseArea {
                anchors.fill: parent
                onClicked:
                {
                    playArea_Online.selectedIndex=parent.index;
                    console.log("you click lan shi1");

                }
            }
        }
        Image {
            id: lanJiang
            enabled:!Communication.getIsRed_Online()&&!Communication.getIsRedTurn_Online()
            x: Communication.getPositionByIndex_Online(index).x*playArea_Online.intervalX+playArea_Online.baseX;
            y: Communication.getPositionByIndex_Online(index).y*playArea_Online.intervalX+playArea_Online.baseY;
            width: parent.width/9
            height: parent.height/10
            source:"qrc:/source/chessImage/blueChess/jiang.png"
            property int index: 20;
            MouseArea {
                anchors.fill: parent
                onClicked:
                {
                    playArea_Online.selectedIndex=parent.index;

                }
            }
        }
        Image {
            id: lanShi_2
            enabled:!Communication.getIsRed_Online()&&!Communication.getIsRedTurn_Online()
            x: Communication.getPositionByIndex_Online(index).x*playArea_Online.intervalX+playArea_Online.baseX;
            y: Communication.getPositionByIndex_Online(index).y*playArea_Online.intervalX+playArea_Online.baseY;
            width: parent.width/9
            height: parent.height/10
            source:"qrc:/source/chessImage/blueChess/shi.png"
            property int index: 21;
            MouseArea {
                anchors.fill: parent
                onClicked:
                {
                    playArea_Online.selectedIndex=parent.index;

                }
            }
        }
        Image {
            id: lanXiang_2
            enabled:!Communication.getIsRed_Online()&&!Communication.getIsRedTurn_Online()
            x: Communication.getPositionByIndex_Online(index).x*playArea_Online.intervalX+playArea_Online.baseX;
            y: Communication.getPositionByIndex_Online(index).y*playArea_Online.intervalX+playArea_Online.baseY;
            width: parent.width/9
            height: parent.height/10
            source:"qrc:/source/chessImage/blueChess/xiang.png"
            property int index: 22;
            MouseArea {
                anchors.fill: parent
                onClicked:
                {
                    playArea_Online.selectedIndex=parent.index;

                }
            }
        }
        Image {
            id: lanMa_2
            enabled:!Communication.getIsRed_Online()&&!Communication.getIsRedTurn_Online()
            x: Communication.getPositionByIndex_Online(index).x*playArea_Online.intervalX+playArea_Online.baseX;
            y: Communication.getPositionByIndex_Online(index).y*playArea_Online.intervalX+playArea_Online.baseY;
            width: parent.width/9
            height: parent.height/10
            source:"qrc:/source/chessImage/blueChess/ma.png"
            property int index: 23;
            MouseArea {
                anchors.fill: parent
                onClicked:
                {
                    playArea_Online.selectedIndex=parent.index;

                }
            }
        }
        Image {
            id: lanChe_2
            enabled:!Communication.getIsRed_Online()&&!Communication.getIsRedTurn_Online()
            x: Communication.getPositionByIndex_Online(index).x*playArea_Online.intervalX+playArea_Online.baseX;
            y: Communication.getPositionByIndex_Online(index).y*playArea_Online.intervalX+playArea_Online.baseY;
            width: parent.width/9
            height: parent.height/10
            source:"qrc:/source/chessImage/blueChess/che.png"
            property int index: 24;
            MouseArea {
                anchors.fill: parent
                onClicked:
                {
                    playArea_Online.selectedIndex=parent.index;

                }
            }
        }
        Image {
            id: lanBing_1
            enabled:!Communication.getIsRed_Online()&&!Communication.getIsRedTurn_Online()
            x: Communication.getPositionByIndex_Online(index).x*playArea_Online.intervalX+playArea_Online.baseX;
            y: Communication.getPositionByIndex_Online(index).y*playArea_Online.intervalX+playArea_Online.baseY;
            width: parent.width/9
            height: parent.height/10
            source:"qrc:/source/chessImage/blueChess/bing.png"
            property int index: 25;
            MouseArea {
                anchors.fill: parent
                onClicked:
                {
                    playArea_Online.selectedIndex=parent.index;

                }
            }
        }
        Image {
            id: lanBing_2
            enabled:!Communication.getIsRed_Online()&&!Communication.getIsRedTurn_Online()
            x: Communication.getPositionByIndex_Online(index).x*playArea_Online.intervalX+playArea_Online.baseX;
            y: Communication.getPositionByIndex_Online(index).y*playArea_Online.intervalX+playArea_Online.baseY;
            width: parent.width/9
            height: parent.height/10
            source:"qrc:/source/chessImage/blueChess/bing.png"
            property int index: 26;
            MouseArea {
                anchors.fill: parent
                onClicked:
                {
                    playArea_Online.selectedIndex=parent.index;

                }
            }
        }
        Image {
            id: lanBing_3
            enabled:!Communication.getIsRed_Online()&&!Communication.getIsRedTurn_Online()
            x: Communication.getPositionByIndex_Online(index).x*playArea_Online.intervalX+playArea_Online.baseX;
            y: Communication.getPositionByIndex_Online(index).y*playArea_Online.intervalX+playArea_Online.baseY;
            width: parent.width/9
            height: parent.height/10
            source:"qrc:/source/chessImage/blueChess/bing.png"
            property int index: 27;
            MouseArea {
                anchors.fill: parent
                onClicked:
                {
                    playArea_Online.selectedIndex=parent.index;

                }
            }
        }
        Image {
            id: lanBing_4
            enabled:!Communication.getIsRed_Online()&&!Communication.getIsRedTurn_Online()
            x: Communication.getPositionByIndex_Online(index).x*playArea_Online.intervalX+playArea_Online.baseX;
            y: Communication.getPositionByIndex_Online(index).y*playArea_Online.intervalX+playArea_Online.baseY;
            width: parent.width/9
            height: parent.height/10
            source:"qrc:/source/chessImage/blueChess/bing.png"
            property int index: 28;
            MouseArea {
                anchors.fill: parent
                onClicked:
                {
                    playArea_Online.selectedIndex=parent.index;

                }
            }
        }
        Image {
            id: lanBing_5
            enabled:!Communication.getIsRed_Online()&&!Communication.getIsRedTurn_Online()
            x: Communication.getPositionByIndex_Online(index).x*playArea_Online.intervalX+playArea_Online.baseX;
            y: Communication.getPositionByIndex_Online(index).y*playArea_Online.intervalX+playArea_Online.baseY;
            width: parent.width/9
            height: parent.height/10
            source:"qrc:/source/chessImage/blueChess/bing.png"
            property int index: 29;
            MouseArea {
                anchors.fill: parent
                onClicked:
                {
                    playArea_Online.selectedIndex=parent.index;

                }
            }
        }
        Image {
            id: lanPao_1
            enabled:!Communication.getIsRed_Online()&&!Communication.getIsRedTurn_Online()
            x: Communication.getPositionByIndex_Online(index).x*playArea_Online.intervalX+playArea_Online.baseX;
            y: Communication.getPositionByIndex_Online(index).y*playArea_Online.intervalX+playArea_Online.baseY;
            width: parent.width/9
            height: parent.height/10
            source:"qrc:/source/chessImage/blueChess/pao.png"
            property int index: 30;
            MouseArea {
                anchors.fill: parent
                onClicked:
                {
                    playArea_Online.selectedIndex=parent.index;
                }
            }
        }
        Image {
            id: lanPao_2
            enabled:!Communication.getIsRed_Online()&&!Communication.getIsRedTurn_Online()
            x: Communication.getPositionByIndex_Online(index).x*playArea_Online.intervalX+Communication.getPositionByIndex_Online(index).x;
            y: Communication.getPositionByIndex_Online(index).y*playArea_Online.intervalX+playArea_Online.baseY;
            width: parent.width/9
            height: parent.height/10
            source:"qrc:/source/chessImage/blueChess/pao.png"
            property int index: 31;
            MouseArea {

                anchors.fill: parent
                onClicked:
                {
                    playArea_Online.selectedIndex=parent.index;
                }
            }
        }




    }
    Item {
        id: sideArea_Online
        objectName: "sideArea"
        width: parent.width-playArea_Online.width
        height: parent.height
        x:playArea_Online.width
        ColumnLayout
        {
            anchors.fill: parent

            Rectangle
            {
                color: "transparent"
                border.width: 1
                Layout.alignment: Qt.AlignHCenter
            }

            TextArea
            {
                id:chatArea_Online
                objectName: "chatArea_Online"
                Layout.preferredHeight: parent.height/3
                Layout.alignment: Qt.AlignHCenter
                text:qsTr("聊天室")
                background: Rectangle
                {
                    opacity:0.5
                }
            }

            Rectangle
            {
                Layout.alignment: Qt.AlignHCenter
                RowLayout
                {
                    anchors.fill: parent
                    DelayButton
                    {
                        text: qsTr("悔棋")
                        onActivated:
                        {

                            if(!Communication.canRegret_Online())
                                chatArea_Online.text=chatArea_Online.text+'\n'+"你不能悔棋";
                            else
                                Communication.requestRegret_Online();
                        }
                        onReleased:
                        {
                            progress=0;
                        }
                    }
                    DelayButton
                    {
                        text: qsTr("求和")
                        onActivated:
                        {
                            Communication.requestDraw_Online();
                        }
                        onReleased:
                        {
                            progress=0;
                        }
                    }
                }

            }
            RowLayout
            {
                Layout.alignment: Qt.AlignHCenter
                TextField
                {
                    id:sendText_Online

                    onAccepted:
                    {
                        sendButton.clicked();
                    }
                }
                Button
                {
                    id:sendButton_Online
                    text:qsTr("发送")
                    onClicked:
                    {
                        chatArea_Online.text+='\n'+sendText_Online.text;
                        Communication.chat_Online(sendText_Online.text);
                        sendText_Online.text="";
                    }
                }
            }
        }
    }
    Item {
        visible:  false;
            AnimatedImage
            {

                Text {
                    id: name
                    text: qsTr("text")
                }
            }

    }


    Dialog{
        id:popDialog_Online
        anchors.centerIn: parent
        objectName: "messagePop_Online"
        modal: true
        standardButtons: Dialog.Yes|Dialog.No
        property int state : 0 // 0 showMessage , 1 regret , 2 draw
        closePolicy: Popup.NoAutoClose
        Text {
            id: popMessage_Online
            objectName: "popMessage_Online"
            text: qsTr("text")
        }
        Component.onCompleted:
        {
            console.log("yes|no:",Dialog.Yes|Dialog.No);
            console.log("ok:",Dialog.Ok);
        }

        onAccepted:
        {
            console.log("you agree");
           switch(state)
           {
           case 0: close(); break;
           case 1: Communication.responseRegret_Online(true); break;
           case 2: Communication.responseDraw_Online(true); break;
           }
        }
        onRejected:
        {
            console.log("you disagree");
            switch(state)
            {
            case 0: close(); break;
            case 1: Communication.responseRegret_Online(false); break;
            case 2: Communication.responseDraw_Online(false); break;
            }
        }
    }
}

