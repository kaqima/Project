import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.12


Item {
   // width:parent.width
   // height: width*10/9

    Item{
        id: playArea
        objectName: "playArea"
        height: parent.height
        width: parent.height*9/10
        onWidthChanged: {
            width=parent.height*9/10;
        }
        onHeightChanged:
        {
            width=parent.height*9/10;
        }


        property int selectedIndex: -1
        property int baseX: 0
        property int baseY: 0
        property int intervalX: width/9
        property int intervalY: height/10
        property point tem;
        function updateChess()
        {

            tem= Communication.getPositionByIndex(hongChe_1.index);
            hongChe_1.x=tem.x*playArea.intervalX+playArea.baseX;
            hongChe_1.y=tem.y*playArea.intervalY+playArea.baseY;
            hongChe_1.enabled=Communication.isRedTurn();
            hongChe_1.visible=!Communication.isDead(hongChe_1.index);

            tem= Communication.getPositionByIndex(hongMa_1.index);
            hongMa_1.x=tem.x*playArea.intervalX+playArea.baseX;
            hongMa_1.y=tem.y*playArea.intervalY+playArea.baseY;
            hongMa_1.enabled=Communication.isRedTurn();
            hongMa_1.visible=!Communication.isDead(hongMa_1.index);

            tem= Communication.getPositionByIndex(hongXiang_1.index);
            hongXiang_1.x=tem.x*playArea.intervalX+playArea.baseX;
            hongXiang_1.y=tem.y*playArea.intervalY+playArea.baseY;
            hongXiang_1.enabled=Communication.isRedTurn();
            hongXiang_1.visible=!Communication.isDead(hongXiang_1.index);

            tem= Communication.getPositionByIndex(hongShi_1.index);
            hongShi_1.x=tem.x*playArea.intervalX+playArea.baseX;
            hongShi_1.y=tem.y*playArea.intervalY+playArea.baseY;
            hongShi_1.enabled=Communication.isRedTurn();
            hongShi_1.visible=!Communication.isDead(hongShi_1.index);


            tem= Communication.getPositionByIndex(hongJiang.index);
            hongJiang.x=tem.x*playArea.intervalX+playArea.baseX;
            hongJiang.y=tem.y*playArea.intervalY+playArea.baseY;
            hongJiang.enabled=Communication.isRedTurn();
            hongJiang.visible=!Communication.isDead(hongJiang.index);

            tem= Communication.getPositionByIndex(hongShi_2.index);
            hongShi_2.x=tem.x*playArea.intervalX+playArea.baseX;
            hongShi_2.y=tem.y*playArea.intervalY+playArea.baseY;
            hongShi_2.enabled=Communication.isRedTurn();
            hongShi_2.visible=!Communication.isDead(hongShi_2.index);

            tem= Communication.getPositionByIndex(hongXiang_2.index);
            hongXiang_2.x=tem.x*playArea.intervalX+playArea.baseX;
            hongXiang_2.y=tem.y*playArea.intervalY+playArea.baseY;
            hongXiang_2.enabled=Communication.isRedTurn();
            hongXiang_2.visible=!Communication.isDead(hongXiang_2.index);


            tem= Communication.getPositionByIndex(hongMa_2.index);
            hongMa_2.x=tem.x*playArea.intervalX+playArea.baseX;
            hongMa_2.y=tem.y*playArea.intervalY+playArea.baseY;
            hongMa_2.enabled=Communication.isRedTurn();
            hongMa_2.visible=!Communication.isDead(hongMa_2.index);

            tem= Communication.getPositionByIndex(hongChe_2.index);
            hongChe_2.x=tem.x*playArea.intervalX+playArea.baseX;
            hongChe_2.y=tem.y*playArea.intervalY+playArea.baseY;
            hongChe_2.enabled=Communication.isRedTurn();
            hongChe_2.visible=!Communication.isDead(hongChe_2.index);

            tem= Communication.getPositionByIndex(hongBing_1.index);
            hongBing_1.x=tem.x*playArea.intervalX+playArea.baseX;
            hongBing_1.y=tem.y*playArea.intervalY+playArea.baseY;
            hongBing_1.enabled=Communication.isRedTurn();
            hongBing_1.visible=!Communication.isDead(hongBing_1.index);


            tem= Communication.getPositionByIndex(hongBing_2.index);
            hongBing_2.x=tem.x*playArea.intervalX+playArea.baseX;
            hongBing_2.y=tem.y*playArea.intervalY+playArea.baseY;
            hongBing_2.enabled=Communication.isRedTurn();
            hongBing_2.visible=!Communication.isDead(hongBing_2.index);

            tem= Communication.getPositionByIndex(hongBing_3.index);
            hongBing_3.x=tem.x*playArea.intervalX+playArea.baseX;
            hongBing_3.y=tem.y*playArea.intervalY+playArea.baseY;
            hongBing_3.enabled=Communication.isRedTurn();
            hongBing_3.visible=!Communication.isDead(hongBing_3.index);

            tem= Communication.getPositionByIndex(hongBing_4.index);
            hongBing_4.x=tem.x*playArea.intervalX+playArea.baseX;
            hongBing_4.y=tem.y*playArea.intervalY+playArea.baseY;
            hongBing_4.enabled=Communication.isRedTurn();
            hongBing_4.visible=!Communication.isDead(hongBing_4.index);

            tem= Communication.getPositionByIndex(hongBing_5.index);
            hongBing_5.x=tem.x*playArea.intervalX+playArea.baseX;
            hongBing_5.y=tem.y*playArea.intervalY+playArea.baseY;
            hongBing_5.enabled=Communication.isRedTurn();
            hongBing_5.visible=!Communication.isDead(hongBing_5.index);

            tem= Communication.getPositionByIndex(hongPao_1.index);
            hongPao_1.x=tem.x*playArea.intervalX+playArea.baseX;
            hongPao_1.y=tem.y*playArea.intervalY+playArea.baseY;
            hongPao_1.enabled=Communication.isRedTurn();
            hongPao_1.visible=!Communication.isDead(hongBing_5.index);

            tem= Communication.getPositionByIndex(hongPao_2.index);
            hongPao_2.x=tem.x*playArea.intervalX+playArea.baseX;
            hongPao_2.y=tem.y*playArea.intervalY+playArea.baseY;
            hongPao_2.enabled=Communication.isRedTurn();
            hongPao_2.visible=!Communication.isDead(hongPao_2.index);
// blue start
            tem= Communication.getPositionByIndex(lanChe_1.index);
            lanChe_1.x=tem.x*playArea.intervalX+playArea.baseX;
            lanChe_1.y=tem.y*playArea.intervalY+playArea.baseY;
            lanChe_1.enabled=!Communication.isRedTurn();
            lanChe_1.visible=!Communication.isDead(lanChe_1.index);

            tem= Communication.getPositionByIndex(lanMa_1.index);
            lanMa_1.x=tem.x*playArea.intervalX+playArea.baseX;
            lanMa_1.y=tem.y*playArea.intervalY+playArea.baseY;
            lanMa_1.enabled=!Communication.isRedTurn();
            lanMa_1.visible=!Communication.isDead(lanMa_1.index);

            tem= Communication.getPositionByIndex(lanXiang_1.index);
            lanXiang_1.x=tem.x*playArea.intervalX+playArea.baseX;
            lanXiang_1.y=tem.y*playArea.intervalY+playArea.baseY;
            lanXiang_1.enabled=!Communication.isRedTurn();
            lanXiang_1.visible=!Communication.isDead(lanXiang_1.index);

            tem= Communication.getPositionByIndex(lanShi_1.index);
            lanShi_1.x=tem.x*playArea.intervalX+playArea.baseX;
            lanShi_1.y=tem.y*playArea.intervalY+playArea.baseY;
            lanShi_1.enabled=!Communication.isRedTurn();
            lanShi_1.visible=!Communication.isDead(lanShi_1.index);


            tem= Communication.getPositionByIndex(lanJiang.index);
            lanJiang.x=tem.x*playArea.intervalX+playArea.baseX;
            lanJiang.y=tem.y*playArea.intervalY+playArea.baseY;
            lanJiang.enabled=!Communication.isRedTurn();
            lanJiang.visible=!Communication.isDead(lanJiang.index);

            tem= Communication.getPositionByIndex(lanShi_2.index);
            lanShi_2.x=tem.x*playArea.intervalX+playArea.baseX;
            lanShi_2.y=tem.y*playArea.intervalY+playArea.baseY;
            lanShi_2.enabled=Communication.isRedTurn();
            lanShi_2.visible=!Communication.isDead(lanShi_2.index);

            tem= Communication.getPositionByIndex(lanXiang_2.index);
            lanXiang_2.x=tem.x*playArea.intervalX+playArea.baseX;
            lanXiang_2.y=tem.y*playArea.intervalY+playArea.baseY;
            lanXiang_2.enabled=!Communication.isRedTurn();
            lanXiang_2.visible=!Communication.isDead(lanXiang_2.index);


            tem= Communication.getPositionByIndex(lanMa_2.index);
            lanMa_2.x=tem.x*playArea.intervalX+playArea.baseX;
            lanMa_2.y=tem.y*playArea.intervalY+playArea.baseY;
            lanMa_2.enabled=!Communication.isRedTurn();
            lanMa_2.visible=!Communication.isDead(lanMa_2.index);

            tem= Communication.getPositionByIndex(lanChe_2.index);
            lanChe_2.x=tem.x*playArea.intervalX+playArea.baseX;
            lanChe_2.y=tem.y*playArea.intervalY+playArea.baseY;
            lanChe_2.enabled=!Communication.isRedTurn();
            lanChe_2.visible=!Communication.isDead(lanChe_2.index);

            tem= Communication.getPositionByIndex(lanBing_1.index);
            lanBing_1.x=tem.x*playArea.intervalX+playArea.baseX;
            lanBing_1.y=tem.y*playArea.intervalY+playArea.baseY;
            lanBing_1.enabled=!Communication.isRedTurn();
            lanBing_1.visible=!Communication.isDead(lanBing_1.index);


            tem= Communication.getPositionByIndex(lanBing_2.index);
            lanBing_2.x=tem.x*playArea.intervalX+playArea.baseX;
            lanBing_2.y=tem.y*playArea.intervalY+playArea.baseY;
            lanBing_2.enabled=!Communication.isRedTurn();
            lanBing_2.visible=!Communication.isDead(lanBing_2.index);

            tem= Communication.getPositionByIndex(lanBing_3.index);
            lanBing_3.x=tem.x*playArea.intervalX+playArea.baseX;
            lanBing_3.y=tem.y*playArea.intervalY+playArea.baseY;
            lanBing_3.enabled=!Communication.isRedTurn();
            lanBing_3.visible=!Communication.isDead(lanBing_3.index);

            tem= Communication.getPositionByIndex(lanBing_4.index);
            lanBing_4.x=tem.x*playArea.intervalX+playArea.baseX;
            lanBing_4.y=tem.y*playArea.intervalY+playArea.baseY;
            lanBing_4.enabled=!Communication.isRedTurn();
            lanBing_4.visible=!Communication.isDead(lanBing_4.index);

            tem= Communication.getPositionByIndex(lanBing_5.index);
            lanBing_5.x=tem.x*playArea.intervalX+playArea.baseX;
            lanBing_5.y=tem.y*playArea.intervalY+playArea.baseY;
            lanBing_5.enabled=!Communication.isRedTurn();
            lanBing_5.visible=!Communication.isDead(lanBing_5.index);

            tem= Communication.getPositionByIndex(lanPao_1.index);
            lanPao_1.x=tem.x*playArea.intervalX+playArea.baseX;
            lanPao_1.y=tem.y*playArea.intervalY+playArea.baseY;
            lanPao_1.enabled=!Communication.isRedTurn();
            lanPao_1.visible=!Communication.isDead(lanBing_5.index);

            tem= Communication.getPositionByIndex(lanPao_2.index);
            lanPao_2.x=tem.x*playArea.intervalX+playArea.baseX;
            lanPao_2.y=tem.y*playArea.intervalY+playArea.baseY;
            lanPao_2.enabled=!Communication.isRedTurn();
            lanPao_2.visible=!Communication.isDead(lanPao_2.index);







        }

        Image
        {
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

        MouseArea
        {

            anchors.fill: parent
            onClicked:
            {
                Communication.moveChess(playArea.selectedIndex,(mouseX-playArea.baseX)/playArea.intervalX,(mouseY-playArea.baseY)/playArea.intervalY);
                parent.selectedIndex=-1;
                playArea.updateChess();
            }
        }



        Image {
            id: hongChe_1
            enabled: Communication.isRedTurn();
            x: Communication.getPositionByIndex(index).x*playArea.intervalX+playArea.baseX;
            y: Communication.getPositionByIndex(index).y*playArea.intervalX+playArea.baseY;
            width: parent.width/9
            height: parent.height/10
            source:"qrc:/source/chessImage/redChess/che.png"
            property int index: 0;
            MouseArea {
                anchors.fill: parent
                onClicked:
                {
                    playArea.selectedIndex=parent.index;

                }
            }
        }
        Image {
            id: hongMa_1
            enabled: Communication.isRedTurn();
            x: Communication.getPositionByIndex(index).x*playArea.intervalX+playArea.baseX;
            y: Communication.getPositionByIndex(index).y*playArea.intervalX+playArea.baseY;
            width: parent.width/9
            height: parent.height/10
            source:"qrc:/source/chessImage/redChess/ma.png"
            property int index: 1;
            MouseArea {
                anchors.fill: parent
                onClicked:
                {
                    playArea.selectedIndex=parent.index;

                }
            }
        }
        Image {
            id: hongXiang_1
            enabled: Communication.isRedTurn();
            x: Communication.getPositionByIndex(index).x*playArea.intervalX+playArea.baseX;
            y: Communication.getPositionByIndex(index).y*playArea.intervalX+playArea.baseY;
            width: parent.width/9
            height: parent.height/10
            source:"qrc:/source/chessImage/redChess/xiang.png"
            property int index: 2;
            MouseArea {
                anchors.fill: parent
                onClicked:
                {
                    playArea.selectedIndex=parent.index;

                }
            }
        }
        Image {
            id: hongShi_1
            enabled: Communication.isRedTurn();
            x: Communication.getPositionByIndex(index).x*playArea.intervalX+playArea.baseX;
            y: Communication.getPositionByIndex(index).y*playArea.intervalX+playArea.baseY;
            width: parent.width/9
            height: parent.height/10
            source:"qrc:/source/chessImage/redChess/shi.png"
            property int index: 3;
            MouseArea {
                anchors.fill: parent
                onClicked:
                {
                    playArea.selectedIndex=parent.index;

                }
            }
        }
        Image {
            id: hongJiang
            enabled: Communication.isRedTurn();
            x: Communication.getPositionByIndex(index).x*playArea.intervalX+playArea.baseX;
            y: Communication.getPositionByIndex(index).y*playArea.intervalX+playArea.baseY;
            width: parent.width/9
            height: parent.height/10
            source:"qrc:/source/chessImage/redChess/jiang.png"
            property int index: 4;
            MouseArea {
                anchors.fill: parent
                onClicked:
                {
                    playArea.selectedIndex=parent.index;

                }
            }
        }
        Image {
            id: hongShi_2
            enabled: Communication.isRedTurn();
            x: Communication.getPositionByIndex(index).x*playArea.intervalX+playArea.baseX;
            y: Communication.getPositionByIndex(index).y*playArea.intervalX+playArea.baseY;
            width: parent.width/9
            height: parent.height/10
            source:"qrc:/source/chessImage/redChess/shi.png"
            property int index: 5;
            MouseArea {
                anchors.fill: parent
                onClicked:
                {
                    playArea.selectedIndex=parent.index;

                }
            }
        }
        Image {
            id: hongXiang_2
            enabled: Communication.isRedTurn();
            x: Communication.getPositionByIndex(index).x*playArea.intervalX+playArea.baseX;
            y: Communication.getPositionByIndex(index).y*playArea.intervalX+playArea.baseY;
            width: parent.width/9
            height: parent.height/10
            source:"qrc:/source/chessImage/redChess/xiang.png"
            property int index: 6;
            MouseArea {
                anchors.fill: parent
                onClicked:
                {
                    playArea.selectedIndex=parent.index;

                }
            }
        }
        Image {
            id: hongMa_2
            enabled: Communication.isRedTurn();
            x: Communication.getPositionByIndex(index).x*playArea.intervalX+playArea.baseX;
            y: Communication.getPositionByIndex(index).y*playArea.intervalX+playArea.baseY;
            width: parent.width/9
            height: parent.height/10
            source:"qrc:/source/chessImage/redChess/ma.png"
            property int index: 7;
            MouseArea {
                anchors.fill: parent
                onClicked:
                {
                    playArea.selectedIndex=parent.index;

                }
            }
        }
        Image {
            id: hongChe_2
            enabled: Communication.isRedTurn();
            x: Communication.getPositionByIndex(index).x*playArea.intervalX+playArea.baseX;
            y: Communication.getPositionByIndex(index).y*playArea.intervalX+playArea.baseY;
            width: parent.width/9
            height: parent.height/10
            source:"qrc:/source/chessImage/redChess/che.png"
            property int index: 8;
            MouseArea {
                anchors.fill: parent
                onClicked:
                {
                    playArea.selectedIndex=parent.index;

                }
            }
        }
        Image {
            id: hongBing_1
            enabled: Communication.isRedTurn();
            x: Communication.getPositionByIndex(index).x*playArea.intervalX+playArea.baseX;
            y: Communication.getPositionByIndex(index).y*playArea.intervalX+playArea.baseY;
            width: parent.width/9
            height: parent.height/10
            source:"qrc:/source/chessImage/redChess/bing.png"
            property int index: 9;
            MouseArea {
                anchors.fill: parent
                onClicked:
                {
                    playArea.selectedIndex=parent.index;

                }
            }
        }
        Image {
            id: hongBing_2
            enabled: Communication.isRedTurn();
            x: Communication.getPositionByIndex(index).x*playArea.intervalX+playArea.baseX;
            y: Communication.getPositionByIndex(index).y*playArea.intervalX+playArea.baseY;
            width: parent.width/9
            height: parent.height/10
            source:"qrc:/source/chessImage/redChess/bing.png"
            property int index: 10;
            MouseArea {
                anchors.fill: parent
                onClicked:
                {
                    playArea.selectedIndex=parent.index;

                }
            }
        }
        Image {
            id: hongBing_3
            enabled: Communication.isRedTurn();
            x: Communication.getPositionByIndex(index).x*playArea.intervalX+playArea.baseX;
            y: Communication.getPositionByIndex(index).y*playArea.intervalX+playArea.baseY;
            width: parent.width/9
            height: parent.height/10
            source:"qrc:/source/chessImage/redChess/bing.png"
            property int index: 11;
            MouseArea {
                anchors.fill: parent
                onClicked:
                {
                    playArea.selectedIndex=parent.index;

                }
            }
        }
        Image {
            id: hongBing_4
            enabled: Communication.isRedTurn();
            x: Communication.getPositionByIndex(index).x*playArea.intervalX+playArea.baseX;
            y: Communication.getPositionByIndex(index).y*playArea.intervalX+playArea.baseY;
            width: parent.width/9
            height: parent.height/10
            source:"qrc:/source/chessImage/redChess/bing.png"
            property int index: 12;
            MouseArea {
                anchors.fill: parent
                onClicked:
                {
                    playArea.selectedIndex=parent.index;

                }
            }
        }
        Image {
            id: hongBing_5
            enabled: Communication.isRedTurn();
            x: Communication.getPositionByIndex(index).x*playArea.intervalX+playArea.baseX;
            y: Communication.getPositionByIndex(index).y*playArea.intervalX+playArea.baseY;
            width: parent.width/9
            height: parent.height/10
            source:"qrc:/source/chessImage/redChess/bing.png"
            property int index: 13;
            MouseArea {
                anchors.fill: parent
                onClicked:
                {
                    playArea.selectedIndex=parent.index;

                }
            }
        }
        Image {
            id: hongPao_1
            enabled: Communication.isRedTurn();
            x: Communication.getPositionByIndex(index).x*playArea.intervalX+playArea.baseX;
            y: Communication.getPositionByIndex(index).y*playArea.intervalX+playArea.baseY;
            width: parent.width/9
            height: parent.height/10
            source:"qrc:/source/chessImage/redChess/pao.png"
            property int index: 14;
            MouseArea {
                anchors.fill: parent
                onClicked:
                {
                    playArea.selectedIndex=parent.index;
                }
            }
        }
        Image {
            id: hongPao_2
            enabled: Communication.isRedTurn();
            x: Communication.getPositionByIndex(index).x*playArea.intervalX+Communication.getPositionByIndex(index).x;
            y: Communication.getPositionByIndex(index).y*playArea.intervalX+playArea.baseY;
            width: parent.width/9
            height: parent.height/10
            source:"qrc:/source/chessImage/redChess/pao.png"
            property int index: 15;
            MouseArea {
                anchors.fill: parent
                onClicked:
                {
                    playArea.selectedIndex=parent.index;
                }
            }
        }
        // blue
        Image {
            id: lanChe_1
            enabled: !Communication.isRedTurn();
            x: Communication.getPositionByIndex(index).x*playArea.intervalX+playArea.baseX;
            y: Communication.getPositionByIndex(index).y*playArea.intervalX+playArea.baseY;
            width: parent.width/9
            height: parent.height/10
            source:"qrc:/source/chessImage/blueChess/che.png"
            property int index: 16;
            MouseArea {
                anchors.fill: parent
                onClicked:
                {
                    playArea.selectedIndex=parent.index;

                }
            }
        }
        Image {
            id: lanMa_1
            enabled: !Communication.isRedTurn();
            x: Communication.getPositionByIndex(index).x*playArea.intervalX+playArea.baseX;
            y: Communication.getPositionByIndex(index).y*playArea.intervalX+playArea.baseY;
            width: parent.width/9
            height: parent.height/10
            source:"qrc:/source/chessImage/blueChess/ma.png"
            property int index: 17;
            MouseArea {
                anchors.fill: parent
                onClicked:
                {
                    playArea.selectedIndex=parent.index;

                }
            }
        }
        Image {
            id: lanXiang_1
            enabled: !Communication.isRedTurn();
            x: Communication.getPositionByIndex(index).x*playArea.intervalX+playArea.baseX;
            y: Communication.getPositionByIndex(index).y*playArea.intervalX+playArea.baseY;
            width: parent.width/9
            height: parent.height/10
            source:"qrc:/source/chessImage/blueChess/xiang.png"
            property int index: 18;
            MouseArea {
                anchors.fill: parent
                onClicked:
                {
                    playArea.selectedIndex=parent.index;

                }
            }
        }
        Image {
            id: lanShi_1
            enabled: !Communication.isRedTurn();
            x: Communication.getPositionByIndex(index).x*playArea.intervalX+playArea.baseX;
            y: Communication.getPositionByIndex(index).y*playArea.intervalX+playArea.baseY;
            width: parent.width/9
            height: parent.height/10
            source:"qrc:/source/chessImage/blueChess/shi.png"
            property int index: 19;
            MouseArea {
                anchors.fill: parent
                onClicked:
                {
                    playArea.selectedIndex=parent.index;

                }
            }
        }
        Image {
            id: lanJiang
            enabled: !Communication.isRedTurn();
            x: Communication.getPositionByIndex(index).x*playArea.intervalX+playArea.baseX;
            y: Communication.getPositionByIndex(index).y*playArea.intervalX+playArea.baseY;
            width: parent.width/9
            height: parent.height/10
            source:"qrc:/source/chessImage/blueChess/jiang.png"
            property int index: 20;
            MouseArea {
                anchors.fill: parent
                onClicked:
                {
                    playArea.selectedIndex=parent.index;

                }
            }
        }
        Image {
            id: lanShi_2
            enabled: !Communication.isRedTurn();
            x: Communication.getPositionByIndex(index).x*playArea.intervalX+playArea.baseX;
            y: Communication.getPositionByIndex(index).y*playArea.intervalX+playArea.baseY;
            width: parent.width/9
            height: parent.height/10
            source:"qrc:/source/chessImage/blueChess/shi.png"
            property int index: 21;
            MouseArea {
                anchors.fill: parent
                onClicked:
                {
                    playArea.selectedIndex=parent.index;

                }
            }
        }
        Image {
            id: lanXiang_2
            enabled: !Communication.isRedTurn();
            x: Communication.getPositionByIndex(index).x*playArea.intervalX+playArea.baseX;
            y: Communication.getPositionByIndex(index).y*playArea.intervalX+playArea.baseY;
            width: parent.width/9
            height: parent.height/10
            source:"qrc:/source/chessImage/blueChess/xiang.png"
            property int index: 22;
            MouseArea {
                anchors.fill: parent
                onClicked:
                {
                    playArea.selectedIndex=parent.index;

                }
            }
        }
        Image {
            id: lanMa_2
            enabled: !Communication.isRedTurn();
            x: Communication.getPositionByIndex(index).x*playArea.intervalX+playArea.baseX;
            y: Communication.getPositionByIndex(index).y*playArea.intervalX+playArea.baseY;
            width: parent.width/9
            height: parent.height/10
            source:"qrc:/source/chessImage/blueChess/ma.png"
            property int index: 23;
            MouseArea {
                anchors.fill: parent
                onClicked:
                {
                    playArea.selectedIndex=parent.index;

                }
            }
        }
        Image {
            id: lanChe_2
            enabled: !Communication.isRedTurn();
            x: Communication.getPositionByIndex(index).x*playArea.intervalX+playArea.baseX;
            y: Communication.getPositionByIndex(index).y*playArea.intervalX+playArea.baseY;
            width: parent.width/9
            height: parent.height/10
            source:"qrc:/source/chessImage/blueChess/che.png"
            property int index: 24;
            MouseArea {
                anchors.fill: parent
                onClicked:
                {
                    playArea.selectedIndex=parent.index;

                }
            }
        }
        Image {
            id: lanBing_1
            enabled: !Communication.isRedTurn();
            x: Communication.getPositionByIndex(index).x*playArea.intervalX+playArea.baseX;
            y: Communication.getPositionByIndex(index).y*playArea.intervalX+playArea.baseY;
            width: parent.width/9
            height: parent.height/10
            source:"qrc:/source/chessImage/blueChess/bing.png"
            property int index: 25;
            MouseArea {
                anchors.fill: parent
                onClicked:
                {
                    playArea.selectedIndex=parent.index;

                }
            }
        }
        Image {
            id: lanBing_2
            enabled: !Communication.isRedTurn();
            x: Communication.getPositionByIndex(index).x*playArea.intervalX+playArea.baseX;
            y: Communication.getPositionByIndex(index).y*playArea.intervalX+playArea.baseY;
            width: parent.width/9
            height: parent.height/10
            source:"qrc:/source/chessImage/blueChess/bing.png"
            property int index: 26;
            MouseArea {
                anchors.fill: parent
                onClicked:
                {
                    playArea.selectedIndex=parent.index;

                }
            }
        }
        Image {
            id: lanBing_3
            enabled: !Communication.isRedTurn();
            x: Communication.getPositionByIndex(index).x*playArea.intervalX+playArea.baseX;
            y: Communication.getPositionByIndex(index).y*playArea.intervalX+playArea.baseY;
            width: parent.width/9
            height: parent.height/10
            source:"qrc:/source/chessImage/blueChess/bing.png"
            property int index: 27;
            MouseArea {
                anchors.fill: parent
                onClicked:
                {
                    playArea.selectedIndex=parent.index;

                }
            }
        }
        Image {
            id: lanBing_4
            enabled: !Communication.isRedTurn();
            x: Communication.getPositionByIndex(index).x*playArea.intervalX+playArea.baseX;
            y: Communication.getPositionByIndex(index).y*playArea.intervalX+playArea.baseY;
            width: parent.width/9
            height: parent.height/10
            source:"qrc:/source/chessImage/blueChess/bing.png"
            property int index: 28;
            MouseArea {
                anchors.fill: parent
                onClicked:
                {
                    playArea.selectedIndex=parent.index;

                }
            }
        }
        Image {
            id: lanBing_5
            enabled: !Communication.isRedTurn();
            x: Communication.getPositionByIndex(index).x*playArea.intervalX+playArea.baseX;
            y: Communication.getPositionByIndex(index).y*playArea.intervalX+playArea.baseY;
            width: parent.width/9
            height: parent.height/10
            source:"qrc:/source/chessImage/blueChess/bing.png"
            property int index: 29;
            MouseArea {
                anchors.fill: parent
                onClicked:
                {
                    playArea.selectedIndex=parent.index;

                }
            }
        }
        Image {
            id: lanPao_1
            enabled: !Communication.isRedTurn();
            x: Communication.getPositionByIndex(index).x*playArea.intervalX+playArea.baseX;
            y: Communication.getPositionByIndex(index).y*playArea.intervalX+playArea.baseY;
            width: parent.width/9
            height: parent.height/10
            source:"qrc:/source/chessImage/blueChess/pao.png"
            property int index: 30;
            MouseArea {
                anchors.fill: parent
                onClicked:
                {
                    playArea.selectedIndex=parent.index;
                }
            }
        }
        Image {
            id: lanPao_2
            enabled: !Communication.isRedTurn();
            x: Communication.getPositionByIndex(index).x*playArea.intervalX+Communication.getPositionByIndex(index).x;
            y: Communication.getPositionByIndex(index).y*playArea.intervalX+playArea.baseY;
            width: parent.width/9
            height: parent.height/10
            source:"qrc:/source/chessImage/blueChess/pao.png"
            property int index: 31;
            MouseArea {

                anchors.fill: parent
                onClicked:
                {
                    playArea.selectedIndex=parent.index;
                }
            }
        }


    }
    Item {
        id: sideArea
        objectName: "sideArea"
        width: parent.width-playArea.width
        height: parent.height
        x:playArea.width
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
                id:chatArea
                objectName: "chatArea"
                Layout.preferredHeight: parent.height/3
                Layout.alignment: Qt.AlignHCenter
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
                            Communication.regret();
                            playArea.updateChess();
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
                    id:sendText

                    onAccepted:
                    {
                        sendButton.clicked();
                    }
                }
                Button
                {
                    id:sendButton
                    text:qsTr("发送")
                    onClicked:
                    {
                        chatArea.text+=sendText.text+'\n';
                    }
                }
            }
        }
    }

    Popup{
        id:messagePop
        objectName: "messagePop"

    }
}

