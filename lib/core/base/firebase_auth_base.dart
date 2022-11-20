import '../service/model/OnboardingModel/UserForLoginModel.dart';
import '../service/model/OnboardingModel/UserForRegister.dart';

abstract class IFirebaseAuthService {
  Future<void> signUpWithEmail(UserForRegister userForRegister);
  Future<void> signInWithEmail(UserForLoginModel userForLoginModel);
}
