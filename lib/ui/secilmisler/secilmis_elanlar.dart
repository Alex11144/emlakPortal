import 'package:database_trial/domain/api_clients/api_client.dart';
import 'package:database_trial/ui/evler/evler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SecilmisElanlarList extends StatefulWidget {
  const SecilmisElanlarList({super.key});
  @override
  State<SecilmisElanlarList> createState() => _SecilmisElanlarListState();
}

class _SecilmisElanlarListState extends State<SecilmisElanlarList> {
  final controller = ScrollController();
  // final evler = context.read<Evler>();
  final apiClient = ApiClient();

  // bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    // final  auth = Provider.of<Evler>(context, listen: false);

    // controller.addListener(() {
    //   if (controller.position.maxScrollExtent == controller.offset) {
    //     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //       final auth = Provider.of<Evler>(context, listen: false);
    //       auth.getHouses();
    //     });

    //     // setState(() {});
    //   }
    // });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  // List favs = [];

  Future refresh() async {
    await Future.delayed(const Duration(milliseconds: 1500));
    // controller.addListener(() {
    //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //     final auth = Provider.of<Evler>(context, listen: false);
    //     auth.reloadPosts();
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - 300) / 2;
    final double itemWidth = size.width / 2;
    // final favourites = context.watch<Evler>().favorite;
    final watch = context.watch<Evler>();

    return RefreshIndicator(
      displacement: 20,
      // edgeOffset: 100,
      onRefresh: refresh,
      child: CustomScrollView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          controller: controller,
          scrollDirection: Axis.vertical,
          slivers: [
            SliverGrid.count(
                childAspectRatio: (itemWidth / itemHeight),
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                // controller: ScrollController(keepScrollOffset: false),
                crossAxisCount: 2,
                children: List.generate(
                  favorite.length,
                  (index) {
                    // if (index < evler.length) {
                    final ev = favorite[index];
                    // if (ev.cover == null) return ev.cover;
                    var dateTime = DateTime.parse(ev.announceDate);
                    var formate1 =
                        "${dateTime.day}-${dateTime.month}-${dateTime.year}";
                    return Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 0.2, color: Colors.grey),
                          borderRadius: BorderRadius.circular(8)),
                      child: InkWell(
                        customBorder: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        onTap: () => watch.secilmislerelanOnTap(index, context),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Stack(
                              alignment: Alignment.topRight,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    // ignore: prefer_interpolation_to_compose_strings
                                    'https://d2jcoi69vojtfw.cloudfront.net/' +
                                        ev.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return const Text('unable to load image');
                                      // width: 300,
                                      // height: 200,
                                      // fit: BoxFit.contain);
                                    },
                                    width: MediaQuery.of(context).size.width,
                                    height: 125,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Material(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    color: Colors.transparent,
                                    child: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            watch.favouritesPostToDb(
                                                favorite[index].id);
                                          });
                                        },
                                        icon: favorite.contains(favorite[index])
                                            ? SvgPicture.asset(
                                                'assets/images/HeartStraightRed.svg')
                                            : SvgPicture.asset(
                                                'assets/images/heartIcon.svg')))
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${ev.price} AZN",
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    height: 7,
                                  ),
                                  Text(ev.address.toString(),
                                      style: const TextStyle(fontSize: 11)),
                                  const SizedBox(
                                    height: 7,
                                  ),
                                  // ignore: prefer_interpolation_to_compose_strings
                                  Text(
                                    '${'${ev.roomCount} otaqli - ' + ev.space} m2',
                                    style: const TextStyle(fontSize: 11),
                                  ),
                                  const SizedBox(
                                    height: 7,
                                  ),
                                  Text(
                                    'Baki, $formate1',
                                    style: const TextStyle(
                                        color: Color.fromRGBO(51, 51, 51, 0.6),
                                        fontSize: 11),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                    // }
                  },
                )),
            // const SliverToBoxAdapter(
            //   child: Center(
            //       child: Padding(
            //     padding: EdgeInsets.all(30.0),
            //     child: CircularProgressIndicator(
            //       strokeWidth: 4,
            //     ),
            //   )),
            // )
          ]),
    );
  }
}
