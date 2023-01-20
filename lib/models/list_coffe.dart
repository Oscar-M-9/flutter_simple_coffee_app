class Coffee {
  final String asset;
  final String name;
  final double price;

  Coffee({
    required this.asset,
    required this.name,
    required this.price,
  });
}

List<Coffee> listCoffe = [
  Coffee(asset: 'assets/coffe/1.png', name: 'Caramel Macchiato', price: 20.00),
  Coffee(asset: 'assets/coffe/2.png', name: 'Caramel Cold Drink', price: 15.00),
  Coffee(asset: 'assets/coffe/3.png', name: 'Iced Coffe Mocha', price: 18.50),
  Coffee(asset: 'assets/coffe/4.png', name: 'Caramelized Pecan Latte', price: 10.99),
  Coffee(asset: 'assets/coffe/5.png', name: 'Toffee Nut Latte', price: 29.99),
  Coffee(asset: 'assets/coffe/6.png', name: 'Capuchino', price: 10.00),
  Coffee(asset: 'assets/coffe/7.png', name: 'Toffee Nut Iced Latte', price: 12.99),
  Coffee(asset: 'assets/coffe/8.png', name: 'Americano', price: 18.99),
  Coffee(asset: 'assets/coffe/9.png', name: 'Vietnamese-Style Iced Coffee', price: 16.89),
  Coffee(asset: 'assets/coffe/10.png', name: 'Black Tea Latte', price: 12.50),
  Coffee(asset: 'assets/coffe/11.png', name: 'Classic Irish Coffee', price: 19.00),
  Coffee(asset: 'assets/coffe/12.png', name: 'Toffee Nut Crunch Latte', price: 15.50),
];
