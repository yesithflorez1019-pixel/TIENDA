import 'package:flutter/material.dart';

class ProductoCard extends StatelessWidget {
  final String nombre;
  final String imagen;
  final String precio;
  final double calificacion; 
  final VoidCallback onAddToCart; 

  const ProductoCard({
    super.key,
    required this.nombre,
    required this.imagen,
    required this.precio,
    required this.calificacion,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0), 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Área de la Imagen (Ocupa el espacio superior)
            Expanded(
              child: ClipRRect( 
                borderRadius: BorderRadius.circular(10), 
                child: Image.asset(
                  imagen,
                  width: double.infinity, 
                  fit: BoxFit.cover, 
                ),
              ),
            ),
            const SizedBox(height: 8),

            // 2. Nombre del producto
            Tooltip(
              message: nombre,
              child: Text(
                nombre,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 4),

            // 3. Calificación (Estrellas)
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 16),
                const SizedBox(width: 4),
                Text(
                  calificacion.toStringAsFixed(1),
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // 4. Precio y botón '+'
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$$precio",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                // Botón para agregar al carrito
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.add, color: Colors.white, size: 20),
                    onPressed: onAddToCart,
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}