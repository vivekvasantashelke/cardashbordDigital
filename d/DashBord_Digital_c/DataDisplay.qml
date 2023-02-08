import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5
import QtQuick.Controls
import QtQuick.Controls 2.4
Item {
    id: item1
    x:20
    y:0
    width: 640
    height: 536
    visible: true

    property int needleAngle:-50
    property int smallneedle:-50
    property int speeddisp
    property int petrol:250
    property int digitalDAta
    property int totatalEntime:testData. accessDatafromDBs()

    property int minut:testData. accessDatafromDBm()
    property int hours:testData. accessDatafromDBh()


    property int tempchecking:22
    property int parkingpropety
    property int f
    property int ri
    property int i:0
    property int s:0
    property int li
    property int j:0
    property string petroldigit:"1"
    property int sitf:0
    property variant window

    property int kms:testData.km()
      property int tet:testData.accessDatafromDB()

 property string n
    property string bg:"blue"
   property string nd:"green"
   property string b:"red"
    Connections{
    target: testData
    onTotaltimeenginsignals:{
   // console.log(tet)
    }


    }





    Connections{
        target:mainAccess
         onLtLeftINdicatorsignal:{
       //console.log(leftind)
        li=leftind
          }
      }


    Connections{
     target:mainAccess
   onLetRightIndicatorsignal:{
    // console.log(rightind)
       ri=rightind
    }
    }
    Connections{
    target:mainAccess
    onIndicatorsignal:{
 // console.log(ind)
        f=ind
      //  ri=ind
    }
    }

    Connections{
    target: mainAccess
    onParkingsignal:{
       // console.log(park)
        parkingpropety=park
    }
    }
    Connections{
    target: mainAccess
    onEmptypetrolatank:{
    //needleAngle=emptytankthen
      //  console.log(emptytankthen)
    }
    }


    Connections{
    target:mainAccess
    onTotalEnginTime:{
     // console.log(enginTime)

        kms++
        totatalEntime=enginTime
        if(totatalEntime==60)
        {
            ++minut
            ++tempchecking
            if(minut==60)
            {
                ++hours
                if(hours==12)
                {
                    hours=0
                }
                minut=0
            }
        }

      }
    }

    Connections{

        target: mainAccess
            onPetrolSend:
            {

                petrol=Data3
                if(petrol<=185)
                    petroldigit="1/5"
                 if(petrol<=112)
                    petroldigit="0"
             //    console.log(petrol)
            }
    }


    Connections{
        target: mainAccess
            onSend:
            {
              //  console.log(data)
                  smallneedle=data
                //speeddisp=data


            }
}

    Connections{
        target: mainAccess
            onRpm:
            {//
                 //   console.log("send rpm")
               // console.log(data2)
                needleAngle=data2
            }
}


    Connections{
    target: mainAccess
    onSpeedDigitalmeter:
    {
  //  console.log(DigitalData)
        if(petrol>=110)
    digitalDAta=DigitalData
        else
            digitalDAta--
    }

    }
    Rectangle{
        id:id_speedArea
        x:20
        y: 0
        width: 606
        height: 536
        gradient: Gradient {
            GradientStop { position: 0.1; color: bg }
            GradientStop { position: 0.2; color: nd }
            GradientStop { position: 0.5; color: "black" }
        }

        Image {
            id: id_speedmeter
            x:0
            y:45
            width: 300
            height: 300
            source: "speedimg.png"
        }

           Rectangle{
            id:speeds
            x:100
            y:140
            width: 100
            height: 100
            border.width: 5
            border.color: b
            radius: 50

            Text {

               id: id_speed
                // anchors.fill: parent
                font.bold: true
                font.pixelSize:  40
                text:digitalDAta //digitalDAta+steringDigital+50


                anchors.centerIn: parent
            }


            Image {
                id: id_smallneedle
                x:-50
                y:47
                width: 55
                height: 5
                 source: "needlesmall.jpg"

                transform: Rotation{origin.x:100;origin.y:1.1;
                 angle: Math.min(Math.max(smallneedle,-50),235)
//                Behavior on angle {
//                SpringAnimation{spring: 2;damping: 0.2;mass: 3;}
//                 }
            }


}




            gradient: Gradient {
                GradientStop { position: 0.1; color: testData.needlecolor() }
                GradientStop { position: 0.5; color: "green" }
                GradientStop { position: 1.0; color: "blue" }
            }

        }




        Image {
            id: id_rpsimg
            x:300
            y:45
            width: 300
            height: 300
            source: "rpmImage.png"
        }


        Image {
            id: id_needle
            x:342
            y:193
            width: 130
            height: 5
            source: "needleimg.jpg"
            rotation: 0
            transform: Rotation{origin.x:100;origin.y:1;
                angle: Math.min(Math.max(needleAngle),235)
//                                 Behavior on angle {
//                                 SpringAnimation{spring: 2;damping: 0.2;mass: 3;}
//                                  }

            }

        }

        Label {
            id: totaletime
            x: 280
            y: 8
            width: 97
            height: 31
            color: "yellow"
            text:   "TET:"+ hours+":"+ minut+":"+totatalEntime
            font.pixelSize: 20
        }

        Image {
            id: tempsymbol
            x: 17
            y: 14
            width: 55
            height: 20
            source:
                {
                if(tempchecking<=24)
                {
                    return "tempsymbol.png"
                }
            else if(tempchecking<=26)
                {
                    return "cooltempsymbol.png"
                }
            else
                    return "temphotsymbol.png"
            }
        }


        Label {
            id: label_temp
            x: 67
            y: 8
            width: 0
            height: 31
            color: "white"
            text: "Temp:"+tempchecking+" °F"
            font.pixelSize: 20

        }
        Image {
            id: timeimg
            x:479
            y:8
            width: 37
            height: 26
            source: "timesymbol.png"
        }

        Label {
            id: label_time
            x: 509
            y: 8
            width: 78
            height: 26
            color: "red"
            text: qsTr(" ")
            font.pixelSize: 20
           // font.verticalAlignment:5

        }
        Timer{
        interval: 200
        running: true
        repeat: true
        onTriggered: {
        var date=new Date()
         label_time.text=date.toLocaleTimeString(Qt.locale("en_US"),"hh:mm: ap")

        }
        }

    }
    Rectangle{
    id:carandpetorle
    x: 0
    y: 0
    width: 0
    height: 0
    Image {
        id:petrolemeter
        x:191
        y:376

        width: 261
        height: 137
        source: "petrolmeter.png"
    }



    Image {
        id:needlepetrol
       x:314
       y:501
        width: 5
        height: 100
        source: "petorl_needle.jpg"
        transform: Rotation{
            angle: Math.min(Math.max(petrol,110))
            //            Behavior on angle {
            //            SpringAnimation{spring: 2;damping: 0.2;mass: 3;}
            //             }

        }






    }


    Image {
        id: car
        x:220
        y:484
        width: 33
        height: 30
        source:{
         if(petrol>=130)
            return "carimageBlack.png"
            else
             return "carimage.png"
        }

        SequentialAnimation{
        loops: Animation.Infinite
        running: true
        OpacityAnimator{
        target: car
        from: 0
        to:1
        duration: 1000
        }

        }
    }


    Rectangle{
    x:307
    y:430
    width: 30
    height: 30
    color: "yellow"
    Text {
        id: petrolDIGIT
        //width: 30
       // height: 30
        text:petroldigit
        font.pixelSize:  20
        anchors.centerIn: parent
    }
    gradient: Gradient {
          GradientStop { position: 0.0; color: "red" }
          GradientStop { position: 0.33; color: "yellow" }
          GradientStop { position: 1.0; color: "green" }
      }
    }

    Image {
        id: petrol_100
        x:265
        y:484
        width: 29
        height: 29
         source:{

                if(petrol>=220)
                 return "100fuel.png"
                else if(petrol>=192)
                return "90fuel.png"
                else if(petrol>=160)
                return "70fuel.png"
                else if(petrol>=130)
                return "50fuel.png"
                else if(petrol>110)
                return "10fule.png"
                else "empty.png"
                }

         SequentialAnimation{
         loops: Animation.Infinite
         running: true
         OpacityAnimator{
         target: petrol_100
         from: 0
         to:1
         duration: 1000
         }

         }


    }

Rectangle
{
    id:rrectangle
    x:540
    y:376
    width: 60
    height: 64
    radius: width
    color: "blue"
    Image {
        id: rightindicator
        anchors.fill: parent
        width: 54
        height: 44
        source:{

        if(ri%2==0)
            return "rigtIndicator.png"
        else
            return "rightindicator_yellowcolor.png"
        }
      }


    MouseArea {
        anchors.fill: parent
        onClicked: {
            if(i==0){
            mainAccess.letstartRightindicator()
                i=1;
        }
            else
            {
                mainAccess.letstoprigtindicator()
                i=0;
            }

        }
    }

}

Rectangle{
id:leftrec
width: 60
height: 64
x:40
y:376
radius: width
color: "blue"

    Image {
        id: leftIndicator
        anchors.fill: parent
        width: 54
        height: 44
        x:18
        y:376
        source:{
          if(li%2==0)
           return "leftindicator.png"
          else
              return  "leftindicatorredcolor.png"
    }
    }


    MouseArea {
        anchors.fill: parent
        onClicked: {
            if(j==0){
            mainAccess.letstratLeftindicator()
                j=1;
        }
            else
            {
                mainAccess.letStopLeftindicator()
                j=0;
            }

        }
    }


}

Rectangle{
    id: lightrec
    width: 54
    height: 44
    x:40
    y:457
    radius: width
    color: "red"

    Image {
        id: name
        x: 0
        y: 0
        width: 54
        height: 44
        source: "lightimg.png"
    }


MouseArea{
id:lightmouse
width: 54
height: 44
x:18
y:457
anchors.fill: parent
anchors.rightMargin: -5
acceptedButtons: Qt.RightButton | Qt.LeftButton
onClicked: {
if(mouse.button===Qt.RightButton)parent.color="red"

if(mouse.button===Qt.LeftButton)parent.color="orange"

}
}

}

Rectangle
{
    id:parkingrec
    x:540
    y:447
    width: 60
    height: 64
    radius: width
    color: "red"
    Image {
        id: parkingimg
        x: 0
        y: 0
        width: 60
        height: 64
        source:
        {

      if(f%2==0)
             return "parking.png"
      else
          return "parking_orange.png"
}
    }



    MouseArea {
        anchors.fill: parent
        onClicked: {
            if(s==0){
            mainAccess.starttimer()
                 mainAccess.letstartRightindicator()
                 mainAccess.letstratLeftindicator()
                s=1;i=1;j=1;
        }
            else
            {
                mainAccess.setpar()
                 mainAccess.letStopLeftindicator()
                 mainAccess.letstoprigtindicator()
                s=0;i=0;j=0;
            }

        }
    }

}

Rectangle{
    id:absrec
    x:576
    y:309
    width: 35
    height: 32
    radius: width
Image {
    id: abs
  //  x:263
   // y:54
    width: 35
    height: 32
    source: "absCar.png"
}

MouseArea{
 anchors.fill: parent
onClicked: {
    if(sitf==1)
    {
    mainAccess.absstoppedcar()
    mainAccess.letstartRightindicator()
    mainAccess.letstratLeftindicator()
   // mainAccess.notifyPetrol()
    }
    else
        absbraek.open()
}

}
}


Image {
    id: battery
    x:109
    y:457
    width: 44
    height: 44
    source: "batery.png"
}

Image {
    id: sitbeltimg
    x:482
    y:457
    width: 52
    height: 48
    source: "seatbelt.png"
    MouseArea{
    anchors.fill: parent
    onClicked: {
        sitf=1
       sitbeltimg.source="sitbeltwear.png"

    }

    }
}

Popup{
id:absbraek
x:250
y:300
height: 100
width: 200

background: Rectangle{color: "silver"}

Label{
id:labelAbs
width: 100
height: 30
text: "Wear Seat Blet"
font.pixelSize: 15
color: "blue"
Button{
    x: 50
    y:40
    width: 60
    height: 40
    text:"CLose"
    background: Rectangle {
        color: parent.pressed ? "red" : "green"
}

onClicked: {absbraek.close()}
}
}
}




Rectangle{
    id:priperec
    x:360
    y:492
    width: 35
    height: 32
    color: "black"
Image {
    id: petolpip
    width: 35
    height: 32
    source:{
        if(petrol==110)
       return "petrolpipe.png"
        else
            return "petrolpipeBlack.png"

    }
}

MouseArea{
 anchors.fill: parent
onClicked: {

        fillPetrol.open()
    mainAccess.fillpetroll()
}

}
}





Popup{
id:fillPetrol

x:250
y:300
height: 100
width: 150

background: Rectangle{color: "silver"}

Label{
id:labelfillpetrol
width: 100
height: 30
text: "Fill Petrol Clik on OK"
font.pixelSize: 15
color: "blue"
Button{
    x: 50
    y:40
    width: 60
    height: 40
    text:"OK"
    background: Rectangle {
        color: parent.pressed ? "red" : "green"
}

onClicked: {
    fillPetrol.close()
    mainAccess.mainclikedbuttonTIMERSSTARTING()
    petrol=110
    petroldigit="1"

}
}

}

}

Button {
    id: button
    x:285
    y:39
    width: 86
    height: 25
    visible: true
    //  color:"lightblue"
    text: "String"
    font.letterSpacing: 1.2
    rotation: 0
    scale: 1
    clip: false
    font.kerning: true
    font.hintingPreference: Font.PreferDefaultHinting
    font.styleName: "Semibold Italic"
    font.weight: Font.DemiBold
    font.underline: true
    font.italic: true
    font.bold: true
    icon.color: "#fd828282"
    display: AbstractButton.TextBesideIcon
    flat: true

    onClicked: {
        var component = Qt.createComponent("StringWindow.qml")
         window  = component.createObject()
        window.show()
    }

}


    }


    Rectangle{
        id:background
        x:584
        y:50
        width: 30
        height: 27
        radius: width
         color: "steelblue"

    Image {
        id: calender
        width: 30
        height: 27
        source: "settingSymbol.png"
       }
        MouseArea{
        anchors.fill: parent
        onClicked: {
            background.color = Qt.colorEqual(background.color, "steelblue") ? "purple" : "steel blue"

            var componentcal = Qt.createComponent("settinds.qml")
             window  = componentcal.createObject()
            window.show()

       // console.log("cal")
        }
        }


     }


    Button{
        id: button1
    x:300
    y:282
    width: 40
    height: 40
    icon.color: "#ebf9b7"
   // icon.color: "#e5b69fbf"
    display: AbstractButton.TextBesideIcon
    flat: true


    Text {
        id: stopbuttontext
        color: "red"
        text: qsTr("Stop")
        anchors.fill: parent
        font.pointSize: 14


    }

    onClicked: {

   testData.stopButton(totatalEntime,minut,hours,kms)
mainAccess.absstoppedcar()
        var component = Qt.createComponent("main.qml")
         window  = component.createObject()
        window.show()
    }
  }




    Label{
        id:kmlabel
        x: 287
        y: 337
        width: 73
        height: 28
        color: "#c7e7ac"
        text: kms +"Km"
    font.bold: true
   // icon.color: "#e5b69fbf"
    //display: AbstractButton.TextBesideIcon
   // flat: true



    }


    Button {
        id: button2
        x: 287
        y: 67
        width: 81
        height: 20
        text: "USER"
        layer.samples: 2
        leftPadding: 6
        topPadding: 5
        font.underline: true
        font.italic: true
        font.bold: true
        icon.color: "#e5b69fbf"
        display: AbstractButton.TextBesideIcon
        flat: true


            onClicked: {

                // console.log("cobobox")
                setnadchange.open()

            }

            Connections {
                target: button2
                onClicked: console.log("clicked")
            }

            Connections {
                target: button2
                onClicked: console.log("clicked")
            }

            Connections {
                target: button2
                onClicked: console.log("clicked")
            }

          Connections {
              target: button2
              onClicked: console.log("clicked")
          }

    }



    Popup{

    id:setnadchange
    anchors.centerIn:parent
        x:100
        y:100
        height:640/3
        font.weight: Font.ExtraBold
        font.underline: true
        font.italic: true
        font.bold: true
        margins: 3
        leftMargin: 6
        topMargin: 6
        width: 480/1.8
    background: Rectangle{color: "silver"}

    Image {
         id: image
         anchors.fill: parent
         source: "settingsimg/popbg4.jpg"
     }

    Button{
    id:adduser
    x:20
    y:100
    width: 60
    height: 30
    icon.color: "#e5b69fbf"
    display: AbstractButton.TextBesideIcon
    flat: true


    Text {
        id: adduserbuttontext
        color: "green"
        text: "Add User"
        anchors.fill: parent
        font.pointSize: 10


    }
          onClicked: {
                addusercliked.visible=true
                addusercliked.open()

                  }

  }

    Button{
    id:changeuser
    x:90
    y:100
    width: 60
    height: 30
    icon.color: "#e5b69fbf"
    display: AbstractButton.TextBesideIcon
    flat: true

    Text {
        id: changeuserbuttontext
        color: "green"
       text: "Change"
        anchors.fill: parent
        font.pointSize: 10
    }

    onClicked: {

            var n=[]
        n=testData.accessfromDBusername()
      //  console.log(n)
        myComboBoxname.model=n
              chagecliked.visible=true
          chagecliked.open()

            }
  }


    Button{
    id:closebutton
    x:160
    y:100
    width: 60
    height: 30
    icon.color: "#e5b69fbf"
    display: AbstractButton.TextBesideIcon
    flat: true

    Text {
        id: textforcloseid
        color: "green"
       text: "Close"
        anchors.fill: parent
        font.pointSize: 10
    }

    onClicked: {
    setnadchange.close()
    }


    }



    Button{
    id:updatebutton
    x:100
    y:130
    width: 60
    height: 30
    icon.color: "#e5b69fbf"
    display: AbstractButton.TextBesideIcon
    flat: true

    Text {
        id: updatetext
        color: "green"
       text: "Update"
        anchors.fill: parent
        font.pointSize: 10
    }

    onClicked: {

        var n=[]
    n=testData.accessfromDBusername()
  //  console.log(n)
    myComboBoxnameupdate.model=n
          updatepop.visible=true

    updatepop.open()
    }


    }


}







    Popup{

    id:updatepop
    anchors.centerIn:parent
        x:100
        y:100
        height:640/3
        width: 480/1.8
      visible: false

      Image {
           id: image2
           anchors.fill: parent
           source: "settingsimg/popbg.jpg"
       }


      ComboBox {
          id:myComboBoxnameupdate
          width: 140
          height: 30
          x:80
          y:30
          model: []


      }


      ComboBox {
          id:myComboBoxupdateinbackcolor
          width: 140
          height: 30
          x:80
          y:60
          model: ["red", "green", "blue","black","orange"]


      }


      ComboBox {
          id:myComboBoxupdateinneedlecolpors
          width: 140
          height: 30
          x:80
          y:90
          model: ["red", "green", "blue","black","orange"]

            }

          Label{
          id:updtaename
          width: 30
          height: 30
          color: "#f2f1c1"
          x:0
          text:"Select_Name"
          anchors.top: parent.top
          font.letterSpacing: 0.6
          anchors.topMargin: 28
          topPadding: 2
          styleColor: "#838e6f"
          font.wordSpacing: 0.6
          font.underline: true
          font.italic: true
          font.bold: true
          font.weight: Font.Bold
          font.pointSize: 12
          scale: 0.66
              }
          Label{
          id:updtaebackcolor
          width: 30
          height: 30
          color: "#e5e7b8"
          text: qsTr("Select_BGC")
       //   anchors.top: parent.top
          font.letterSpacing: 0.6
          anchors.topMargin: 28
          topPadding: 2
          styleColor: "#838e6f"
          font.wordSpacing: 0.6
          font.underline: true
          font.italic: true
          font.bold: true
          font.weight: Font.Bold
          font.pointSize: 12
          scale: 0.66
          x:0
          y:60
              }
          Label{
          id:updtaeneddlec
          width: 30
          height: 30
          color: "#f0dbd4"
          text: qsTr("Select_NEd")
        //  anchors.top: parent.top
          font.letterSpacing: 0.6
          anchors.topMargin: 28
          topPadding: 2
          styleColor: "#838e6f"
          font.wordSpacing: 0.6
          font.underline: true
          font.italic: true
          font.bold: true
          font.weight: Font.Bold
          font.pointSize: 12
          scale: 0.66
          x:0
          y:90
              }





      Button{
          x: 100
          y:100
          width: 40
          height: 40
          text:"OK"
          anchors.bottom: parent.bottom
          anchors.bottomMargin: parent

          background: Rectangle {
              color: parent.pressed ? "red" : "green"

      }
          onClicked: {

          var n=myComboBoxnameupdate.currentText
               var bg=myComboBoxupdateinbackcolor.currentText
               var nd=myComboBoxupdateinneedlecolpors.currentText

                console.log(n)
               console.log(bg)
               console.log(nd)

              testData.updating(n,bg,nd)

              updatepop.close()
          }

      }




    }















    Popup{

    id:chagecliked
    anchors.centerIn:parent
        x:100
        y:100
        height:640/3
        width: 480/1.8
      visible: false

      Image {
           id: image3
           anchors.fill: parent
           source: "settingsimg/popbg.jpg"
       }


      ComboBox {
          id:myComboBoxname
          width: 140
          height: 30
          x:80
          y:30
          model: []


      }

      Button{
          x: 100
          y:100
          width: 40
          height: 40
          text:"OK"
          anchors.bottom: parent.bottom
          anchors.bottomMargin: parent
          background: Rectangle {
              color: parent.pressed ? "red" : "green"
      }
          onClicked: {

          var p=myComboBoxname.currentText
              testData.settertochanged(p)
              n=testData.name()
             b=bg=testData.backgroundcolor()
               nd=testData.needlecolor()
             // console.log(n)
             //  console.log(bg)
             //  console.log(nd)
              chagecliked.close()
          }

      }




    }




    Popup{
    id:addusercliked
anchors.centerIn:parent
    x:100
    y:100
    height:640/3
    width: 480/1.8

      visible: false


      Image {
           id: image4
           anchors.fill: parent
           source: "settingsimg/popbg6.jpg"
       }

    ComboBox {
        id:myComboBox
        width: 140
        height: 30
        x:80
        y:30
        model: ["red", "green", "blue","black","orange"]


    }



    ComboBox {
        id:myComboBoxneedlecolor
        width: 140
        height: 30
        x:80
        y:60
        model: ["red", "green", "blue","black","orange"]


    }

    Label{
    id:nedlecolor
    width: 30
    height: 30
    x:0
    y:60
    text:"Needle Color"
        }


    Label{
    id:backBG
    width: 30
    height: 30
    x:0
    y:30
    text:"Select BG"
        }

    Label{
    id:namelabel
    width: 30
    height: 30
    x:0
    y:5
    text:"AddName"
        }


    TextField {
        id:textname
        x:80
        y:0
        width: 140
        height: 30
        placeholderText: qsTr("Enter Nmae Here")
        onTextChanged: t = textname.t
    }


    Button{
        x: 100
        y:100
        width: 60
        height: 40
        text:"OK"
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent
        background: Rectangle {
            color: parent.pressed ? "red" : "green"
    }

    onClicked: {

var h=myComboBox.currentText
        var n=myComboBoxneedlecolor.currentText
        var t = textname.text
      //   console.log(t)
     //    console.log(n)
       // console.log(h)
   //     usertest.adduserDatafromDB(textname.text,myComboBox.currentText,myComboBoxneedlecolor.currentText)
testData.addinDBfromqml(textname.text,myComboBox.currentText,myComboBoxneedlecolor.currentText)
      addusercliked.close()

    }
    }



    }



    states: [
        State {
            name: "State1"
        }
    ]



}


