// import 'dart:convert';
//
// import 'package:http/http.dart' as http;
// import '../../model/resp_model.dart';
//
// // Future<MovieRespModel> getMovies() async {
// //   Map<String, String> qParams = {
// //     'category': 'movies',
// //     'language': 'kannada',
// //     'genre': 'all',
// //     'sort': 'voting',
// //   };
// //   // final uri = Uri.http('https://hoblist.com', '/api/movieList', qParams);
// //   final uri = Uri.http('https://hoblist.com/api/movieList',);
// //   final response = await http.post(uri);
// //   var data = json.decode(response.body.toString());
// //   if (response.statusCode == 200) {
// //     return data;
// //   }else{
// //     return data;
// //   }
// //
// // }
// Future<Movie> getMovies(String category,String language, String genre, String sort) async {
//   final response = await http.post(
//       Uri.parse('hoblist.com/api/movieList'),
//       headers: {
//         'Content-Type': 'application/json',
//       },
//       body: json.encode({"category": category,"language":language,"genre":genre,"sort":sort}));
//   var data = response.body;
//   if(response.body.isEmpty) {
//     return Movie.fromJson(jsonDecode(data));
//   }
//   return Movie.fromJson(jsonDecode(data));
// }
//
// final queryParameters = {
//   'param1': 'one',
//   'param2': 'two',
// };
// final uri =
// Uri.https('www.myurl.com', '/api/v1/test/${widget.pk}', queryParameters);
// final response = await http.get(uri, headers: {
// HttpHeaders.authorizationHeader: 'Token $token',
// HttpHeaders.contentTypeHeader: 'application/json',
// });