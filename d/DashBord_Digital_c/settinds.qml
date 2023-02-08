import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5
import QtQuick.Controls
//import QtMultimediaKit
//import QtMultimedia
//import Qt6.2


Window {
    id: window
    visible: true
    color: "#000000"
    visibility: Window.FullScreen
    property alias windowColor: window.color
    property string r: "Infinite"

    property int blutoothflag:0
    width: 640
    height: 480
    title: qsTr("settings")




    Rectangle{
        id:setrec

        width: 640
        height: 480
        border.width: 1
        color:"black"

        
        Row{
            y: 0
            width: 640
            height: 480/2

            
            Column {
                id: column1
                width: 640/2
                height: 480
                spacing: 5

                Rectangle{
                    x:0
                    width: 640/4
                    height: 480/4-5

                    Image {
                        id: blutoot
                        width: 640/4
                        height: 480/4-5
                        source:{
                            if(blutoothflag==0)
                                return "settingsimg/blutooth.png"
                            else
                                "settingsimg/blutoothON.png"
                        }
                    }

                    MouseArea{
                        id:moseblutooth
                        width: 640/4
                        height: 480/4-5
                        onClicked: {

                            (blutoothflag==0)?blutoothflag=1:blutoothflag=0

                            if(blutoothflag==1)
                            {
                                blutooth.open()
                            }
                            console.log("blutooth")

                        }

                    }
                }

                Rectangle{
                    x:0
                    width: 640/4
                    height: 480/4-5

                    Image {
                        id: calls
                        width: 640/4
                        height: 480/4-5
                        source: "settingsimg/call.png"
                    }

                    MouseArea{
                        id:mousecall
                        width: 640/4
                        height: 480/4-5
                        onClicked: {
                            console.log("call")

                        }

                    }
                }

                Rectangle{
                    x:0
                    width: 640/4
                    height: 480/4-5

                    Image {
                        id: fan
                        width: 640/4
                        height: 480/4-5
                        source: "settingsimg/fan.png"
                    }

                    MouseArea{
                        id:mosefan
                        width: 640/4
                        height: 480/4-5
                        onClicked: {
                            console.log("fan")

                        }

                    }


                    RotationAnimation on rotation{
                        from: 0
                        to:360
                        duration: 100
                        loops: Animation.Infinite
                    }

                }

                Rectangle{
                    id: rectangle

                    width: 640/4
                    height: 480/4-5

                    Image {
                        id: loack
                        width: 640/4
                        height: 480/4-5
                        source: "settingsimg/loack.png"

                    }

                    MouseArea{
                        id:moseloack
                        width: 640/4
                        height: 480/4-5
                        onClicked: {
                            console.log("loack")

                        }

                    }
                }



            }





            Column{
                id:colunm2
                width: 640/2
                height: 480
                spacing: 5
                Rectangle{
                    id: recmusic
                    x:0
                    y: 0
                    width: 640/4
                    height: 480/4-5

                    Image {
                        id: music
                        width: 640/4
                        height: 480/4-5
                        source: "settingsimg/music.png"

                    }
                    //                 SoundEffect{
                    //                 id:soundso
                    //                 source:"settingsimg/horn_audio.wav"
                    //                 }

                    //                 Audio {
                    //                     id: audio1
                    //                     source: "settingsimg/horn_audio.mp3"
                    //                   //  autoPlay: true
                    //                   //  loops: Audio.Infinite
                    //                 }

                    MouseArea{
                        id:mousemusic
                        width: 640/4
                        height: 480/4-5
                        onClicked:   {
                            // soundso.play()
                            console.log("music")


                        }

                    }
                }


                Rectangle{
                    width: 640/4
                    height: 480/4-5

                    Image {
                        id: radio
                        width: 640/4
                        height: 480/4-5
                        source: "settingsimg/radio.png"

                    }

                    MouseArea{
                        id:mouseradio
                        width: 640/4
                        height: 480/4-5
                        onClicked: {
                            console.log("radio")

                        }

                    }
                }

                Rectangle{

                    width: 640/4
                    height: 480/4-5

                    Image {
                        id: vlcmedia
                        width: 640/4
                        height: 480/4-5
                        source: "settingsimg/vlcmedia.png"

                    }

                    MouseArea{
                        id:mosevlc
                        width: 640/4
                        height: 480/4-5
                        onClicked: {
                            console.log("vlc")

                        }

                    }
                }


                Rectangle{
                    width: 640/4
                    height: 480/4-5

                    Image {
                        id: wifi
                        width: 640/4
                        height: 480/4-5
                        source: "settingsimg/wifi-.png"

                    }

                    MouseArea{
                        id:mosewifi
                        width: 640/4
                        height: 480/4-5
                        onClicked: {
                            console.log("wifi")

                        }

                    }
                }

            }





        }



        Popup{
            id:blutooth

            x:100
            y:100
            height:640/4
            width: 480/2

            background: Rectangle{color: "silver"}

            Label{
                id:blutoothlabel
                width: 100
                height: 30
                text: "Blutooth Searching...."
                font.pixelSize: 15
                color: "blue"
                Button{
                    x: 100
                    y:100
                    width: 60
                    height: 40
                    text:"OK"
                    background: Rectangle {
                        color: parent.pressed ? "red" : "green"
                    }

                    onClicked: {


                        blutooth.close()

                    }
                }

            }

        }

        Rectangle {
            id: rectangle1
            x: 159
            y: 0
            width: 158
            height: 480
            opacity: 0.89
            color: "#413f3f"
            border.color: "#bfb8b2"
            border.width: 5
            z: 3
            layer.effect: fan


//            Text {
//                id: formusic
//                y:200
//                x:5
//                text: qsTr("Cliked me")
//                width:50
//                height: 30
//                Audio{
//                    id:playmusic
//                    autoLoad: false
//                    source: "settingsimg/horn_audio.wav"

//                }

//                MouseArea{
//                id:playArea
//                anchors.fill: parent
//                onPressed: {
//                playmusic.play()
//                }
//                }
//            }


        }



    }

    Rectangle {
        id: rectangle2
        x: 483
        y: 0
        width: 157
        height: 480
        color: "#413f3f"
        border.color: "#bfb8b2"
        border.width: 5
        layer.effect: mosefan
        layer.format: ShaderEffectSource.RGB

    }






}


