import '../../data/models/cart_model.dart';

class Cart {
  final int id;
  final int userId;
  final List<CartProduct> products;

  const Cart({required this.id, required this.userId, required this.products});
}
