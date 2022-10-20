import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SonElanlar extends StatelessWidget {
  const SonElanlar({super.key});

  @override
  Widget build(BuildContext context) {
    // final evler = context.read<Evler>();

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              radius: 21,
              backgroundColor: Color.fromRGBO(235, 155, 0, 0.1),
              child: IconButton(
                  padding: EdgeInsets.all(0),
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
                "Nəticə",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              width: 80,
              height: 40,
              child: Material(
                borderRadius: BorderRadius.circular(30),
                color: const Color.fromRGBO(235, 0, 0, 0.1),
                child: TextButton(
                  style: TextButton.styleFrom(
                    shape: const StadiumBorder(),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        '+',
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromRGBO(235, 0, 0, 1),
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        "Add",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromRGBO(235, 0, 0, 1),
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
