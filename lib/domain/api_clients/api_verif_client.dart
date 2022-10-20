import 'dart:convert';
import 'dart:io';

import 'package:database_trial/domain/entitites/getter/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApiVerificationClient {
  final _client = HttpClient();
  // String token = '';
  static const _host = 'http://23.88.126.140:88';
  // Future<String> auth({
  //   required String phone,
  //   required String code,
  // }) async {
  //   final validateToken = await validateNumber(
  //     phone: phone,
  //     code: code,
  //   );
  //   // final sessionId = await _makeSession(requestToekn: validateToken);
  //   return validateToken;
  // }

  Future<dynamic> validateNumber() async {
    final phone = await secureStorage.read(key: 'number');
    final code = await secureStorage.read(key: 'code');
    const url = 'http://23.88.126.140:88/api/Authenticate/verify';
    final parameters = <String, dynamic>{'phone': phone, 'code': code};
    final request = await _client.postUrl(Uri.parse(url));
    request.headers.contentType = ContentType.json;
    request.write(jsonEncode(parameters));
    final response = await request.close();
    if (response.headers['isValidUser'] == true) {
      final json1 = (await response
          .transform(utf8.decoder)
          .toList()
          .then((value) => value.join())
          .then((value) => json.decode(value))) as Map<String, dynamic>;
      String token = json1["token"] as String;
      print(token);
      // print(SharedPreferences.getInstance());
      await secureStorage.write(
          key: 'refreshToken', value: json1['refreshToken']);
      return token;
    } else {
      registerUser();
    }
  }

  final secureStorage = FlutterSecureStorage();

  Future<dynamic> saveAndRemoveFromWishlist(id) async {
    // final validateNumberOfPerson =
    //     await validateNumber(code: '1950', phone: '999999999999');
    const url =
        'http://23.88.126.140:88/api/Announce/add-or-remove-item-wishlist';
    final parameters = <String, dynamic>{
      'announceId': id.toString(),
    };
    final token = await secureStorage.read(key: 'token');
    final request = await _client.postUrl(Uri.parse(url));
    // request.headers.contentType = ContentType.json;

    request.headers.add('Content-Type', 'application/json');
    request.headers.add('Authorization', 'Bearer $token');
    print(request.headers);
    request.write(jsonEncode(parameters));
    final response = await request.close();

    return response;

    // else if (response.statusCode == 401) {
    //   await refreshTokens();
    // }
  }

  Future<dynamic> getHouses() async {
    final url = Uri.parse('http://23.88.126.140:88/api/Announce/wishlist');
    final token = await secureStorage.read(key: 'token');

    final request = await _client.getUrl(url);
    request.headers.add('Content-Type', 'application/json');
    request.headers.add('Authorization', 'Bearer $token');
    // request.write(jsonEncode(parameters));
    final response = await request.close();
    if (response.statusCode == 401) {
      refreshTokens();
    } else if (response.statusCode == 200) {
      final jsonStrings = await response.transform(utf8.decoder).toList();
      final jsonString = jsonStrings.join();
      final json = jsonDecode(jsonString) as List<dynamic>;

      final params = json
          .map((dynamic e) => Houses.fromJson(e as Map<String, dynamic>))
          .toList();
      return params;
    }
  }

  Future<dynamic> getUserDetails() async {
    final phone = await secureStorage.read(key: 'number');
    final code = await secureStorage.read(key: 'code');
    const url = 'http://23.88.126.140:88/api/Authenticate/verify';
    final parameters = <String, dynamic>{'phone': phone, 'code': code};
    final request = await _client.postUrl(Uri.parse(url));
    request.headers.contentType = ContentType.json;
    request.write(jsonEncode(parameters));
    final response = await request.close();
    final json1 = (await response
        .transform(utf8.decoder)
        .toList()
        .then((value) => value.join())
        .then((value) => json.decode(value))) as Map<String, dynamic>;
    // String token = json1["token"] as String;
    // print(SharedPreferences.getInstance());
    // await secureStorage.write(
    //     key: 'refreshToken', value: json1['refreshToken']);
    await secureStorage.write(key: 'userId', value: json1['userId']);
    return json1;
  }

  Future<dynamic> refreshTokens() async {
    final url =
        Uri.parse('http://23.88.126.140:88/api/Authenticate/refresh-token');
    final token = await secureStorage.read(key: 'token');
    final refreshToken = await secureStorage.read(key: 'refreshToken');

    final parameters = <String, dynamic>{
      'accessToken': token,
      'refreshToken': refreshToken
    };
    try {
      final request = await _client.postUrl(url);
      request.headers.contentType = ContentType.json;
      request.write(jsonEncode(parameters));
      final response = await request.close();
      final json1 = (await response
          .transform(utf8.decoder)
          .toList()
          .then((value) => value.join())
          .then((value) => json.decode(value)) as Map<String, dynamic>);

      await secureStorage.write(key: 'token', value: json1['accessToken']);
      await secureStorage.write(
          key: 'refreshToken', value: json1['refreshToken']);

      return json1;
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> registerUser() async {
    final userId = await secureStorage.read(key: 'userId');
    final name = await secureStorage.read(key: 'name');

    const url = 'http://23.88.126.140:88/api/Authenticate/register';
    final parameters = <String, dynamic>{
      'userId': userId,
      'name': name,
      'deviceToken': 'String'
    };
    final request = await _client.postUrl(Uri.parse(url));
    request.headers.contentType = ContentType.json;
    request.write(jsonEncode(parameters));
    final response = await request.close();
    final json1 = (await response
        .transform(utf8.decoder)
        .toList()
        .then((value) => value.join())
        .then((value) => json.decode(value))) as Map<String, dynamic>;
    // String token = json1["token"] as String;
    // print(token);
    // print(SharedPreferences.getInstance());
    await secureStorage.write(key: 'token', value: json1['token']);
    await secureStorage.write(
        key: 'refreshToken', value: json1['refreshToken']);
    print(await secureStorage.read(key: 'token'));
    return json1;
  }
}

extension HttpClientResponseJsonDecode1 on HttpClientResponse {
  Future<dynamic> jsonDecode1() async {
    return transform(utf8.decoder)
        .toList()
        .then((value) => value.join())
        .then((value) => json.decode(value));
  }
}
