# Fake Store API Package

Paquete Flutter/Dart para interactuar fácilmente con la Fake Store API. Permite operaciones CRUD sobre productos, usuarios y carritos, procesando los datos obtenidos de la API.


## Instalacion

1. Abre el archivo `pubspec.yaml` de tu proyecto.
2. Agrega la siguiente dependencia:

```yaml
dependencies:
	fake_store_api_package:
		git:
			url: https://github.com/bruno8311/fake_store_api_package.git
```

3. Guarda el archivo y ejecuta en la terminal:

```bash
flutter pub get
```

## Uso basico


Importa el paquete y utiliza la clase principal:

```dart
import 'package:fake_store_api_package/fake_store_api_package.dart';

void main() async {
	final FakeStoreApiPackage apifakeStoreApi = FakeStoreApiPackage();
	final result = await apifakeStoreApi.getProducts();
	result.fold(
		(error) => print('Error: $error'),
		(products) => products.forEach((p) => print(p.title)),
	);
}
```


## Flutter Example

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

## Metodos disponibles

- Products: `getProducts`, `getProduct`, `createProduct`, `updateProduct`, `deleteProduct`
- Users: `getUsers`, `getUser`, `createUser`, `updateUser`, `deleteUser`
- Carts: `getCarts`, `getCart`, `createCart`, `updateCart`, `deleteCart`

## License

MIT


## ¿Qué puede hacer tu paquete?

- Realizar operaciones CRUD (crear, leer, actualizar, eliminar) sobre productos, usuarios y carritos usando la Fake Store API.
- Procesar y mapear los datos obtenidos de la API.
- Ejemplo Flutter incluido para mostrar cómo listar productos y visualizar los datos en pantalla.
- Maneja los errores en caso de que las solicitudes a la API fallen, devolviendo un string con el codigo del error.

## Primeros pasos

TODO: Enumera los requisitos previos y proporciona o apunta a información sobre cómo empezar a usar el paquete.

## Uso

Dentro de la carpeta `/example` se muestra el uso del packete para listar los productos de la Fake Store Api.

