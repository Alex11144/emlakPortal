import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarSecilmisler extends StatelessWidget {
  const AppBarSecilmisler({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              padding: EdgeInsets.only(left: 22.0),
              child: Text(
                "Seçilmişlər",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            CircleAvatar(
              radius: 21,
              backgroundColor: const Color.fromRGBO(0, 80, 235, 0.1),
              child: IconButton(
                  // iconSize: 50,
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'assets/images/Folders.svg',
                    height: 50,
                    width: 50,
                  )),
            )
          ],
        )
      ],
    );
  }
}
