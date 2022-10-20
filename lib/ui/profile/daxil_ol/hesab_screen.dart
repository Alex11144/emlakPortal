import 'package:database_trial/ui/evler/evler.dart';
import 'package:database_trial/ui/secure_storage/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class HesabScreenWidget extends StatelessWidget {
  const HesabScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final modelWatch = context.watch<Security>();
    final model = context.watch<Evler>().Map;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false, // Don't show the leading button
        titleSpacing: 0,

        backgroundColor: Colors.white,
        elevation: 0,
        // titleSpacing: 900,
        title: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 12, 16, 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 21,
                backgroundColor: const Color.fromRGBO(235, 155, 0, 0.1),
                child: IconButton(
                    padding: const EdgeInsets.all(0),
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'assets/images/bell_svg.svg',
                      width: 50,
                      height: 50,
                    )),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 120.0),
                child: Text(
                  'Profil',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SvgPicture.asset('assets/images/UserCircle.svg'),
                    Column(
                      children: [
                        Text(
                          model['userName'],
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 20),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text('(+994) ' +
                            modelWatch.numberTextController.text.toString()),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Column(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                    color: const Color.fromRGBO(
                                        238, 238, 238, 1))),
                            width: 345,
                            height: 48,
                            child: ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  backgroundColor:
                                      const Color.fromRGBO(255, 255, 255, 1),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                ),
                                icon:
                                    SvgPicture.asset('assets/images/Gear.svg'),
                                onPressed: () {},
                                label: const Text('Ayarlar',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500)))),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                  color:
                                      const Color.fromRGBO(238, 238, 238, 1))),
                          width: 345,
                          height: 48,
                          child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor:
                                    const Color.fromRGBO(255, 255, 255, 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                              ),
                              icon: SvgPicture.asset(
                                  'assets/images/HeartStraightLogin.svg'),
                              onPressed: () {},
                              label: const Text(
                                'Seçilmişlər',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              )),
                        )
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(8)),
                      width: MediaQuery.of(context).size.width,
                      height: 44,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor:
                                const Color.fromRGBO(238, 238, 238, 0.7),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          onPressed: () => modelWatch.logout(context),
                          child: const Text(
                            'Çıxış',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ))),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
