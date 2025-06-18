import 'package:flutter/material.dart';
import 'package:frontend_flutter/controller/product_controller.dart';
import 'package:frontend_flutter/models/unified_dto.dart';
import 'package:frontend_flutter/widgets/app_drawer_widget.dart';
import 'package:frontend_flutter/widgets/product_item.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final productController = Get.put(ProductController());
  final selectedIndex = 0.obs; // 0 = Todos, 1 = Nacional, 2 = Internacional

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      drawer: const AppDrawerWidget(),
      body: Obx(() {
        if (productController.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        // Tratamento dos dados de acordo com o filtro selecionado:
        final List<dynamic> produtos = selectedIndex.value == 0
            ? productController.produtosUnidos
            : selectedIndex.value == 1
                ? productController.produtosNacionais
                : productController.produtosInternacionais;

        final produtosFiltrados =
            produtos.map((p) => UnifiedProductDto.fromAny(p)).toList();

        return Column(
          children: [
            const SizedBox(height: 16),
            const Text(
              "Bem vindo à página dos Produtos",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 16),
            Obx(
              () => ToggleButtons(
                borderRadius: BorderRadius.circular(30),
                color: Colors.black45,
                selectedColor: Colors.white,
                fillColor: Colors.blue[400],
                isSelected:
                    List.generate(3, (i) => selectedIndex.value == i), // WTF
                onPressed: (index) => selectedIndex.value = index, // WTF2
                constraints: const BoxConstraints(minHeight: 40, minWidth: 100),
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text('Todos'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text('Nacional'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text('Internacional'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(height: 8),
                itemCount: produtosFiltrados.length,
                itemBuilder: (context, index) {
                  final product = produtosFiltrados[index];
                  final originalProduct = produtos[index];
                  return ProductItem(
                    imagem: product.imagem,
                    nome: product.nome,
                    preco: product.preco,
                    onAddCart: () =>
                        productController.cartProducts.add(originalProduct),
                  );
                },
              ),
            ),
          ],
        );
      }),
    );
  }
}
