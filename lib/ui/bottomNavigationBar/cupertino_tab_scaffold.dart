import 'package:database_trial/ui/axtaris/axtaris_birlesme.dart';
import 'package:database_trial/ui/deatils_screens/details_images/details_images.dart';
import 'package:database_trial/ui/deatils_screens/details_screen.dart';
import 'package:database_trial/ui/evler/evler.dart';
import 'package:database_trial/ui/profile/daxil_ol/code_screen.dart';
import 'package:database_trial/ui/profile/daxil_ol/daxil_ol.dart';
import 'package:database_trial/ui/profile/daxil_ol/hesab_screen.dart';
import 'package:database_trial/ui/profile/reegister/registration_page.dart';
import 'package:database_trial/ui/secilmisler/secilmisler_birlesme.dart';
import 'package:database_trial/ui/secure_storage/secure_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

final security = Security();

class CupertinoTabWidget extends StatefulWidget {
  const CupertinoTabWidget({Key? key}) : super(key: key);

  @override
  State<CupertinoTabWidget> createState() => _CupertinoTabWidgetState();
}

class _CupertinoTabWidgetState extends State<CupertinoTabWidget> {
  var navigatorKeyList = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>()
  ];
  int currentIndex = 0;
  var controller = CupertinoTabController(initialIndex: 0);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        controller: controller,
        tabBar: CupertinoTabBar(
            height: 70,
            backgroundColor: Colors.white,
            activeColor: Colors.blue,
            onTap: (index) {
              // final auth = Provider.of<Evler>(context, listen: false);
              if (index == 1) {
                setState(() {});
              }
              if (currentIndex == index) {
                // Navigate to the tab's root route
                navigatorKeyList[index].currentState?.popUntil((route) {
                  return route.isFirst;
                });
              }
              currentIndex = index;
            },
            items: [
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: SvgPicture.asset('assets/images/House1.svg'),
                ),
                label: 'Baş Səhifə',
              ),
              BottomNavigationBarItem(
                // backgroundColor: Colors.red,
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: SvgPicture.asset('assets/images/HeartStraight.svg'),
                ),
                label: 'Seçilmişlər',
              ),
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: CircleAvatar(
                        radius: 23,
                        backgroundColor: const Color.fromRGBO(34, 186, 104, 1),
                        child:
                            SvgPicture.asset('assets/images/MapTrifold.svg')),
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: SvgPicture.asset('assets/images/Union.svg'),
                  ),
                  label: 'Axtarış'),
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: SvgPicture.asset('assets/images/Profile.svg'),
                  ),
                  label: 'Profil'),
            ]),
        tabBuilder: ((BuildContext _, int index) {
          switch (index) {
            case 0:
              return CupertinoTabView(
                navigatorKey: navigatorKeyList[index],
                routes: {
                  '/': (context) => WillPopScope(
                        child: const ElanlarWidget(),
                        onWillPop: () => Future<bool>.value(true),
                      ),
                  '/main_screen/details': (context) {
                    final arguments =
                        ModalRoute.of(context)?.settings.arguments;
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
                    final arguments =
                        ModalRoute.of(context)?.settings.arguments;
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
                  },
                },
              );
            case 1:
              return CupertinoTabView(
                navigatorKey: navigatorKeyList[index],
                routes: {
                  '/': (context) => WillPopScope(
                        child: const BirlesmisSecilmelerWidget(),
                        onWillPop: () => Future<bool>.value(true),
                      ),
                  '/main_screen/details': (context) {
                    final arguments =
                        ModalRoute.of(context)?.settings.arguments;
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
                    final arguments =
                        ModalRoute.of(context)?.settings.arguments;
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
                  },
                },
              );
            case 2:
              return CupertinoTabView(
                navigatorKey: navigatorKeyList[index],
                routes: {
                  '/': (context) => WillPopScope(
                        child: const ElanlarWidget(),
                        onWillPop: () => Future<bool>.value(true),
                      ),
                  '/main_screen/details': (context) {
                    final arguments =
                        ModalRoute.of(context)?.settings.arguments;
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
                },
              );

            case 3:
              return CupertinoTabView(
                navigatorKey: navigatorKeyList[index],
                routes: {
                  '/': (context) => WillPopScope(
                        child: const AxtarisBirlesmeWidget(),
                        onWillPop: () => Future<bool>.value(true),
                      ),
                  '/main_screen/details': (context) {
                    final arguments =
                        ModalRoute.of(context)?.settings.arguments;
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
                },
              );
            case 4:
            default:
              return FutureBuilder(
                  future: security.getSessionId(),
                  builder: ((context, snapshot) {
                    if (snapshot.hasData) {
                      return CupertinoTabView(
                        navigatorKey: navigatorKeyList[index],
                        // routes: {
                        //   '/': (context) {
                        //     return WillPopScope(
                        //       child: const DaxilWidget(),
                        //       onWillPop: () => Future<bool>.value(true),
                        //     );
                        //   },
                        // },
                        onGenerateRoute: ((settings) {
                          Widget wid = const HesabScreenWidget();

                          switch (settings.name) {
                            case "verification":
                              wid = const CodeScreen();
                              break;
                            case "registration":
                              wid = const DaxilWidget();
                              break;

                            case "hesab_screen":
                              wid = const HesabScreenWidget();

                              break;
                            case "register_screen":
                              wid = const RegistrationWidget();

                              break;
                          }
                          if (wid != null) {
                            return navigateWithoutAnimation(settings, wid);
                          }
                          // Unknown route
                          return MaterialPageRoute(
                              builder: (_) => const HesabScreenWidget());
                        }),
                      );
                    } else {
                      return CupertinoTabView(
                        // builder: (context) => const HesabScreenWidget(),
                        onGenerateRoute: ((settings) {
                          Widget wid = const DaxilWidget();

                          switch (settings.name) {
                            case "verification":
                              wid = const CodeScreen();
                              break;
                            case "registration":
                              wid = const DaxilWidget();
                              break;

                            case "hesab_screen":
                              wid = const HesabScreenWidget();

                              break;
                            case "register_screen":
                              wid = const RegistrationWidget();

                              break;
                          }
                          if (wid != null) {
                            return navigateWithoutAnimation(settings, wid);
                          }
                          return MaterialPageRoute(
                              builder: (_) => const DaxilWidget());
                        }),
                      );
                    }
                  }));
          }
        }));
  }

  PageRouteBuilder<dynamic> navigateWithoutAnimation(
      RouteSettings settings, Widget wid) {
    return PageRouteBuilder(
        settings:
            settings, // Pass this to make popUntil(), pushNamedAndRemoveUntil(), works
        pageBuilder: (_, __, ___) => wid,
        transitionsBuilder: (_, a, __, c) =>
            FadeTransition(opacity: a, child: c));
  }
}
