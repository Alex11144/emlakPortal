import 'package:database_trial/ui/evler/evler.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NeticelerWidget extends StatelessWidget {
  const NeticelerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final evler = context.watch<Evler>().count;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Text(
              'Son Elanlar ',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            Text(
              '( ${'$evler elan'})',
              style: const TextStyle(color: Color.fromRGBO(51, 51, 51, 0.6)),
            )
          ],
        ),
        CircleAvatar(
            backgroundColor: const Color.fromRGBO(235, 0, 0, 0.1),
            child: IconButton(
                onPressed: () {},
                icon: Image.asset('assets/images/SlidersHorizontal.png'))),
      ],
    );
  }
}
