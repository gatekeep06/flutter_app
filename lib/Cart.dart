class Cart {

  static final Cart cart = Cart._internal();
  List<int> list = <int>[];

  factory Cart() => cart;

  Cart._internal();

  addToCart(int id) {
    list.add(id);
  }

  removeFromCart(int id) {
    list.remove(id);
  }

  int getQuantityInCart(int id) {
    int quantity = 0;
    for (int i in list) {
      if (i == id) {
        quantity++;
      }
    }
    return quantity;
  }

  int getListSize() {
    return list.length;
  }

}