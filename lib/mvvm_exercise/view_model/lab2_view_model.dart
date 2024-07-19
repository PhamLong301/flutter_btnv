import 'dart:async';

class CountDownViewModel{
  late StreamController<String> textController = StreamController<String>();
  late StreamController<bool> buttonController = StreamController<bool>.broadcast();

  Stream<String> get textStream => textController.stream;
  Stream<bool> get buttonStream => buttonController.stream;


  void batDauDemThoiGian() async{
    buttonController.add(false);
    for(int i = 3; i >= 0; i--){
      await Future.delayed(Duration(seconds: 1));
      if(i > 0){
        textController.add('${i}');
      }else {
        textController.add('Done');
      }
    }
    buttonController.add(true);
  }

  void dispose(){
    textController.close();
    buttonController.close();
  }
}