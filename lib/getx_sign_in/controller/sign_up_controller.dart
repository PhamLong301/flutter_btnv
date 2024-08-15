import 'package:flutter/widgets.dart';
import 'package:flutter_btvn/getx_sign_in/presentations/sign_in_ui.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final fullNameController = TextEditingController();
  final addressController = TextEditingController();
  final genderController = TextEditingController();

  String? checkBlank(String? value) {
    if (value == null || value.isEmpty) {
      return 'Trường thông tin của bạn trống';
    }
    return null;
  }

  String? checkUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Trường thông tin của bạn trống';
    } else if (!RegExp(r'^[a-zA-Z0-9]{6,}$').hasMatch(value)) {
      return 'Tên đăng nhập không được chứa ký tự đặc biệt và tối thiểu 6 ký tự';
    }
    return null;
  }

  String? checkPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Trường thông tin của bạn trống';
    } else if (!RegExp(
            r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}$')
        .hasMatch(value)) {
      return 'Mật khẩu chưa đúng định dạng và tối thiểu phải 6 ký tự';
    }
    return null;
  }

  String? checkConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Trường thông tin của bạn trống';
    } else if (value != passwordController.text) {
      return 'Mật khẩu không trùng khớp';
    }
    return null;
  }

  void onSignUp() {
    if (formKey.currentState!.validate()) {
      Get.to(const SignInUi());
    }
  }
}
