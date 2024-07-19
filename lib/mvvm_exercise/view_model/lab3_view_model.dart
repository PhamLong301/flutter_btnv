import 'dart:async';

class CountTimeViewModel {
  late final StreamController<String> timeController =
      StreamController<String>();


  Stream<String> get timeStream => timeController.stream;


  void demThoiGian() async {
    int thoiGianTroiQua = 0;
    while (thoiGianTroiQua < 180) {
      int phut = thoiGianTroiQua ~/ 60;
      int giay = thoiGianTroiQua % 60;
      timeController.add("${phut}p${giay}s");
      await Future.delayed(Duration(seconds: 1));
      thoiGianTroiQua++;
    }
    timeController.add("Completed");
    timeController.close();
  }

  void dipose(){
    timeController.close();
  }
}
