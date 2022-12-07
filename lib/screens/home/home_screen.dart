import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<HomeProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => const AlertDialog(
                          title:
                              Text('Company: Geeksynergy Technologies Pvt Ltd'),
                          content: Text('Address: Sanjayanagar, Bengaluru-56\n'
                              'Phone: XXXXXXXXX09\n'
                              'Email: XXXXXX@gmail.com\n'),
                        ));
              },
              icon: Icon(Icons.menu),
            ),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: pro.datas.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
          child: Column(
            children: [
              Row(children: [
                Column(
                  children: [
                    const Icon(
                      Icons.arrow_drop_up,
                      size: 25,
                    ),
                    Text(pro.datas[index].voting.toString()),
                    const Icon(
                      Icons.arrow_drop_down,
                      size: 25,
                    ),
                    const Text('Votes')
                  ],
                ),
                Container(
                  height: 100,
                  width: 100,
                  child: Image.network(pro.datas[index].poster.toString(),),
                ),
                Expanded(
                  child: SizedBox(
                    width: 100,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              pro.datas[index].title.toString(),
                              style: const TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            "Genre:${pro.datas[index].genre}",
                            style: const TextStyle(
                                fontSize: 10, fontWeight: FontWeight.normal),
                          ),
                          Text(
                            "Director:${pro.datas[index].director}",
                            style: const TextStyle(
                                fontSize: 10, fontWeight: FontWeight.normal),
                          ),
                          SingleChildScrollView(
                              child: Text(
                            "Starring:${pro.datas[index].stars}",
                            style: const TextStyle(
                                fontSize: 10, fontWeight: FontWeight.normal),
                          )),
                          Row(
                            children: [
                              Text("${pro.datas[index].pageViews} Views",
                                  style: const TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.blue)),
                              const VerticalDivider(
                                width: 10,
                                thickness: 1,
                                indent: 20,
                                endIndent: 0,
                                color: Colors.blue,
                              ),
                              Text("Voted by ${pro.datas[index].voting} people",
                                  style: const TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.blue))
                            ],
                          ),
                        ]),
                  ),
                ),
              ]),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: SizedBox(
                    width: 400,
                    height: 40,
                    child: ElevatedButton(
                        onPressed: () {}, child: Text("Watch Trailer"))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
