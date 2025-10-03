import 'package:flutter/material.dart';
import '../widgets/categoria_card.dart';
import 'productos_page.dart'; 

class CategoriasPage extends StatelessWidget {
  const CategoriasPage({super.key});

  final List<Map<String, String>> categoriasData = const [
    {'nombre': "Lácteos", 'imagen': "assets/lacteos.png"},
    {'nombre': "Frutas y verduras", 'imagen': "assets/frutas.png"},
    {'nombre': "Panadería", 'imagen': "assets/pan.png"},
    {'nombre': "Snacks", 'imagen': "assets/snacks.png"},
    {'nombre': "Carnes y proteínas", 'imagen': "assets/carnes.png"},
  ];

  void navigateToProducts(BuildContext context, String categoriaNombre) {
    Navigator.push( 
      context,
      MaterialPageRoute(
        builder: (context) => ProductosPage(categoriaNombre: categoriaNombre), 
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categorías"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: const TextField(
              decoration: InputDecoration(
                hintText: "Buscar...",
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),

          // Lista de categorías con scroll
          Expanded(
            child: ListView.builder( 
              itemCount: categoriasData.length,
              itemBuilder: (context, index) {
                final categoria = categoriasData[index];
                
                return CategoriaCard(
                  nombre: categoria['nombre']!,
                  imagen: categoria['imagen']!,
                  onTap: () {

                    navigateToProducts(context, categoria['nombre']!);
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
