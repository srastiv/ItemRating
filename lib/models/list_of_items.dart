import 'package:flutter/material.dart';
import 'item_attributes.dart';
import '../login.dart';

class ListOfItems extends ChangeNotifier {
  List<Item> items = [
    Item(title: 'Jeans'),
    Item(title: 'Shirt'),
    Item(title: 'Kurta'),
    Item(title: 'Ethnic'),
    Item(title: 'Pajamas'),
    Item(title: 'Earrings'),
    Item(title: 'Shoes'),
    Item(title: 'Stilettos'),
    Item(title: 'Mobile'),
    Item(title: 'Desktop'),
  ];

  String? usernameInput;
  void notifyListeners();
}
