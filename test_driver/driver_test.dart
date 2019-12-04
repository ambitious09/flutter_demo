import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main(){
  group("计算加减", (){
    FlutterDriver flutterDriver;

    final counterText=find.byValueKey("counter");
    final increment=find.byValueKey("increment");

    setUpAll(() async{
      flutterDriver= await FlutterDriver.connect();
    });

    //关闭

    tearDownAll((){
        if(flutterDriver!=null){
          flutterDriver.close();
          flutterDriver=null;
        }
    });

    test("start is 0", () async{
      expect(await flutterDriver.getText(counterText),"0");
    });

    test("add", () async{
      await flutterDriver.tap(increment);
      expect(await flutterDriver.getText(counterText),"1");
    });


  });
}