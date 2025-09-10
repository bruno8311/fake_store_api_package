import 'package:example/presentation/widgets/product_tile.dart';
import 'package:fake_store_api_package/domain/entities/product.dart';
import 'package:flutter/material.dart';
import 'package:fake_store_api_package/fake_store_api_package.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FakeStoreApiPackage apifakeStoreApi = FakeStoreApiPackage();
  List<Product> products = [];
  bool isLoading = true;
  String? error;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // Lectura de la Fake Store API (para obtener productos)
      final result = await apifakeStoreApi.getProducts();
      result.fold(
        (err) => setState(() {
          error = err;
          isLoading = false;
        }),
        (data) => setState(() {
          products = data;
          isLoading = false;
        }),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listado de Productos'),
        backgroundColor: Colors.blue.shade400,
        centerTitle: true,
      ),
      // Visualización de los datos obtenidos en pantalla
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, int index) {
          final product = products[index];
          return ProductTile(product: product, index: index);
        },
      ),
    );
  }
}
