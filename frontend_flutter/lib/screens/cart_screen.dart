import 'package:flutter/material.dart';
import 'package:frontend_flutter/controller/product_controller.dart';
import 'package:frontend_flutter/models/unified_dto.dart';
import 'package:frontend_flutter/widgets/app_drawer_widget.dart';
import 'package:frontend_flutter/widgets/list_item.dart';
import 'package:get/get.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.tealAccent,
        title: const Text('Cart'),
      ),
      drawer: const AppDrawerWidget(),
      body: Obx(() {
        // Padronizando o formato para exibição:
        final produtosFiltrados = productController.cartProducts
            .map((p) => UnifiedProductDto.fromAny(p))
            .toList();

        final temItens = productController.cartProducts.isNotEmpty;

        if (!temItens) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                "Nenhum item adicionado no carrinho! Adicione na página de produtos.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          );
        }

        return Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            const Text(
              "Página do Carrinho",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            ListItem(
              produtosFiltrados: produtosFiltrados,
              isCartPage: true,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
              ),
              child: Align(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {
                    productController
                        .comprarProduto(productController.cartProducts);
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 12,
                    ),
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        30,
                      ),
                    ),
                  ),
                  child: const Text(
                    "Comprar",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
          ],
        );
      }),
    );
  }
}
