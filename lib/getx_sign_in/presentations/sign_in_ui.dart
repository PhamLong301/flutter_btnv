import 'package:flutter/material.dart';
import 'package:flutter_btvn/getx_sign_in/presentations/sign_up_ui.dart';
import 'package:get/get.dart';

import '../controller/sign_up_controller.dart';

class SignInUi extends StatelessWidget {
  const SignInUi({super.key});
  @override
  Widget build(BuildContext context) {
  final SignUpController controller = Get.put(SignUpController());
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: controller.formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  validator: controller.checkBlank,
                  decoration: InputDecoration(
                      hintText: 'Username',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                const SizedBox(height: 10,),
                TextFormField(
                  validator: controller.checkBlank,
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: 'Password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Bạn chưa có tài khoản?'),
                      InkWell(
                        onTap: () {
                          Get.to(const SignUpUI());
                        },
                        child: const Text('Đăng ký ngay!',
                        style: TextStyle(
                          color: Colors.blue,
                        ),),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(onPressed: () {},
                    child: const Text("Đăng nhập"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
