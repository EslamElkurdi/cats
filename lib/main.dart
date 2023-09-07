

import 'package:cats/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'data/cat_repository_impl.dart';
import 'domain/repositories/cat_repo.dart';



void main() {
  final catRepository = CatRepositoryImpl(httpClient: http.Client());

  runApp(MyApp(catRepository: catRepository));
}

class MyApp extends StatelessWidget {
  final CatRepository catRepository;

  const MyApp({required this.catRepository});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // App configuration
      home: HomePage(catRepository: catRepository),
    );
  }
}


// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
//
// void main() {
//
//
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       // App configuration
//       home: MyHomePage(),
//     );
//   }
// }
//
// /////////////////////////////
// class CatDetailsPage extends StatelessWidget {
//   final String catId;
//
//   const CatDetailsPage({required this.catId});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Cat Details'),
//       ),
//       body: Center(
//         child: Text('Cat ID: $catId'),
//       ),
//     );
//   }
// }
//
// ////////////////////
//
//
// class CatImageGrid extends StatefulWidget {
//   const CatImageGrid({super.key});
//
//   @override
//   _CatImageGridState createState() => _CatImageGridState();
// }
//
// class _CatImageGridState extends State<CatImageGrid> {
//   List<String> catImageUrls = [];
//
//   @override
//   void initState() {
//     super.initState();
//     fetchCatImages();
//   }
//
//   Future<void> fetchCatImages() async {
//     final response = await http.get(Uri.parse(
//         'https://api.thecatapi.com/v1/images/search?limit=80&mime_types=&order=Random&size=small&page=3&sub_id=demo-ce06ee'));
//     if (response.statusCode == 200) {
//       final List<dynamic> data = json.decode(response.body);
//       final List<String> urls =
//       List<String>.from(data.map((item) => item['url']));
//       setState(() {
//         catImageUrls = urls;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 3,
//       ),
//       itemCount: catImageUrls.length,
//       itemBuilder: (context, index) {
//         final url = catImageUrls[index];
//         return GestureDetector(
//           onTap: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => CatDetailsPage(catId: index.toString()),
//               ),
//             );
//           },
//           child: Image.network(
//             url,
//             fit: BoxFit.cover,
//           ),
//         );
//       },
//     );
//   }
// }
//
// ////////////////////////////
//
// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 1,
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('Cat Images'),
//           bottom: const TabBar(
//             tabs: [
//               Tab(text: 'Cats'),
//             ],
//           ),
//         ),
//         body: TabBarView(
//           children: [
//             CatImageGrid(),
//           ],
//         ),
//       ),
//     );
//   }
// }