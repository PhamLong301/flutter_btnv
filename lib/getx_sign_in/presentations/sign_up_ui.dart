import 'package:flutter/material.dart';
import 'package:flutter_btvn/getx_sign_in/controller/sign_up_controller.dart';
import 'package:get/get.dart';

class SignUpUI extends StatelessWidget {
  const SignUpUI({super.key});

  @override
  Widget build(BuildContext context) {
    final SignUpController controller = Get.put(SignUpController());

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Đăng ký'),
        ),
        body: Form(
          key: controller.formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.usernameController,
                    validator: controller.checkUsername,
                    decoration: InputDecoration(
                        hintText: 'Tên đăng nhập',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)
                        )
                    ),
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    obscureText: true,
                    controller: controller.passwordController,
                    validator: controller.checkPassword,
                    decoration: InputDecoration(
                        hintText: 'Mật khẩu',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)
                        )
                    ),
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    obscureText: true,
                    controller: controller.confirmPasswordController,
                    validator: controller.checkConfirmPassword,
                    decoration: InputDecoration(
                        hintText: 'Xác nhận mật khẩu',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)
                        )
                    ),
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    controller: controller.fullNameController,
                    validator: controller.checkBlank,
                    decoration: InputDecoration(
                        hintText: 'Tên đầy đủ',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)
                        )
                    ),
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    controller: controller.addressController,
                    validator: controller.checkBlank,
                    decoration: InputDecoration(
                        hintText: 'Địa chỉ',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    controller: controller.genderController,
                    validator: controller.checkBlank,
                    decoration: InputDecoration(
                        hintText: 'Giới tính',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)
                        )
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: controller.onSignUp,
                    child: const Text('Đăng ký'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
