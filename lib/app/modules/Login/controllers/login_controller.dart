import 'package:get/get.dart';
import '../../../Services/StoredService.dart';
import '../../Home/views/home_view.dart';
import '../../Login/views/login_view.dart';

class LoginController extends GetxController {
  var email = "".obs;
  var password = "".obs;
  var emailError = "".obs;
  var passwordError = "".obs;
  var isPasswordVisible = false.obs;

  // Validate login fields
  bool validateLogin() {
    emailError.value = "";
    passwordError.value = "";

    if (!GetUtils.isEmail(email.value)) {
      emailError.value = "Please enter a valid email.";
      return false;
    }
    if (password.value.length < 6) {
      passwordError.value = "Password must be at least 6 characters.";
      return false;
    }
    return true;
  }

  // Attempt login
  Future<void> login() async {
    if (validateLogin()) {
      bool success = await StorageService.loginUser(email.value, password.value);

      if (success) {
        Get.offAll(HomeView()); // Navigate to Home
      } else {
        emailError.value = "Invalid email or password.";
        passwordError.value = "Invalid email or password.";
      }
    }
  }

  // Logout user
  Future<void> logout() async {
    await StorageService.logoutUser();
    Get.offAll(LoginView()); // Navigate back to login screen
  }
}
