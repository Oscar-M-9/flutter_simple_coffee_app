import 'package:coffee_app/utils/button_navs.dart';
import 'package:coffee_app/utils/my_colors.dart';
import 'package:flutter/material.dart';

import '../provider/provider.dart';

class ListButton extends StatelessWidget {
  const ListButton({
    Key? key,
    required this.utilsProvider,
  }) : super(key: key);

  final UtilsProvider utilsProvider;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Wrap(
        spacing: 20,
        alignment: WrapAlignment.center,
        children: [
          ...List.generate(
            navsButtons.length,
            (index) => MaterialButton(
              onPressed: () {
                if (utilsProvider.selectedIndex != index) {
                  utilsProvider.selectedIndex = index;
                }
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: const BorderSide(
                  color: Color.fromARGB(255, 189, 152, 107),
                  width: 1.5,
                ),
              ),
              elevation: 0,
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              highlightElevation: 0,
              color: (utilsProvider.selectedIndex == index) ? MyColor.primary: null,
              child: Text(
                navsButtons[index].title,
                style: TextStyle(
                  color: (utilsProvider.selectedIndex == index)
                      ? Colors.white
                      : Colors.black.withOpacity(.7),
                  fontSize: 15.0,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
