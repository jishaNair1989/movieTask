import 'package:flutter/material.dart';

import '../model/resp_model.dart';
import '../screens/home/dio_service.dart';

class HomeViewModel extends ChangeNotifier {
  List<MovieRespModel> homeDatas = [];
  bool isLoading = false;
  Future<void> getHomeData(context) async {
    isLoading = true;
    notifyListeners();

    List<MovieRespModel>? response =
    await DioService().getMovie(context);
    if (response != null) {

           homeDatas.addAll(response);

    } else {
      print('response is null');
    }
    isLoading = false;
    notifyListeners();
    //log(response.toString());
  }
}
