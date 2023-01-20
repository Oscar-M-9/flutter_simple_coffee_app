import 'package:coffee_app/pages/caffe/coffe_page.dart';
import 'package:coffee_app/pages/not_found_page.dart';
import 'package:coffee_app/pages/sandwich/sandwich_page.dart';
import 'package:coffee_app/pages/snacks/snacks_page.dart';
import 'package:flutter/material.dart';

class UtilsProvider extends ChangeNotifier {
  
  int indexCoffe = 0;

  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;
  set selectedIndex(int value){
    _selectedIndex = value;
    notifyListeners();
  }

  int _tamanioTaza = 1;

  int get tamanioTaza => _tamanioTaza;
  set tamanioTaza(int value){
    _tamanioTaza = value;
    notifyListeners();
  }

  bool _isActiveMenu = false;

  bool get isActiveMenu => _isActiveMenu;

  void isActiveM(){
    _isActiveMenu = !_isActiveMenu;
    notifyListeners();
  }


  Widget toPage() {
    Widget i;
    switch (_selectedIndex) {
      case 0:
        i = const CoffePage();
        break;
      case 1:
        i = const SandwichPage();
        break;
      case 2:
        i = const SnacksPage();
        break;
      default:
        i = const NotFoundPage();
    }
    return i;
  }

}
