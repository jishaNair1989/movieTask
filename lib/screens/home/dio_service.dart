import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:video_streaming_app/model/resp_model.dart';
class DioService {
  Future<List<MovieRespModel>> getMovie(context) async {
    var dio = Dio();
    var response = await dio.post('https://hoblist.com/api/movieList',
        data: {
          'category': 'movies',
          'language': 'kannada',
          'genre': 'all',
          'sort': 'voting'
        });
    print(response.data.toString());
    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      final dataList = (response.data as List).map((e) {
        return MovieRespModel.fromJson(e);
      }).toList();
      return dataList;
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      print(response.statusCode);
      throw Exception('Failed to get Movie.');

    }
  }
}