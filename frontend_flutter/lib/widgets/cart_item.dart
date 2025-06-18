import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final String nome;
  final double preco;

  const CartItem({
    super.key,
    required this.nome,
    required this.preco,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        decoration: BoxDecoration(
          color: Colors.teal.shade50,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: Colors.teal,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              nome,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'R\$ ${preco.toStringAsFixed(2)}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
