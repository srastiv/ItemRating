import 'package:flutter/material.dart';
import 'item_attributes.dart';

class ListOfItems extends ChangeNotifier {
  List<Item> items = [
    Item(title: 'Jeans', userRating: 0),
    Item(title: 'Shirt', userRating: 0),
    Item(title: 'Kurta', userRating: 0),
    Item(title: 'Ethnic', userRating: 0),
    Item(title: 'Pajamas', userRating: 0),
    Item(title: 'Earrings', userRating: 0),
    Item(
      title: 'Shoes',
      userRating: 0,
    ),
    Item(title: 'Stilettos', userRating: 0),
    Item(title: 'Mobile', userRating: 0),
    Item(title: 'Desktop', userRating: 0),
  ];

  String? usernameInput;

  getList() {
    return items;
  }

  @override
  void notifyListeners();
}
