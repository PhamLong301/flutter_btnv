import 'package:flutter/material.dart';
import 'package:flutter_btvn/login_screen/list_view_screen.dart';



class LoginScreen extends StatefulWidget {

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userController = TextEditingController();

  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.pink[50],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          'MobiPay',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 50),
                      TextFormField(
                        controller: userController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: passController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if(userController.text == "admin" && passController.text == "admin123"){
                          Navigator.push(context,MaterialPageRoute(builder: (context) => ListChatScreen(),));
                        } else if(userController.text == "" && passController.text == ""){
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("O nhap trong"),
                                backgroundColor: Colors.red,
                              ),
                          );
                        }
                        else{
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Sai tai khoan hoac mat khau"),
                                backgroundColor: Colors.red,),
                          );
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      backgroundColor: Colors.purple,
                    ),
                    child: Text(
                      'LOGIN',
                      style: TextStyle(color: Colors.white,
                        // fontFamily: 'Righteous',
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      // Handle forgot password
                    },
                    child: Text(
                      'Forgot Password? Click here',
                      style: TextStyle(
                        color: Colors.black,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  Text(
                    'Your Mobile\nYour Bank',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.purple,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
