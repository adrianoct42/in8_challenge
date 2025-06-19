import 'package:frontend_flutter/models/intprod_dto.dart';
import 'package:frontend_flutter/models/natprod_dto.dart';

class UnifiedProductDto {
  final String imagem;
  final String nome;
  final double preco;

  UnifiedProductDto({
    required this.imagem,
    required this.nome,
    required this.preco,
  });

  factory UnifiedProductDto.fromAny(dynamic item) {
    if (item is UnifiedProductDto) {
      return item;
    } else if (item is NatProdDto) {
      return UnifiedProductDto(
        imagem: item.imagem,
        nome: item.nome,
        preco: item.preco,
      );
    } else if (item is IntProdDto) {
      return UnifiedProductDto(
        imagem: item.gallery.isNotEmpty ? item.gallery[0] : '',
        nome: item.name,
        preco: item.price,
      );
    } else if (item is Map<String, dynamic>) {
      final campoPreco = item['preco'] ?? item['price'];
      final campoConvertido = campoPreco is String
          ? double.tryParse(campoPreco)
          : (campoPreco is double ? campoPreco.toDouble() : 0);

      return UnifiedProductDto(
        imagem: item['imagem'] ?? item["gallery"][0],
        nome: item['nome'] ?? item['name'],
        preco: (campoConvertido ?? 0).toDouble(),
      );
    } else {
      throw Exception("Tipo de produto desconhecido! ${item.runtimeType}");
    }
  }
}
