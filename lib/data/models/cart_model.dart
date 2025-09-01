// Modelo para producto en el carrito
class CartProduct {
  final int productId;
  final int quantity;

  const CartProduct({
    required this.productId,
    required this.quantity,
  });
}

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
         .map((product) => CartProduct(
           productId: product['productId'],
           quantity: product['quantity'],
         ))
         .toList(),
     );
   }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'products': products.map((product) => {
        'productId': product.productId,
        'quantity': product.quantity,
      }).toList(),
    };
  }
}
