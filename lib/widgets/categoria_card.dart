import 'package:flutter/material.dart';

class CategoriaCard extends StatelessWidget {
  final String nombre;
  final String imagen;
  final VoidCallback onTap;

  const CategoriaCard({
    super.key,
    required this.nombre,
    required this.imagen,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        leading: Image.asset(imagen, width: 50, height: 50, fit: BoxFit.cover),
        title: Text(nombre),
        trailing: const Icon(Icons.arrow_forward_ios, size: 18),
        onTap: onTap,
      ),
    );
  }
}
