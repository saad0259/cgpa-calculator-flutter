
import 'package:flutter/material.dart';
import '../fontsColorsETC.dart';

class Menu extends StatefulWidget{
  _MenuState createState()=> _MenuState();
}
class _MenuState extends State<Menu>{
  Icon helpUpDownIcon;
  Icon developerInfoUpDownIcon;
  Icon contactUpDownIcon;
  Icon down=Icon(Icons.arrow_drop_down_circle,color: Colors.green[900],);
  Icon up=Icon(Icons.arrow_upward,color: Colors.green[900]);
  _MenuState(){
     helpUpDownIcon=down;
     developerInfoUpDownIcon=down;
     contactUpDownIcon=down; }
  @override
  Widget build(BuildContext context)
  {
    return Container(
      padding: EdgeInsets.only(top:25,right: 10,left:0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget> [
           _menuButton(
            firstIcon: Icon(Icons.info,
              color: Colors.green[900],),
            lastIcon: developerInfoUpDownIcon,
            lastIconSpace: 90,
            title: 'Developer Info',
            onPress: (){
              setState(() {
              if(developerInfoUpDownIcon==down) developerInfoUpDownIcon=up;
              else developerInfoUpDownIcon=down;
              });}
          ),
          _developerInfoContent(),
          _menuButton(
            firstIcon: Icon(Icons.contacts,
              color: Colors.green[900],),
            lastIcon: contactUpDownIcon,
            lastIconSpace: 110,
            title: 'Contact Us',
            onPress: (){
              setState(() {
              if(contactUpDownIcon==down) contactUpDownIcon=up;
              else contactUpDownIcon=down;
              });}
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.brown[100],
              ),
            
            child: (contactUpDownIcon==down)?null: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:(contactUpDownIcon==down)?[]:
                <Widget>[
                 Container(height: 10,),
                 Row( 
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(margin: EdgeInsets.only(left: 70),),
                    Icon(Icons.contact_phone,size: 14,color: Colors.blue[500],),
                    Container(padding: EdgeInsets.only(left: 15),),
                    _setText(
                      text: '+923005229243',
                      color: Colors.brown[900],
                      fontWeight: FontWeight.normal,
                      fontFamily: numberFont,
                      fontSize: 12 ),
                    ],
                 ),
                 Row( 
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(margin: EdgeInsets.only(left: 70,top: 25,bottom: 5),),
                    Icon(Icons.email,size: 14,color: Colors.brown[500],),
                    Container(padding: EdgeInsets.only(left: 15),),
                    _setText(
                      text: 'chuadhry243@gmail.com',
                      color: Colors.blue[900],
                      fontWeight: FontWeight.normal,
                      fontFamily: numberFont,
                      fontSize: 12 ),
                    ],
                 )
                ]
              )
            ),
          _menuButton(
            firstIcon: Icon(Icons.help,
              color: Colors.green[900],),
            lastIcon: helpUpDownIcon,
            lastIconSpace: 150,
            title: 'Help',
            onPress: (){
              setState(() {
              if(helpUpDownIcon==down) helpUpDownIcon=up;
              else helpUpDownIcon=down;
              });}
          ),
          Expanded( 
            child: ListView(
            padding: EdgeInsets.all(0),
            shrinkWrap: true,
            children:(helpUpDownIcon==down)?[]:
            _helpContent(),
          ),
          ),
        ]
      ),
    );
  }
  List<Widget> _helpContent()
  {
    return <Widget>[
      Container(
        alignment: Alignment(0,-1),
        child: Text('How to calculate GPA ?',style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: Colors.brown[1000]),
            ),
      ),
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.brown[100], ),
      alignment: Alignment(0,-1),
      margin: EdgeInsets.all(2),
      padding : EdgeInsets.all(4),
      child: Text('1- Select number of subjects per smester.\n      i.e In DVM each smester include 10 subject \n      and in BS degreee each smester include \n      6 subjects',
          style: TextStyle(
            fontSize: 12,
            fontStyle: FontStyle.normal,
            color: Colors.brown[750]),)
      ),
      Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.brown[100], ),
      alignment: Alignment(0,-1),
      margin: EdgeInsets.all(2),
      padding : EdgeInsets.all(4),
      child: Text('2- Fill all the fields correctly to enable Calculate\n     Button.\n     If any incorrect value entered Calculate \n     button will be disabled',
          style: TextStyle(
            fontSize: 12,
            fontStyle: FontStyle.normal,
            color: Colors.brown[750]),),
      ),
     Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.brown[100], ),
      alignment: Alignment(0,-1),
      margin: EdgeInsets.all(2),
      padding : EdgeInsets.all(4),
      child: Text('tip: Note quality points and credit hours of your\n     smester result\n     it will be helpful to calculate CGPA',
          style: TextStyle(
            fontSize: 12,
            fontStyle: FontStyle.normal,
            color: Colors.brown[750]),),
      ),
      Container(
        alignment: Alignment(0,-1),
        child: Text('How to calculate CGPA ?',style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: Colors.brown[1000]),
            ),
      ),
     Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.brown[100], ),
      margin: EdgeInsets.all(2),
      padding : EdgeInsets.all(4),
      child: Text('    Select number of semster \n       Enter quality points and credit of each smester\n       calculated in GPA',
          style: TextStyle(
            fontSize: 12,
            fontStyle: FontStyle.normal,
            color: Colors.brown[750]),),
      ),
   ];
  }
  Widget _buttonChild(Icon firstIcon,String name,Icon secondIcon,double leftIconSpace)
  {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(15),
        bottomRight: Radius.circular(15)
      ),
      child: Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.green[100],
        border: Border(
          top: BorderSide(
            width:5,
            color: Colors.green[900]),
          right: BorderSide(
            width:5,
            color: Colors.green[900]),
          bottom: BorderSide(
            width:5,
            color: Colors.green[900]),),
         ),
      child: Row(
      children: <Widget>[
        firstIcon,
        Container(padding: EdgeInsets.only(left:20),),
        Text(name,style: TextStyle(
          color: Colors.green[900],
          fontWeight: FontWeight.bold),),
        Container(padding: EdgeInsets.only(left:leftIconSpace),),
        secondIcon
        ],
      ),
    ),
    );
  }
  Widget _menuButton({String title,Color color,Icon firstIcon,
    Icon lastIcon,double lastIconSpace,Function onPress})
  {
    return GestureDetector(
      child: _buttonChild(firstIcon,
            title,
            lastIcon,
            lastIconSpace),
      onTap: onPress,
    );
  }
  Widget _developerInfoContent()
  {
   return Container(
     decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.brown[100],),
     child: 
      Column(
     mainAxisAlignment: MainAxisAlignment.center,
      children:(developerInfoUpDownIcon==down)?[]:
        <Widget>[
          Container(
            padding: EdgeInsets.all(5),
            width: 90,
            height: 90,
            child: 
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              child:Image.asset('img/dev.jpg'),
           ), 
         ),
         Row( 
           crossAxisAlignment: CrossAxisAlignment.start,
           children: <Widget>[
             Container(margin: EdgeInsets.only(left: 70),),
             Icon(Icons.account_circle,size: 18,color: Colors.blue[500],),
             Container(padding: EdgeInsets.only(left: 15),),
             _setText(
              text: 'Asad Chuadhry',
              color: Colors.brown[900],
              fontWeight: FontWeight.bold,
              fontFamily: headerFont,
              fontSize: 16 ),
           ],
         ),
         Row( 
           crossAxisAlignment: CrossAxisAlignment.start,
           children: <Widget>[
             Container(margin: EdgeInsets.only(left: 70),),
             Icon(Icons.star,size: 18,color: Colors.purple[500]),
             Container(padding: EdgeInsets.only(left: 15),),
             _setText(
              text: '16-ARID-673',
              color: Colors.brown[900],
              fontWeight: FontWeight.bold,
              fontFamily: headerFont,
              fontSize: 16 ),
           ],
         ),
         Row( 
           crossAxisAlignment: CrossAxisAlignment.start,
           children: <Widget>[
            Container(margin: EdgeInsets.only(left: 70),),
            Icon(Icons.android,size: 18,color: Colors.green[500]),
            Container(padding: EdgeInsets.only(left: 15),),
             _setText(
              text: 'Android Developer',
              color: Colors.brown[800],
              fontWeight: FontWeight.bold,
              fontFamily: headerFont,
              fontSize: 16 ),
           ],
         ),
         Row( 
           crossAxisAlignment: CrossAxisAlignment.start,
           children: <Widget>[
             Container(margin: EdgeInsets.only(left: 70),),
             Icon(Icons.phone_iphone,size: 18,color: Colors.black),
             Container(padding: EdgeInsets.only(left: 15),),
             _setText(
              text: 'IO\'s Developer',
              color: Colors.brown[800],
              fontWeight: FontWeight.bold,
              fontFamily: headerFont,
              fontSize: 16 ),
           ],
         ),
         
        ],
     ),
   );
  }
  Widget _setText({String text,Color color,FontWeight fontWeight,double fontSize,String fontFamily})
  {
    return Container( 
      padding: EdgeInsets.all(2),
      child: Text(
        text,
        style: TextStyle( 
          color: color,
          fontSize: fontSize,
        //  fontFamily: fontFamily,
          fontWeight: fontWeight,
          fontStyle: FontStyle.normal,),
      )
    );
  }
}
