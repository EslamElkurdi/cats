// Import necessary packages and files

import 'package:flutter/material.dart';

import '../../domain/models/cat.dart';
import '../../domain/repositories/cat_repo.dart';

class HomePage extends StatelessWidget {
  final CatRepository catRepository;

  const HomePage({required this.catRepository});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Cat Images'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Cats'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CatImageGrid(catRepository: catRepository),
          ],
        ),
      ),
    );
  }
}

class CatImageGrid extends StatefulWidget {
  final CatRepository catRepository;

  const CatImageGrid({required this.catRepository});

  @override
  _CatImageGridState createState() => _CatImageGridState();
}

class _CatImageGridState extends State<CatImageGrid> {
  List<Cat> catImages = [];

  @override
  void initState() {
    super.initState();
    fetchCatImages();
  }

  Future<void> fetchCatImages() async {
    try {
      final List<Cat> cats = await widget.catRepository.getCatImages();
      setState(() {
        catImages = cats;
      });
    } catch (e) {
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemCount: catImages.length,
      itemBuilder: (context, index) {
        final url = catImages[index].url;
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CatDetailsPage(catId: index.toString()),
              ),
            );
          },
          child: Image.network(
            url,
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
// Widget build method remains the same
}

class CatDetailsPage extends StatelessWidget {
  final String catId;

  const CatDetailsPage({required this.catId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cat Details'),
      ),
      body: Center(
        child: Text('Cat ID: $catId'),
      ),
    );
  }
}