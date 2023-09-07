import 'dart:convert';

import '../domain/models/cat.dart';
import 'package:http/http.dart' as http;

import '../domain/repositories/cat_repo.dart';

class CatRepositoryImpl implements CatRepository {
  final http.Client httpClient;

  CatRepositoryImpl({required this.httpClient});

  @override
  Future<List<Cat>> getCatImages() async {
    final response = await httpClient.get(Uri.parse(
        'https://api.thecatapi.com/v1/images/search?limit=80&mime_types=&order=Random&size=small&page=3&sub_id=demo-ce06ee'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      final List<Cat> cats = data.map((item) => Cat(
        id: item['id'],
        url: item['url'],
      )).toList();

      return cats;
    } else {
      throw Exception('Failed to fetch cat images');
    }
  }
}