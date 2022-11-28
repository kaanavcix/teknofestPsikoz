import 'package:get/get_utils/src/get_utils/get_utils.dart';

class Validator {
  static String? emailValidator(String? value) =>
      !GetUtils.isEmail(value ?? "") ? "Email doğru değil " : null;
  static String? validatorPassword(String? value) =>
      value!.isEmpty || value.length < 3 ? "Lütfen değer giriniz" : null;

  static String? validateName(String? value) =>
      value!.isEmpty || value.length < 3 ? "Lütfen değer giriniz" : null;
      
}
