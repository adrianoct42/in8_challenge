import 'package:flutter/material.dart';
import 'package:frontend_flutter/controller/product_controller.dart';
import 'package:frontend_flutter/models/unified_dto.dart';
import 'package:frontend_flutter/widgets/app_drawer_widget.dart';
import 'package:frontend_flutter/widgets/list_item.dart';
import 'package:get/get.dart';

class PurchasedSceen extends StatelessWidget {
  PurchasedSceen({super.key});

  final productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.tealAccent,
        title: const Text('Purchased'),
      ),
      drawer: const AppDrawerWidget(),
      body: Obx(() {
        // Fazendo fetch para garantir consistência:
        productController.getProdutosComprados();
        // Padronizando o formato para exibição:
        final produtosFiltrados = productController.produtosComprados
            .map((p) => UnifiedProductDto.fromAny(p))
            .toList();

        final temItens = productController.produtosComprados.isNotEmpty;

        if (!temItens) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                "Nenhum item comprado! Compre os itens através do carrinho.",
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
              "Histórico de Compras",
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
              isCartPage: false,
            ),
          ],
        );
      }),
    );
  }
}
