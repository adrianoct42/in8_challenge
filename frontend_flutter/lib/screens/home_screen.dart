import 'package:flutter/material.dart';
import 'package:frontend_flutter/controller/product_controller.dart';
import 'package:frontend_flutter/widgets/app_drawer_widget.dart';
import 'package:frontend_flutter/widgets/cart_item.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      drawer: const AppDrawerWidget(),
      body: Obx(() {
        if (productController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return SingleChildScrollView(
          child: Center(
            child: Column(children: [
              Container(
                margin: EdgeInsets.only(
                  top: 16,
                ),
                child: Text(
                  "Bem vindo a página de Produtos",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              CartItem(
                imagem:
                    "https://i.kym-cdn.com/entries/icons/original/000/034/854/man.jpg",
                nome: "Teste",
                preco: 350.25,
                onAddCart: () => debugPrint("Eu vo vê e te aviso"),
              )
            ]),
          ),
        );
      }),
    );
  }
}
