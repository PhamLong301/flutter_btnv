import 'package:flutter/material.dart';

class demoFutureUI extends StatelessWidget {
  const demoFutureUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<String>(
        future: loadImage(),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
              return Icon(Icons.question_mark, size: 50,);
            }else if(snapshot.hasError){
              return Text('Error: ${snapshot.error}');
            }else if(snapshot.hasData){
              return Image.network(snapshot.data!);
            }else{
              return Text('Something went wrong');
            }
          },
      ),
      ),
    );
  }

  Future<String> loadImage() async{
    await Future.delayed(Duration(seconds: 3));
    return'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg';
  }
}
