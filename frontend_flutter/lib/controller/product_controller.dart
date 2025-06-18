import 'package:frontend_flutter/models/intprod_dto.dart';
import 'package:frontend_flutter/models/natprod_dto.dart';
import 'package:frontend_flutter/services/product_service.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  final ProductService service = ProductService('http://localhost:3000');

  var produtosNacionais = <NatProdDto>[].obs;
  var produtosInternacionais = <IntProdDto>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getProdutosNacionais();
    getProdutosInternacionais();
  }

  void getProdutosNacionais() async {
    try {
      isLoading.value = true;
      final data = await service.getNacionais();
      produtosNacionais.assignAll(data);
    } catch (e) {
      Get.snackbar('Erro', 'Falha ao carregar produtos nacionais!',
          snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }

  void getProdutosInternacionais() async {
    try {
      isLoading.value = true;
      final data = await service.getInternacionais();
      produtosInternacionais.assignAll(data);
    } catch (e) {
      Get.snackbar('Erro', 'Falha ao carregar produtos internacionais!',
          snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> adicionarNacional(NatProdDto produto) async {
    try {
      await service.addNacional(produto);
      getProdutosNacionais();
    } catch (e) {
      Get.snackbar('Erro', 'Não foi possível adicionar produto nacional!',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> adicionarInternacional(IntProdDto produto) async {
    try {
      await service.addInternacional(produto);
    } catch (e) {
      Get.snackbar('Erro', 'Não foi possível adicionar produto internacional!',
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
