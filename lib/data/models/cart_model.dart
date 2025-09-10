import 'package:fake_store_api_package/domain/entities/cart_product.dart';

class CartItemModel {
  final int id;
  final int userId;
  final List<CartProduct> products;

  const CartItemModel({
    required this.id,
    required this.userId,
    required this.products,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      id: json['id'],
      userId: json['userId'],
      products: (json['products'] as List)
          .map(
            (product) => CartProduct(
              productId: product['productId'],
              quantity: product['quantity'],
            ),
          )
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'products': products
          .map(
            (product) => {
              'productId': product.productId,
              'quantity': product.quantity,
            },
          )
          .toList(),
    };
  }
}
