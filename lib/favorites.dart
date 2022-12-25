class Favorites {

  static final Favorites favorites = Favorites._internal();
  List<int> list = <int>[];

  factory Favorites() => favorites;

  Favorites._internal();

  addToFavorites(int id) {
    list.add(id);
  }

  removeFromFavorites(int id) {
    list.remove(id);
  }

  bool isInFavorites(int id) {
    for (int i in list) {
      if (i == id) {
        return true;
      }
    }
    return false;
  }

  int getListSize() {
    return list.length;
  }

}