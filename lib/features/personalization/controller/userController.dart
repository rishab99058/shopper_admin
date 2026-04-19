import 'package:get/get.dart';
import 'package:shopper_admin/model/authModel/userModel.dart';
import 'package:shopper_admin/repository/user/userRepository.dart';
import 'package:shopper_admin/utils/popups/loaders.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  RxBool loading = false.obs;
  Rx<UserModel> user = UserModel.empty.obs;

  final _userRepo = Get.put(UserRepository());

  @override
  void onInit() {
    super.onInit();
    fetchMyDetails();
  }

  Future<UserModel> fetchMyDetails() async {
    try {
      loading.value = true;
      final user = await _userRepo.getMyDetails();
      this.user.value = user;
      loading.value = false;
      return user;
    } catch (e) {
      AppLoaders.errorSnackbar(title: 'Error', message: e.toString());
      loading.value = false;
      return UserModel.empty;
    }
  }
}
