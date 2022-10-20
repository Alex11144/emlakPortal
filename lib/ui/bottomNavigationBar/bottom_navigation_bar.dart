import 'package:database_trial/ui/evler/evler.dart';
import 'package:database_trial/ui/profile/daxil_ol/daxil_ol.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int initialIndex = 0;
  final screens = [
    const ElanlarWidget(),
    const ElanlarWidget(),
    const ElanlarWidget(),
    const ElanlarWidget(),
    const DaxilWidget(),
  ];

  void SelectedTab(int index) {
    if (initialIndex == index) return;
    setState(() {
      initialIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 12,
        unselectedFontSize: 12,
        currentIndex: initialIndex,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        type: BottomNavigationBarType.fixed,
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
                    child: SvgPicture.asset('assets/images/MapTrifold.svg')),
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
        ],
        onTap: SelectedTab,
      ),
      body: IndexedStack(index: initialIndex, children: screens),
    );
  }
}


// AnimatedBottomNavigationBar(
//         bottomBarItems: [
//           BottomBarItemsModel(
//             icon: const Icon(
//               Icons.home,
//             ),
//             iconSelected: const Icon(
//               Icons.home,
//               color: AppColors.cherryRed,
//             ),
//             // title: example.Strings.home,
//             // dotColor: example.AppColors.cherryRed,
//             // onTap: () =>log('Home'),
//           ),
//           BottomBarItemsModel(
//             icon: Icon(
//               Icons.search,
//             ),
//             iconSelected: Icon(
//               Icons.search,
//               color: AppColors.cherryRed,
//             ),
//             // title: example.Strings.search,
//             // dotColor: example.AppColors.cherryRed,
//             // onTap: () =>log('Search'),
//           ),
//           BottomBarItemsModel(
//             icon: Icon(
//               Icons.person,
//             ),
//             iconSelected: Icon(
//               Icons.person,
//               color: AppColors.cherryRed,
//             ),
//             // title: example.Strings.person,
//             // dotColor: example.AppColors.cherryRed,
//             // onTap: () =>log('Person'),
//           ),
//           BottomBarItemsModel(
//             icon: Icon(
//               Icons.settings,
//             ),
//             iconSelected: Icon(
//               Icons.settings,
//               color: AppColors.cherryRed,
//             ),
//             // title: example.Strings.settings,
//             // dotColor: example.AppColors.cherryRed,
//             // onTap: () =>log('Settings'),
//           ),
//         ],
//         bottomBarCenterModel: BottomBarCenterModel(
//           centerBackgroundColor: Color.fromRGBO(34, 186, 104, 1),
//           centerIcon: const FloatingCenterButton(
//             child: Icon(
//               Icons.map_outlined,
//               color: AppColors.white,
//             ),
//           ),
//           centerIconChild: [
//             FloatingCenterButtonChild(
//               child: const Icon(
//                 Icons.home,
//                 color: AppColors.white,
//               ),
//               onTap: () {},
//             ),
//             FloatingCenterButtonChild(
//               child: const Icon(
//                 Icons.home,
//                 color: AppColors.white,
//               ),
//               onTap: () {},
//             ),
//             FloatingCenterButtonChild(
//               child: const Icon(
//                 Icons.home,
//                 color: AppColors.white,
//               ),
//               onTap: () {},
//             ),
//           ],
//         ),
//       ),