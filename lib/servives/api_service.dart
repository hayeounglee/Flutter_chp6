import 'dart:convert';

import 'package:flutter_application_ch63/models/webtoon.dart';
import 'package:http/http.dart' as http;

class ApiService {
  List<WebtoonModel> webtoonInstances = [];
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = "today";

  static Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = [];
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        final instance = WebtoonModel.fromJson(webtoon);
        webtoonInstances.add(instance);
      }
      print(webtoonInstances);
      return webtoonInstances;
    }
    throw Error();
  }
}
