import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Services/StoredService.dart';
import '../../Login/views/login_view.dart';

class CreateAccountController extends GetxController {
  var name = "".obs;
  var email = "".obs;
  var phone = "".obs;
  var password = "".obs;

  var nameError = "".obs;
  var emailError = "".obs;
  var phoneError = "".obs;
  var passwordError = "".obs;

  bool validateForm() {
    nameError.value = "";
    emailError.value = "";
    phoneError.value = "";
    passwordError.value = "";

    bool isValid = true;

    if (name.value.isEmpty) {
      nameError.value = "Name is required.";
      isValid = false;
    }

    if (!GetUtils.isEmail(email.value)) {
      emailError.value = "Enter a valid email.";
      isValid = false;
    }

    if (phone.value.length != 10) {
      phoneError.value = "Phone number must be 10 digits.";
      isValid = false;
    }

    if (password.value.length < 6) {
      passwordError.value = "Password must be at least 6 characters.";
      isValid = false;
    }

    return isValid;
  }

  Future<void> createAccount() async {
    if (validateForm()) {
      await StorageService.saveUser(email.value, password.value);
      print("User registered successfully");

      Get.snackbar("Success", "Account created successfully!", snackPosition: SnackPosition.BOTTOM);
      Get.offAll(LoginView()); // Navigate to Login Page
    }
  }
}
