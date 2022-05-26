
import 'package:rxdart/rxdart.dart';
import 'dart:async';
class CgpaBloc extends Object with Validators{
  BehaviorSubject<String> _creditHrController=new BehaviorSubject<String>();
  BehaviorSubject<String> _qualityPtController=new BehaviorSubject<String>();

  int get creditHrValue=>int.parse(_creditHrController.value);
  double get qualityPtValue=>double.parse(_qualityPtController.value);

  Function get changeCreditHour=>_creditHrController.sink.add;
  Function get changeQualityPoint=>_qualityPtController.sink.add;

  Observable<String> get creditHour=>_creditHrController.stream.transform(_creditHrValidator);
  Observable<String> get qualityPoint=>_qualityPtController.stream.transform(_qualiityPtValidator);

  Observable<bool> get smesterValid=>Observable.combineLatest2(creditHour, qualityPoint, (c,q)=>true);

}

class Validators {
  StreamTransformer<String,String> _creditHrValidator= StreamTransformer<String,String>.fromHandlers(
    handleData: (value,sink){
      int temp;
      try{
        temp=int.parse(value);
        if(temp<=50)
        sink.add(value);
        else sink.addError('inValid');    }
      catch(e)
      {
        sink.addError("invalid");
      }
    }
  );
  StreamTransformer<String,String> _qualiityPtValidator=StreamTransformer<String,String>.fromHandlers(
    handleData: (value,sink)
    {
      double temp;
      try{
        temp=double.parse(value);
        if(temp<=200) sink.add(value);
        else sink.addError('invalid');
      }
      catch(e)
      {
        sink.addError("invlaid");
      }
    }
  );
}