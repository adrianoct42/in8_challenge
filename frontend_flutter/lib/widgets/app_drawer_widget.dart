import 'package:flutter/material.dart';
import 'package:frontend_flutter/controller/nav_controller.dart';
import 'package:get/get.dart';

class AppDrawerWidget extends StatelessWidget {
  const AppDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavController());

    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: const Text(
                  "Navegação",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          ListTile(
            title: const Text("Produtos"),
            subtitle: const Text("Página inicial de Produtos"),
            leading: Icon(Icons.home),
            onTap: () {
              Navigator.pop(context);
              controller.goToProductsPage();
            },
          ),
          ListTile(
            title: const Text("Carrinho"),
            subtitle: const Text("Itens adicionados ao carrinho"),
            leading: Icon(Icons.shopping_cart),
            onTap: () {
              Navigator.pop(context);
              controller.goToCartPage();
            },
          ),
          ListTile(
            title: const Text("Compras"),
            subtitle: const Text("Veja o histórico de compras"),
            leading: Icon(Icons.menu_book),
            onTap: () {
              Navigator.pop(context);
              controller.goToPurchasedPage();
            },
          ),
        ],
      ),
    );
  }
}
