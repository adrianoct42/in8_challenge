import 'package:flutter/material.dart';
import 'package:frontend_flutter/controller/product_controller.dart';
import 'package:frontend_flutter/models/unified_dto.dart';
import 'package:frontend_flutter/widgets/app_drawer_widget.dart';
import 'package:frontend_flutter/widgets/cart_item.dart';
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
        title: const Text('Cart'),
      ),
      drawer: const AppDrawerWidget(),
      body: Obx(() {
        // Padronizando o formato para exibição:
        final produtosFiltrados = productController.cartProducts
            .map((p) => UnifiedProductDto.fromAny(p))
            .toList();

        return Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            const Text(
              "Bem vindo à página do Carrinho",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                  height: 8,
                ),
                itemCount: productController.cartProducts.length,
                itemBuilder: (context, index) {
                  final product = produtosFiltrados[index];
                  return Row(
                    children: [
                      const SizedBox(
                        width: 8,
                      ),
                      CartItem(
                        nome: product.nome,
                        preco: product.preco,
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.delete_outline,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          productController.cartProducts.removeAt(index);
                          productController.cartProducts.refresh();
                        },
                        tooltip: 'Remover',
                      ),
                    ],
                  );
                },
              ),
            ),
            productController.cartProducts.isNotEmpty
                ? Padding(
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
                            ), // forma de pílula
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
                : SizedBox.shrink(),
          ],
        );
      }),
    );
  }
}
