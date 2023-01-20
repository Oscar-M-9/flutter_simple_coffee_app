import 'package:coffee_app/provider/provider.dart';
import 'package:coffee_app/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InfoUser extends StatelessWidget {
  const InfoUser({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    final utilProvider = Provider.of<UtilsProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: MyColor.primary,
                maxRadius: 35,
                minRadius: 25,
                child: Image.asset(
                  'assets/logo.png',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Hello Steve',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'you need a coffe?',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            // decoration: BoxDecoration(color: Colors.red),
            child: IconButton(
              onPressed: () {
                utilProvider.isActiveM();
              },
              icon: const Icon(
                Icons.shopping_cart_rounded,
                color: Colors.white,
              ),
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(MyColor.primary)
              ),
              iconSize: 30,
              padding: const EdgeInsets.all(10),
            ),
          )
        ],
      ),
    );
  }
}
