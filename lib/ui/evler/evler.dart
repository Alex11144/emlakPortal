import 'package:database_trial/domain/api_clients/api_client.dart';
import 'package:database_trial/domain/api_clients/api_verif_client.dart';
import 'package:database_trial/ui/evler/appbar/son_elanlar.dart';
import 'package:database_trial/ui/evler/elanlarList/elanlar_list.dart';
import 'package:database_trial/ui/evler/son%20elanar/neticeler-widget.dart';
import 'package:flutter/material.dart';

var favorite = [];

class Evler extends ChangeNotifier {
  final apiClient = ApiClient();
  // final authService = AuthService();

  final apiVerificationClient = ApiVerificationClient();
  var _posts = <dynamic>[];
  List<dynamic> get posts => _posts;
  var count = 0;
  int counter = 0;
  var Map = {};
  // var _favorite = <dynamic>[];
  // List<dynamic> get favorite => _favorite;
  Future<void> reloadPosts() async {
    try {
      final posts = await apiClient.getHouses();
      // final post = post1['announcesDto'];
      apiClient.page++;
      print(apiClient.page);
      _posts += posts;
      notifyListeners();
    } catch (e) {}
  }

  Future<void> getHouses() async {
    try {
      favorite = await apiVerificationClient.getHouses();
      notifyListeners();
    } catch (e) {
      print('token expired');
    }
  }

  // Future<void> tokenAndRefresh() async {
  //   await apiVerificationClient.tokenAndRefreshToken(
  //       phone: '+994553826064', code: '1950');
  // }

  Future<void> refreshToken() async {
    await apiVerificationClient.refreshTokens();
  }

  Future<void> getUser() async {
    Map = await apiVerificationClient.getUserDetails();
  }

  Future<void> postsCounter() async {
    final posts = await apiClient.getHousesCount();
    count = posts;
    notifyListeners();
  }

  // void favouritesOnTap(int index) {
  //   _favorite = !_favorite;
  //   if (favs.contains(_posts[index].id) == false) {
  //     favs.add(_posts[index].id);
  //   } else {
  //     favs.remove(_posts[index].id);
  //   }
  //   notifyListeners();
  // }

  // Future<void> favourites(id) async {
  //   final posts =
  //       await apiVerificationClient.saveAndRemoveFromWishlist(id, getToken());
  //   count = posts;
  //   notifyListeners();
  // }

  Evler() {
    postsCounter();
    reloadPosts();
    getHouses();
    getUser();
    // tokenAndRefresh();
    // refreshToken();
  }

  void elanOnTap(int index, context) {
    final int args = _posts[index].id;
    Navigator.of(context).pushNamed('/main_screen/details', arguments: args);
    counter = index;
    notifyListeners();
  }

  void secilmislerelanOnTap(int index, context) {
    final int args = favorite[index].id;
    Navigator.of(context).pushNamed('/main_screen/details', arguments: args);
    counter = index;
    notifyListeners();
  }

  Future<void> favouritesPostToDb(id) async {
    await ApiVerificationClient().saveAndRemoveFromWishlist(id);
    getHouses();
    notifyListeners();
  }
  // Future<void> logoutButton(BuildContext context) async {
  //   await authService.logout();
  //   Navigator.of(context).pushNamedAndRemoveUntil('/daxil', (_) => false);
  // }
}

class ElanlarWidget extends StatelessWidget {
  const ElanlarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   actions: [
      //     ElevatedButton(
      //         onPressed: () => ViewModel.logoutButton(context),
      //         child: Text('logout'))
      //   ],
      // ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 5, 16, 16),
          child: Column(
            children: const [
              Expanded(flex: 1, child: SonElanlar()),
              Expanded(flex: 1, child: NeticelerWidget()),
              Expanded(flex: 10, child: ElanlarList()),
            ],
          ),
        ),
      ),
    );
  }
}
