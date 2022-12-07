import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_streaming_app/model/resp_model.dart';

import '../../controller/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Future <List<MovieRespModel>>? movieList;



  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<HomeViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),


      //body: TextButton(onPressed: () {getMovie(); }, child: Text('fetch data'),),
      body: Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(8.0),
      child: homeController.homeDatas.isEmpty ? Center(child: Text("No data")) : buildFutureBuilder(homeController),
    ),


    );
  }

  ListView buildFutureBuilder( homeController) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
            child: Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    radius: 22,
                    child: ClipOval(
                      child: Image.network(
                          homeController.result![index].poster ?? ''),
                    ),
                  ),

                ),
                ListTile(
                    leading: Text(
                      homeController.result![index].language.toString(),
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ))
              ],
            ),
          ),
        );
      },
      itemCount: homeController.result?.length,

    );
  }



}
