import 'package:database_trial/ui/axtaris/axtaris_list_widget.dart';
import 'package:database_trial/ui/secilmisler/papkalar.dart';
import 'package:flutter/material.dart';

class AxtarisBirlesmeWidget extends StatefulWidget {
  const AxtarisBirlesmeWidget({super.key});

  @override
  State<AxtarisBirlesmeWidget> createState() => _AxtarisBirlesmeWidgetState();
}

class _AxtarisBirlesmeWidgetState extends State<AxtarisBirlesmeWidget> {
  bool tapped1 = true;
  bool tapped2 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.white,
      //   title: Text('Axtarış'),
      // ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
          child: Column(
            children: [
              const Expanded(
                  flex: 1,
                  child: Text('Axtarış',
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500))),
              Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: tapped1
                                ? Border.all(width: 0)
                                : Border.all(width: 0.3, color: Colors.grey),
                          ),
                          width: 185,
                          height: 42,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                foregroundColor:
                                    tapped1 ? Colors.white : Colors.black,
                                backgroundColor: tapped1
                                    ? const Color.fromRGBO(34, 186, 104, 1)
                                    : Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              onPressed: () {
                                setState(() {});
                                tapped1 = true;
                                tapped2 = false;
                              },
                              child: const Text(
                                'SATILIR',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ))),
                      const SizedBox(
                        width: 8,
                      ),
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: tapped2
                                ? Border.all(width: 0)
                                : Border.all(width: 0.2, color: Colors.grey),
                          ),
                          width: 185,
                          height: 42,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                foregroundColor:
                                    tapped2 ? Colors.white : Colors.black,
                                backgroundColor: tapped2
                                    ? const Color.fromRGBO(34, 186, 104, 1)
                                    : Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              onPressed: () {
                                setState(() {});
                                tapped2 = true;
                                tapped1 = false;
                              },
                              child: const Text(
                                'KİRAYƏ',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ))),
                    ],
                  )),
              const Divider(),
              Expanded(
                  flex: 12,
                  child: tapped1
                      ? const AxtarisListWidget()
                      : const PapkalarWidget()),
            ],
          ),
        ),
      ),
    );
  }
}
