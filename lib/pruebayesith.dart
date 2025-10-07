import 'package:flutter/material.dart';
import '../widgets/producto_card.dart';

class ProductosPage extends StatelessWidget {
  final String categoriaNombre;

  const ProductosPage({super.key, required this.categoriaNombre});

  final List<Map<String, dynamic>> productosSimulados = const [
    {
      'nombre': 'Manzanas Rojas', 
      'precio': '3.99', 
      'imagen': 'assets/carnes.png', 
      'calificacion': 4.8, 
    },
    {
      'nombre': 'Plátanos Maduros', 
      'precio': '2.49', 
      'imagen': 'assets/lacteos.png', 
      'calificacion': 4.6, 
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoriaNombre),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: const TextField(
              decoration: InputDecoration(
                hintText: "Buscar productos...",
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          
          // 2. GridView 
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: productosSimulados.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, 
                crossAxisSpacing: 5,
                mainAxisSpacing: 10,
                childAspectRatio: 0.65, 
              ),
              itemBuilder: (context, index) {
                final producto = productosSimulados[index];
                
                return ProductoCard(
                  nombre: producto['nombre']!,
                  imagen: producto['imagen'] as String,
                  precio: producto['precio'] as String,
                  calificacion: producto['calificacion'] as double, 
                  onAddToCart: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Simulación: Agregado ${producto['nombre']}')),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}