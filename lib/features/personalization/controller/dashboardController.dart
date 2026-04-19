import 'package:get/get.dart';

class DashboardController extends GetxController {
  static DashboardController get instance => Get.find();
  final RxList<double> chartData = <double>[].obs;

  @override
  void onInit() {
    _calculateWeeklySales();
    super.onInit();
  }

  void _calculateWeeklySales() {
    // Dummy sales data for 7 days
    chartData.value = [100.0, 150.0, 120.0, 200.0, 180.0, 250.0, 220.0];
    print(chartData.value);
  }
}
