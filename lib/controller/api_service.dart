import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../model/resp_model.dart';


class HomeProvider extends ChangeNotifier {
  List<Result> datas = [];
  Future<void> getHomeData() async {
    Dio dio = Dio();
    try {
      Response response = await dio.post(
        'https://hoblist.com/api/movieList',
        data: {
          "category": "movies",
          "language": "kannada",
          "genre": "all",
          "sort": "voting"
        },
      );

      if (response.statusCode == 200) {
        response.data['result'].forEach((element) {
          datas.add(Result.fromJson(element));
        });
      }
    } on DioError {
      log("=============");
    }
  }
}