
class Single{
  Single._();  //私有构造函数
  static Single _single=new Single._(); //恶汉式
  factory Single() =>_single;  //工厂

  void getString(){

  }


}