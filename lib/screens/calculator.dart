
import 'package:flutter/material.dart';
import 'package:calculator/tabs/cgpa.dart';
import '../tabs/gpa.dart';
import '../drawer/menu.dart';

class Calculator extends StatefulWidget{
createState()=>CalculatorState();
}
class CalculatorState extends State<Calculator>{
  Widget build(context)
  {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: Drawer(semanticLabel:'Asad',child:Menu() ,), 
      body: NestedScrollView(
        headerSliverBuilder: (context,innerBoxIsScrolled){
          return <Widget>[
            new SliverAppBar(
              title: new Text('Calculator',
                style: TextStyle(fontFamily: 'myFamily1',
                  fontSize: 24),),
              centerTitle: true,
              pinned: true,
              floating: true,
              forceElevated: innerBoxIsScrolled,
              bottom:  TabBar(
                indicatorColor: Colors.green[900],
                indicatorWeight: 3,
                labelColor: Colors.green[900],
                labelStyle: TextStyle(
                  fontSize: 18,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold),
                unselectedLabelColor: Colors.black38,
                unselectedLabelStyle: TextStyle(
                  fontSize: 14,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold),
                tabs: [
                  Tab(text:'GPA'),
                  Tab(text:'CGPA') ],
                  ),
            ),
          
          ];
        },
        body: TabBarView(
          children:[
            Gpa(),
            CGPA()]
            ),
        ),
    ),
    );
  }
}
