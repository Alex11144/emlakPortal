import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PapkalarWidget extends StatefulWidget {
  const PapkalarWidget({super.key});

  @override
  State<PapkalarWidget> createState() => _PapkalarWidgetState();
}

class _PapkalarWidgetState extends State<PapkalarWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: 20,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: InkWell(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 0.3, color: Colors.grey),
                  borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '0774309724 - 8km bazar',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                    ),
                    Row(
                      children: [
                        const Text(
                          '( 850 elan )',
                          style: TextStyle(color: Colors.grey),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                                'assets/images/CaretCircleRight.svg'))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
