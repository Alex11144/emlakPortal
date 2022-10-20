import 'dart:convert';
import 'dart:io';
import 'package:database_trial/domain/entitites/details/detailsWidget.dart';
import 'package:database_trial/domain/entitites/getter/get.dart';

class ApiClient {
  final client = HttpClient();
  int page = 1;
  Future<dynamic> getHouses() async {
    final url = Uri.parse(
        'http://23.88.126.140:88/api/Announce/announces?AnnounceType=1&PageNumber=$page&PageSize=10');
    try {
      final request = await client.getUrl(url);

      final response = await request.close();
      final json = await response.jsonDecode();
      final json1 = json["announcesDto"];
      // final json2 = json["announcesCount"];
      final house = json1
          .map((dynamic e) => Houses.fromJson(e as Map<String, dynamic>))
          .toList();
      return house;
    } catch (e) {}
  }

  Future<dynamic> getHousesCount() async {
    final url = Uri.parse(
        'http://23.88.126.140:88/api/Announce/announces?AnnounceType=1&PageNumber=1&PageSize=10');
    final request = await client.getUrl(url);
    final response = await request.close();

    final json = await response.jsonDecode();
    final json1 = json["announcesCount"];

    return json1;
  }

  Future<dynamic> getDetailsImages(id) async {
    final url = Uri.parse(
        'http://23.88.126.140:88/api/Announce/announces/${id.toString()}');
    final request = await client.getUrl(url);
    final response = await request.close();

    final json = await response.jsonDecode();
    final json1 = json["logoImages"];
    final json2 = jsonDecode(json1);
    return json2;
  }

  Future<dynamic> getDetails(id) async {
    final url = Uri.parse(
        'http://23.88.126.140:88/api/Announce/announces/${id.toString()}');
    final request = await client.getUrl(url);
    final response = await request.close();

    final json = await response.jsonDecode();
    final fromJson = Details.fromJson(json);

    return fromJson;
  }
}

extension HttpClientResponseJsonDecode on HttpClientResponse {
  Future<dynamic> jsonDecode() async {
    return transform(utf8.decoder)
        .toList()
        .then((value) => value.join())
        .then((value) => json.decode(value));
  }
}
