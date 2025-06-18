class NatProdDto {
  final String nome;
  final String descricao;
  final String categoria;
  final String imagem;
  final double preco;
  final String material;
  final String departamento;

  NatProdDto({
    required this.nome,
    required this.descricao,
    required this.categoria,
    required this.imagem,
    required this.preco,
    required this.material,
    required this.departamento,
  });

  factory NatProdDto.fromJson(Map<String, dynamic> json) {
    return NatProdDto(
      nome: json['nome'],
      descricao: json['descricao'],
      categoria: json['categoria'],
      imagem: json['imagem'],
      preco: (json['preco'] as num).toDouble(),
      material: json['material'],
      departamento: json['departamento'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'descricao': descricao,
      'categoria': categoria,
      'imagem': imagem,
      'preco': preco,
      'material': material,
      'departamento': departamento,
    };
  }
}
