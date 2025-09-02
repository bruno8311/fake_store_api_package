
import 'package:fake_store_api_package/fake_store_api_package.dart';
import 'package:fake_store_api_package/domain/entities/product.dart';
import 'package:flutter/material.dart';
import 'package:example/presentation/screens/home_screen.dart';

void main() async {
  // Ejemplo de uso directo del paquete, obteniendo productos de la Fake Store Api
  final api = FakeStoreApiPackage();
  final result = await api.getProducts();
  result.fold(
    (error) => print('Error: $error'), // Manejo de errores
    (products) => products.forEach((Product p) => print(p.title)), // Visualización de productos en consola
  );

  // Para la visualización de la lista de productos, ejecutar la app normalmente
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Listado de Tarjetas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const HomeScreen(),
    );
  }
}