import 'package:coffee_app/pages/caffe/detail_coffe.dart';
import 'package:coffee_app/pages/home.dart';
import 'package:coffee_app/pages/not_found_page.dart';
import 'package:coffee_app/provider/provider.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Color.fromARGB(255, 189, 152, 107),
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark
    ),
  );
  // runApp(const MyApp());
  runApp(
    DevicePreview(
      builder: (_) => const MyApp(),
      // enabled: !kReleaseMode,
      enabled: false,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UtilsProvider(),
        )
      ],
      child: MaterialApp(
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        title: 'Coffe App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (_) => const MyHomePage(),
          '/404': (_) => const NotFoundPage(),
          '/detail': (_) => const DetailCoffe(),
        },
      ),
    );
  }
}
