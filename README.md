# Fake Store API Package

Paquete Flutter/Dart para interactuar fácilmente con la Fake Store API. Permite operaciones CRUD sobre productos, usuarios y carritos, procesando los datos obtenidos de la API.

## Getting started

fake_store_api_package: 0.0.6

## Usage


Importa el paquete y la entidad de dominio que necesites (por ejemplo, `Product`, `Cart` o `User`).
Puedes importar los tipos según lo que necesites trabajar (en este ejemplo se importa la entidad Product).
Se puede ver el uso correcto en la pestaña del example.

```dart
import 'package:fake_store_api_package/fake_store_api_package.dart';
import 'package:fake_store_api_package/domain/entities/product.dart';

void main() async {
	final FakeStoreApiPackage apifakeStoreApi = FakeStoreApiPackage();
	final result = await apifakeStoreApi.getProducts();
	result.fold(
		(error) => print('Error: $error'),
		(products) => products.forEach((Product p) => print(p.title)),
	);
}
```

## Pasos para ejectutar el ejemplo en Flutter:

El paquete incluye una carpeta `example` con una aplicación Flutter lista para usar:

1. Ve a la carpeta `example`:
	```bash
	cd example
	```
2. Instala las dependencias:
	```bash
	flutter pub get
	```
3. Ejecuta la aplicación:
	```bash
	flutter run
	```

La pantalla principal muestra la lectura de la Fake Store API y la visualización de los productos obtenidos.

## Available methods

- Products: `getProducts`, `getProduct`, `createProduct`, `updateProduct`, `deleteProduct`
- Users: `getUsers`, `getUser`, `createUser`, `updateUser`, `deleteUser`
- Carts: `getCarts`, `getCart`, `createCart`, `updateCart`, `deleteCart`


## What can your package do?

- Realizar operaciones CRUD (crear, leer, actualizar, eliminar) sobre productos, usuarios y carritos usando la Fake Store API.
- Procesar y mapear los datos obtenidos de la API.
- Ejemplo Flutter incluido para mostrar cómo listar productos y visualizar los datos en pantalla.
- Maneja los errores en caso de que las solicitudes a la API fallen, devolviendo un string con el codigo del error.

## Tipos de datos y manejo de errores

Los métodos principales del paquete devuelven:

- Una lista o instancia de los modelos `Product`, `Cart` o `User` según la operación realizada.
- En caso de error de la api, devuelven un `String` con la descripción del error.

Ejemplo de uso y manejo de error:

```dart
final result = await apifakeStoreApi.getProducts();
result.fold(
	(error) => print('Error: $error'), // Si ocurre un error, se recibe un String
	(products) => products.forEach((Product p) => print(p.title)), // Si es exitoso, se recibe una lista de Product
);
```

Puedes aplicar la misma lógica para los métodos de carritos y usuarios.

