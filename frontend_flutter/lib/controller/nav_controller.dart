import 'package:get/get.dart';

class NavController extends GetxController {
  void goToProductsPage() {
    Get.toNamed('/products');
  }

  void goToCartPage() {
    Get.toNamed('/cart');
  }

  void goToPurchasedPage() {
    Get.toNamed('/purchased');
  }

  void goBack() {
    Get.back();
  }
}
