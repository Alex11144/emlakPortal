import 'dart:async';

import 'package:database_trial/domain/api_clients/api_verif_client.dart';
import 'package:database_trial/ui/bottomNavigationBar/cupertino_tab_scaffold.dart';
import 'package:database_trial/ui/evler/evler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Security extends ChangeNotifier {
  final secureStorage = const FlutterSecureStorage();
  // final auth = Provider.of<Evler>(context, listen: false);

  final _apiClient = ApiVerificationClient();
  final numberTextController = TextEditingController();
  final codeTextController = TextEditingController(text: '1950');
  final nameTextController = TextEditingController();

  // String? sessionId = null;

  Future<void> auth(BuildContext context) async {
    final code = codeTextController.text;
    final number = '+994' + numberTextController.text;

    await secureStorage.write(key: 'number', value: number);
    await secureStorage.write(key: 'code', value: code);

    try {
      String sessionId = await _apiClient.validateNumber();

      setSessionId(sessionId);
    } catch (e) {}
    // print(sessionId);

    if (await secureStorage.containsKey(key: 'number') == true) {
      (Navigator.of(context).pushNamed('hesab_screen'));
    } else {
      (Navigator.of(context).pushNamed('register_screen'));
    }
    _apiClient.getHouses();
    notifyListeners();
  }

  Future<void> register(BuildContext context) async {
    final name = nameTextController.text;

    await secureStorage.write(key: 'name', value: name);
    print(name);
    notifyListeners();
    (Navigator.of(context).pushNamed('hesab_screen'));
    _apiClient.getHouses();
  }

  Future<void> logout(context) async {
    await secureStorage.delete(key: 'token');
    favorite.clear();
    (Navigator.of(context).pushNamed('registration'));
    notifyListeners();
  }

  Future<String?> getSessionId() async {
    return await secureStorage.read(key: 'token');
  }

  Future<void> setSessionId(String value) async {
    await secureStorage.write(key: 'token', value: value);
  }
}
