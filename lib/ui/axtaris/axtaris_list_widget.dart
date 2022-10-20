import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AxtarisListWidget extends StatelessWidget {
  const AxtarisListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Text('Şəhər :'),
            const Text('Bakı'),
            SvgPicture.asset('assets/images/CaretRight.svg')
          ],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: TextField(
            // controller: model.numberTextController,
            // maxLength: 12,
            decoration: InputDecoration(
                hintText: 'Rayon, metro, nişangah',
                border: const OutlineInputBorder(
                    //Outline border type for TextFeild
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(
                      color: Color.fromARGB(46, 158, 158, 158),
                      // width: 0.5,
                    )),
                // isDense: true,
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset('assets/images/CaretCircleRight.svg'),
                )
                // prefixIconConstraints:
                //     BoxConstraints(minWidth: 0, minHeight: 0),
                ),
          ),
        ),
      ],
    );
  }
}
