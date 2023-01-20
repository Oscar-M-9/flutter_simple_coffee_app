import 'package:coffee_app/models/list_coffe.dart';
import 'package:coffee_app/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CoffePage extends StatefulWidget {
  const CoffePage({super.key});

  @override
  State<CoffePage> createState() => _CoffePageState();
}

class _CoffePageState extends State<CoffePage> {
  final double _scaleFactor = 0.8;
  final double _height = 200;
  double _currentPage = 0.0;
  final _pageCoffeController = PageController(
    viewportFraction: 0.65,
  );

  void _coffeScrollListener() {
    setState(() {
      _currentPage = _pageCoffeController.page!;
    });
  }

  @override
  void initState() {
    _pageCoffeController.addListener((_coffeScrollListener));
    super.initState();
  }

  @override
  void dispose() {
    _pageCoffeController.removeListener((_coffeScrollListener));
    _pageCoffeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageCoffeController,
      scrollDirection: Axis.horizontal,
      itemCount: listCoffe.length,
      itemBuilder: (context, index) {
        Matrix4 matrix = Matrix4.identity();

        if (index == _currentPage.floor()) {
          var currScale = 1 - (_currentPage - index) * (1 - _scaleFactor);
          var currTrans = _height * (1 - currScale) / 2;
          matrix = Matrix4.diagonal3Values(1.0, currScale, 1.0)
            ..setTranslationRaw(0, currTrans, 0);
        } else if (index == _currentPage.floor() + 1) {
          var currScale =
              _scaleFactor + (_currentPage - index + 1) * (1 - _scaleFactor);
          var currTrans = _height * (1 - currScale) / 2;
          matrix = Matrix4.diagonal3Values(1.0, currScale, 1.0)
            ..setTranslationRaw(0, currTrans, 0);
        } else if (index == _currentPage.floor() - 1) {
          var currScale = 1 - (_currentPage - index) * (1 - _scaleFactor);
          var currTrans = _height * (1 - currScale) / 2;
          matrix = Matrix4.diagonal3Values(1.0, currScale, 1.0)
            ..setTranslationRaw(0, currTrans, 0);
        } else {
          var currScale = 0.8;
          matrix = Matrix4.diagonal3Values(1.0, currScale, 1.0)
            ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 0);
        }
        return Transform(
          alignment: Alignment.bottomCenter,
          transform: matrix,
          child: GestureDetector(
            onTap: () {
              Provider.of<UtilsProvider>(context, listen: false).indexCoffe =
                  index;
              Navigator.pushNamed(context, '/detail');
            },
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 2.4,
                  width: MediaQuery.of(context).size.width * 0.62,
                  padding: const EdgeInsets.all(10),
                  // decoration: BoxDecoration(color: Colors.redAccent),
                  child: Hero(
                    tag: '${listCoffe[index].name}_${listCoffe[index]}',
                    child: Image.asset(
                      listCoffe[index].asset,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
                Text(
                  listCoffe[index].name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
