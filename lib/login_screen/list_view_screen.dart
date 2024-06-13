import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../resources/image_app.dart';

class ListChatScreen extends StatefulWidget {
  const ListChatScreen({super.key});

  @override
  State<ListChatScreen> createState() => _ListChatScreenState();
}

class ChatModel {
  String imagePath;
  String name;

  ChatModel(this.imagePath, this.name);
}

class _ListChatScreenState extends State<ListChatScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Message",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.purple,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 8,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            searchTextFormField(),
            SizedBox(
              height: 10,
            ),
            SizedBox(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: [
                    listBubbleRowChat(),
                    listBubbleRowChat(),
                    listBubbleRowChat(),
                    listBubbleRowChat(),
                    listBubbleRowChat(),
                    listBubbleRowChat(),
                    listBubbleRowChat(),
                    listBubbleRowChat(),
                    listBubbleRowChat(),
                    listBubbleRowChat(),
                  ],
                )),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  listColumnChat(),
                  listColumnChat(),
                  listColumnChat(),
                  listColumnChat(),
                  listColumnChat(),
                  listColumnChat(),
                  listColumnChat(),
                  listColumnChat(),
                  listColumnChat(),
                  listColumnChat(),
                  listColumnChat(),
                  listColumnChat(),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        backgroundColor: Colors.purple,
        child: Icon(Icons.remove_circle_outline, color: Colors.white,),
      ),
    );
  }

  TextFormField searchTextFormField() {
    return TextFormField(
      cursorColor: Colors.purpleAccent,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.purpleAccent,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
          borderSide: const BorderSide(
            color: Colors.purpleAccent,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
          borderSide: const BorderSide(
            color: Colors.purpleAccent,
            width: 2,
          ),
        ),
      ),
    );
  }

  Row listBubbleRowChat() {
    return Row(
      children: [
        Column(
          children: [
            Container(
              height: 70,
              width: 70,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.black,
                  width: 3,
                ),
              ),
              child: CircleAvatar(
                child: Image.asset(
                  ImageApp.imageBike,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Text('User Name')
          ],
        ),
        SizedBox(
          width: 10,
        ),
      ],
    );
  }

  Row listColumnChat() {
    return Row(
      children: [
        CircleAvatar(
          child: Image.asset(
            ImageApp.imageBike,
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('User name'),
              Text('Chat content'),
            ],
          ),
        )
      ],
    );
  }
}
