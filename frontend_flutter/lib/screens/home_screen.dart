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
  final TextEditingController searchController = TextEditingController();
  final RxString searchQuery = ''.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.tealAccent,
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

        // Unificação com um único tipo para visualização:
        var produtosFiltrados =
            produtos.map((p) => UnifiedProductDto.fromAny(p)).toList();

        // Filtro de busca, se algo for digitado:
        if (searchQuery.value.trim().isNotEmpty) {
          final query = searchQuery.value.trim().toLowerCase();
          produtosFiltrados = produtosFiltrados
              .where((p) => p.nome.toLowerCase().contains(query))
              .toList();
        }

        return Column(
          children: [
            SizedBox(
              width: 350,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                child: TextField(
                  controller: searchController,
                  onChanged: (value) => searchQuery.value = value,
                  decoration: InputDecoration(
                    hintText: 'Buscar produtos...',
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        30,
                      ),
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        searchController.clear();
                        searchQuery.value = '';
                      },
                    ),
                  ),
                ),
              ),
            ),
            Obx(
              () => Column(
                children: [
                  ToggleButtons(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.black45,
                    selectedColor: Colors.white,
                    fillColor: Colors.blue[400],
                    isSelected:
                        List.generate(3, (i) => selectedIndex.value == i),
                    onPressed: (index) => selectedIndex.value = index,
                    constraints: const BoxConstraints(
                      minHeight: 40,
                      minWidth: 100,
                    ),
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
                      onAddCart: () => {
                            productController.cartProducts.add(originalProduct),
                            Get.snackbar(
                              "Sucesso",
                              "Item adicionado ao carrinho!",
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor:
                                  Colors.greenAccent.withAlpha(180),
                              animationDuration: Duration(
                                seconds: 4,
                              ),
                            ),
                          });
                },
              ),
            ),
          ],
        );
      }),
    );
  }
}
