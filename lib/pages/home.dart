import 'package:coffee_app/models/list_coffe.dart';
import 'package:coffee_app/pages/info_user.dart';
import 'package:coffee_app/pages/list_buttons.dart';
import 'package:coffee_app/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final utilsProvider = Provider.of<UtilsProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InfoUser(size: size),
                        const SizedBox(
                          height: 20,
                        ),
                        ListButton(utilsProvider: utilsProvider)
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: LayoutBuilder(
                      builder:
                          (BuildContext context, BoxConstraints constraints) {
                        final height = constraints.maxHeight;
                        final width = constraints.maxWidth;
                        final size = width * 0.1;
                        final backgroundPosition = -height / 5;
                        return Stack(
                          children: [
                            Positioned(
                              bottom: backgroundPosition,
                              left: backgroundPosition,
                              right: backgroundPosition,
                              top: size / 2,
                              child: const DecoratedBox(
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 189, 152, 107),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                            Positioned(
                              top: MediaQuery.of(context).size.height * 0.055,
                              right: 0,
                              left: 0,
                              bottom: 0,
                              child: Center(
                                child: utilsProvider.toPage(),
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
