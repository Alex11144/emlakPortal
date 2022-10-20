import 'package:database_trial/ui/bottomNavigationBar/bottom_navigation_bar.dart';
import 'package:database_trial/ui/bottomNavigationBar/cupertino_tab_scaffold.dart';
import 'package:database_trial/ui/deatils_screens/details_images/details_images.dart';
import 'package:database_trial/ui/deatils_screens/details_screen.dart';
import 'package:database_trial/ui/evler/evler.dart';
import 'package:database_trial/ui/profile/daxil_ol/code_screen.dart';
import 'package:database_trial/ui/profile/daxil_ol/daxil_ol.dart';
import 'package:database_trial/ui/profile/daxil_ol/hesab_screen.dart';
import 'package:database_trial/ui/secure_storage/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => Evler()),
    ChangeNotifierProvider(create: (_) => Security()),
    // ChangeNotifierProvider(create: (_) => AuthModel()),

    // ChangeNotifierProvider(create: (_) => DetailsChangeNotifier())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ApiVerificationClient().validateNumber();
    // ApiClient().getDetailsImages();
    return MaterialApp(
      // color: Colors.white,
      title: 'Flutter Demo',
      theme: ThemeData(
        // fontFamily: 'San Francisco',
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/main_screen': (context) => const MainScreenWidget(),
        '/verification': (context) => const CodeScreen(),
        '/registration': (context) => const DaxilWidget(),
        '/hesab': (context) => const HesabScreenWidget(),
        '/main_screen/details': (context) {
          final arguments = ModalRoute.of(context)?.settings.arguments;
          if (arguments is int) {
            return DetailsScreenWidget(
              id: arguments,
            );
          } else {
            return const Text(
              'data',
              style: TextStyle(fontSize: 40),
            );
          }
        },
        '/main_screen/details/details_images': (context) {
          final arguments = ModalRoute.of(context)?.settings.arguments;

          if (arguments is List) {
            return DetailedImages(
              images: arguments,
            );
          } else {
            return const Text(
              'data',
              style: TextStyle(fontSize: 40),
            );
          }
        }
      },
      // initialRoute: '/main_screen',
      home: const CupertinoTabWidget(),
    );
  }
}
