import 'package:coffee_app/models/list_coffe.dart';
import 'package:coffee_app/utils/my_colors.dart';
import 'package:coffee_app/provider/provider.dart';
import 'package:coffee_app/utils/tamanio_taza.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailCoffe extends StatelessWidget {
  const DetailCoffe({super.key});

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    final utilProvider = Provider.of<UtilsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                listCoffe[utilProvider.indexCoffe].name,
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w500,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ...List.generate(
                      navsTamanio.length,
                      (index) => MaterialButton(
                        onPressed: () {
                          if (utilProvider.tamanioTaza != index) {
                            utilProvider.tamanioTaza = index;
                          }
                        },
                        elevation: 0,
                        highlightElevation: 0,
                        padding: const EdgeInsets.all(15),
                        shape: const CircleBorder(
                          side: BorderSide(
                            color: MyColor.primary,
                            width: 1.5,
                          ),
                        ),
                        color: (utilProvider.tamanioTaza == index)
                            ? MyColor.primary
                            : null,
                        child: Text(
                          navsTamanio[index].size,
                          style: const TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Hero(
                      tag:
                          '${listCoffe[utilProvider.indexCoffe].name}_${listCoffe[utilProvider.indexCoffe]}',
                      child: LayoutBuilder(builder:
                          (BuildContext context, BoxConstraints constraints) {
                        return SizedBox(
                          width: constraints.maxWidth,
                          height: constraints.maxHeight,
                          child: Image.asset(
                            fit: BoxFit.scaleDown,
                            listCoffe[utilProvider.indexCoffe].asset,
                            scale: 1.5,
                            width: constraints.maxWidth,
                            height: constraints.maxHeight,
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 120,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'S/. ${listCoffe[utilProvider.indexCoffe].price.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                MaterialButton(
                  elevation: 0,
                  onPressed: () => null,
                  color: const Color.fromARGB(255, 133, 255, 196),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'Añadir al Carrito',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TamanioTazaButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final Color color;

  const TamanioTazaButton({
    Key? key,
    required this.text,
    this.onPressed,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      highlightElevation: 0,
      onPressed: onPressed,
      color: color,
      padding: const EdgeInsets.all(15),
      shape: const CircleBorder(
          side: BorderSide(
        color: MyColor.primary,
        width: 1.5,
      )),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 22.0,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
