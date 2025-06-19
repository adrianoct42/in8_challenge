import 'package:flutter/material.dart';
import 'package:frontend_flutter/controller/product_controller.dart';
import 'package:frontend_flutter/models/unified_dto.dart';
import 'package:frontend_flutter/widgets/cart_item.dart';
import 'package:get/get.dart';

class ListItem extends StatelessWidget {
  final List<UnifiedProductDto> produtosFiltrados;
  final bool isCartPage;

  const ListItem({
    super.key,
    required this.produtosFiltrados,
    required this.isCartPage,
  });

  @override
  Widget build(BuildContext context) {
    final productController = Get.put(ProductController());

    return Expanded(
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(
          height: 8,
        ),
        itemCount: produtosFiltrados.length,
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
              isCartPage
                  ? IconButton(
                      icon: const Icon(
                        Icons.delete_outline,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        productController.cartProducts.removeAt(index);
                        productController.cartProducts.refresh();
                      },
                      tooltip: 'Remover',
                    )
                  : SizedBox.shrink(),
            ],
          );
        },
      ),
    );
  }
}
