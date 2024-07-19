// void main() async {
//   // print(await createOrderMessage());
//   var oder = await fetchUserOrder();
//   print('$oder');
//   fetchUserOrder()
//           .then(
//         // (value) => print('value $value'),
//         (value) => print('value $value'),
//       )
//       .catchError(() {
//     print('error');
//   });
// }

// String getNameNow() {
//   return 'name';
// }
//
// Future<String> getNameFromNetwork() async {
//   await Future.delayed(Duration(seconds: 2), () {});
//   return 'nameNetwork';
// }

void main() async{
  // one() // Future completes with "from one".
  //     .then((_) => two()) // Future completes with two()'s error.
  //     .then((_) => three()) // Future completes with two()'s error.
  //     .then((_) => four()) // Future completes with two()'s error.
  //     .then((value) => value.length) // Future completes with two()'s error.
  //     .catchError((e) {
  //   print('Got error: $e'); // Finally, callback fires.
  //   return 42; // Future completes with 42.
  // }).then((value) {
  //   print('The value is $value');
  // }).whenComplete(() => print('something clear'));
  // await fetchUserOrder();

  // Future.delayed(const Duration(seconds: 1), () => throw 401)
  //     .then(
  //       (value) {
  //         throw 'Unreachable';
  //       },
  //       onError: (error) {
  //         //show money = 0000;
  //         print('OnError');
  //       },
  //     )
  //     .then((value) => 1)
  //     .catchError(
  //       (err) {
  //         ///Tạm thời dịch vụ hiển thị tiền bị gián đoạn
  //         // print('Error: $err'); // Prints 401.
  //       },
  //     );


  ///For each Future
  Future delayed(int second) async{
    await Future.delayed(Duration(seconds: second));
    return second;
  }

  List<int> steps = [1,2,3,4,5];

  var result = await delayed(10).timeout(const Duration(seconds: 2)).catchError((error){
    return error.toString();
  });
  print(result);
}

int getAgeNow(){
  return 2;
}

Future<int> getAge() async{
  return 2;
}

Future<String> createOrderMassege() async{
  var order = await fetchUserOrder();
  return 'your order is ${order}';
}

Future<int> fetchUserOrder() =>
    Future.delayed(const Duration(seconds: 2),
          () => (1 / 0 as int),).then((value) => value);

Future<String> fetchUserOder2() async{
  return Future.delayed(const Duration(seconds: 2), () => '',);
}

///Handel error
Future<String> one () => Future.value('From one');
//Future<String> two () => Future.error('error from two');
Future<List<String>> two() => Future.value(['error from two']);
Future<String> two2() => Future.value('error from two2');
Future<String> three () => Future.value('from three');
Future<String> four () => Future.value('from four');


