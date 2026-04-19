import 'package:get/get.dart';
import 'package:shopper_admin/features/personalization/controller/userController.dart';
import 'package:shopper_admin/repository/authentication/authenticationRepository.dart';
import 'package:shopper_admin/repository/user/userRepository.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthenticationRepository(), fenix: true);
    Get.lazyPut(() => UserRepository(), fenix: true);
    Get.lazyPut(() => UserController(), fenix: true);
  }
}
