import '../entities/cart.dart';
import '../../data/models/cart_model.dart';

extension CartMapper on Cart {
  CartItemModel toModel() => CartItemModel(
    id: id,
    userId: userId,
    products: products,
  );
}

extension CartItemModelMapper on CartItemModel {
  Cart toEntity() => Cart(
    id: id,
    userId: userId,
    products: products,
  );
}
