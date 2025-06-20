import 'package:flutter/material.dart';
import 'package:frontend_flutter/models/intprod_dto.dart';
import 'package:frontend_flutter/models/natprod_dto.dart';
import 'package:frontend_flutter/services/product_service.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  final ProductService service = ProductService('http://10.0.2.2:3000');

  var produtosNacionais = <NatProdDto>[].obs;
  var produtosInternacionais = <IntProdDto>[].obs;
  var produtosUnidos = <dynamic>[].obs;
  var cartProducts = <dynamic>[].obs;
  var produtosComprados = <dynamic>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    carregarProdutos();
  }

  Future<void> carregarProdutos() async {
    isLoading.value = true;
    await getProdutosNacionais();
    await getProdutosInternacionais();
    produtosUnidos.assignAll([
      ...produtosNacionais,
      ...produtosInternacionais,
    ]);
    await getProdutosComprados();
    isLoading.value = false;
  }

  Future<void> getProdutosNacionais() async {
    try {
      final data = await service.getNacionais();
      produtosNacionais.assignAll(data);
    } catch (e) {
      Get.snackbar(
        'Erro',
        'Falha ao carregar produtos nacionais!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withAlpha(180),
        duration: Duration(seconds: 4),
      );
    }
  }

  Future<void> getProdutosInternacionais() async {
    try {
      final data = await service.getInternacionais();
      produtosInternacionais.assignAll(data);
    } catch (e) {
      Get.snackbar(
        'Erro',
        'Falha ao carregar produtos internacionais!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withAlpha(180),
        duration: Duration(seconds: 4),
      );
    }
  }

  Future<void> getProdutosComprados() async {
    try {
      final data = await service.getProdutosComprados();
      produtosComprados.assignAll(data);
    } catch (e) {
      Get.snackbar(
        'Erro',
        'Falha ao carregar os dados do banco!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withAlpha(180),
        duration: Duration(seconds: 4),
      );
    }
  }

  Future<void> comprarProduto(RxList produtos) async {
    try {
      for (var produto in produtos) {
        if (produto is NatProdDto) {
          await service.addNacional(produto);
        } else if (produto is IntProdDto) {
          await service.addInternacional(produto);
        } else {
          throw Exception(
              "Tipo de produto desconhecido: ${produto.runtimeType}");
        }
      }

      Get.snackbar(
        "Sucesso",
        "Produtos comprados com sucesso!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.greenAccent.withAlpha(180),
        duration: Duration(seconds: 4),
      );

      await getProdutosComprados();
    } catch (e) {
      Get.snackbar(
        "Erro ao comprar",
        "Não foi possível realizar a compra! $e",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withAlpha(180),
        duration: Duration(seconds: 4),
      );
    } finally {
      cartProducts.clear();
    }
  }
}
