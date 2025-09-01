
import 'package:dartz/dartz.dart';
import 'package:fake_store_api_package/data/datasources/cart_api.dart';
import 'package:fake_store_api_package/data/datasources/product_api.dart';
import 'package:fake_store_api_package/data/datasources/user_api.dart';
import 'package:fake_store_api_package/domain/entities/cart.dart';
import 'package:fake_store_api_package/domain/entities/product.dart';
import 'package:fake_store_api_package/domain/entities/user.dart';
import 'package:fake_store_api_package/domain/mappers/cart_mapper.dart';
import 'package:fake_store_api_package/domain/mappers/product_mapper.dart';
import 'package:fake_store_api_package/domain/mappers/user_mapper.dart';

class FakeStoreApiPackage {
	final ProductApi _productApi = ProductApi();
	final UserApi _userApi = UserApi();
	final CartApi _cartApi = CartApi();

	// PRODUCTS
	Future<Either<String, List<Product>>> getProducts() async {
		final result = await _productApi.fetchProducts();
		return result.map((list) => list.map((model) => model.toEntity()).toList());
	}

	Future<Either<String, Product>> getProduct(int id) async {
		final result = await _productApi.fetchProduct(id);
		return result.map((model) => model.toEntity());
	}

	Future<Either<String, void>> createProduct(Product product) async {
		return await _productApi.createProduct(product.toModel());
	}

	Future<Either<String, void>> updateProduct(Product product) async {
		return await _productApi.updateProduct(product.toModel());
	}

	Future<Either<String, void>> deleteProduct(int id) async {
		return await _productApi.deleteProduct(id);
	}

	// USUARIOS
	Future<Either<String, List<User>>> getUsers() async {
		final result = await _userApi.fetchUsers();
		return result.map((list) => list.map((model) => model.toEntity()).toList());
	}

	Future<Either<String, User>> getUser(int id) async {
		final result = await _userApi.fetchUser(id);
		return result.map((model) => model.toEntity());
	}

	Future<Either<String, void>> createUser(User user) async {
		return await _userApi.createUser(user.toModel());
	}

	Future<Either<String, void>> updateUser(User user) async {
		return await _userApi.updateUser(user.toModel());
	}

	Future<Either<String, void>> deleteUser(int id) async {
		return await _userApi.deleteUser(id);
	}

	// CARTS
	Future<Either<String, List<Cart>>> getCarts() async {
		final result = await _cartApi.fetchCarts();
		return result.map((list) => list.map((model) => model.toEntity()).toList());
	}

	Future<Either<String, Cart>> getCart(int id) async {
		final result = await _cartApi.fetchCart(id);
		return result.map((model) => model.toEntity());
	}

	Future<Either<String, void>> createCart(Cart cart) async {
		return await _cartApi.createCart(cart.toModel());
	}

	Future<Either<String, void>> updateCart(Cart cart) async {
		return await _cartApi.updateCart(cart.toModel());
	}

	Future<Either<String, void>> deleteCart(int id) async {
		return await _cartApi.deleteCart(id);
	}
}
