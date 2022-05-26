

import 'package:flutter/material.dart';
import 'package:calculator/fontsColorsETC.dart';
import '../Widgets/listHeader.dart';
import '../calculations/cgpaCalculation.dart';
import '../blocs/cgpaBloc.dart';
import '../screens/PopUp.dart';

bool enableCalculateButton=false;
int smesterCount=0;
CGPACalculation calculation=new CGPACalculation();

class CGPA extends StatefulWidget{
  _CGPAState createState()=> _CGPAState();
}
class _CGPAState extends State<CGPA> with AutomaticKeepAliveClientMixin{
  @override
  bool get wantKeepAlive=>true;
  Widget build(context)
  {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row( 
          children: <Widget>[
            Container(
              child:(calculation.numberOfSmesters>0)?
                Text('press clear to enter again'):Text('No of smesters:  '),
              padding: EdgeInsets.only(right: 10),),
              smesterDropDownButton()
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        listHeader('Smester','credit Hr','Quality Pt'),
        Expanded(
          child: ListView.separated(
            separatorBuilder:(context,index)=>Divider(color: Colors.green,),
            itemCount: calculation.numberOfSmesters,
            addAutomaticKeepAlives: wantKeepAlive,
            cacheExtent: 600,
            itemBuilder: (context,index){
              return ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child:Container(
                  height: 40,
                  color: Colors.lightGreen[100],
                  child: row(calculation.smesterList[index]),
                  padding: EdgeInsets.all(4),)
                );
              },
            )
          ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            StreamBuilder(
              stream: calculation.validSmesters, 
              builder: (context,snapshot){ 
                return RaisedButton(
                  onPressed: (calculation.numberOfSmesters==0)? null:
                    (snapshot.hasData && enableCalculateButton==true)?
                    (){
                      calculation.calculateCgpa();
                      showPopUp(context,
                      _showResult(),
                      "CGPA Result");
                      }:null,
                  color: Colors.green[300],
                  hoverColor: Colors.green[900],
                  colorBrightness: Brightness.light,
                  splashColor: Colors.green[500],
                  focusColor: Colors.green[700],
                  padding: EdgeInsets.all(0),
                  child: Text('Calculate'),);
                }
              ),
            Container( 
            margin: EdgeInsets.only(left: 30),
            height: 0,), 
            RaisedButton(
              child: Text('Clear'),
              color: Colors.green[300],
              hoverColor: Colors.green[900],
              colorBrightness: Brightness.light,
              splashColor: Colors.green[500],
              focusColor: Colors.green[700],
              padding: EdgeInsets.all(0), 
              onPressed: ()
              {
              setState(() {
                calculation=new CGPACalculation(); calculation.setNoOfSmesters(0); 
                enableCalculateButton=false;});
                },
              )
            ]
          ) 
      ],
    );
  }
    Widget _showResult()
  {
    return Container(
      padding: EdgeInsets.only(top: 30),
      child:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
               _rowForResullt('Credit Hours   :', calculation.totalCreditHours.toString()),
               _rowForResullt('Quality Points :', calculation.totalQualityPoints.toString()),
               _rowForResullt('Cgpa           :', calculation.cgpaValue),
          ],
        ),
    );
  }
  Widget _rowForResullt(String name,String value)
  {
     return Container(
      alignment: Alignment.center,
        margin: EdgeInsets.only(left: 5,top: 10,right:5),
        padding: EdgeInsets.only(left:10,top: 5,right: 5,bottom: 5),
        decoration: BoxDecoration(
          color: Colors.lightGreen[100],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            bottomRight: Radius.circular(50)), 
            border: Border.all(width: 3,color: listLineColor,)
            ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(name,style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 15,
              fontStyle: FontStyle.normal),),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(value,
              style: TextStyle(
                fontFamily: numberFont,
                color: numberColor,
                fontSize: 15),
                ),
              ],
            )
          ],
       )
    );
  }
  Widget smesterDropDownButton()
  {
    return DropdownButton<int>(
      value:calculation.numberOfSmesters ,
      style: TextStyle(fontFamily: numberFont,color: numberColor),
      onChanged:(value){setState((){smesterCount=1;   
        calculation=new CGPACalculation();   calculation.setNoOfSmesters(value); print(calculation.numberOfSmesters);  });},
      items: (calculation.numberOfSmesters>0)?null:
        <int> [0,1,2,3,4,5,6,7,8,9,10]
        .map<DropdownMenuItem<int>>((int value){
        return DropdownMenuItem<int>(child: Text(value.toString()),value: value,);})
        .toList(),
    ); 
  }
  Widget row(CgpaBloc bloc)
  {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:  <Widget>
      [
        Container(
          child:Center(child:Text('Smester ${smesterCount++}')),
          width: 100,
          height: 35,
          foregroundDecoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: listLineColor,
                width: 5,),
            ),
          )
        ),
        Container(
          child:Center(child:numberInputWidget(bloc.creditHour,bloc.changeCreditHour,'00')),
          width: 100,
          height: 35,
          foregroundDecoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: listLineColor,
                width: 5,),
              left: BorderSide(
                color: listLineColor,
                width: 5,),
              right: BorderSide(
                color: listLineColor,
                width: 5,)
            ),
          )
        ),
        Container(
          child:Center(child:numberInputWidget(bloc.qualityPoint,bloc.changeQualityPoint,'0.0')),
          width: 100,
          height: 35,
          foregroundDecoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: listLineColor,
                width: 5,),
            ),
          )
        )
      ],
    );
  }
  Widget numberInputWidget(Stream stream,Function changeValue, String hint)
  {
    return StreamBuilder(
      stream: stream,
      builder: (context,snapshot){ 
        return Container(        
          width: 50,
          child: Center(
            child:TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hint,
                hintStyle: TextStyle(
                  fontFamily: numberFont,
                  color:Colors.grey),),
              onChanged: (value){changeValue(value); enableCalculateButton=true;},
              autofocus: true,
              style: TextStyle(
                fontFamily: numberFont,
                color: snapshot.hasError?Colors.red: numberColor),
              keyboardType: TextInputType.phone,
            ),
          ),
        );
      },
    );
  }
}
