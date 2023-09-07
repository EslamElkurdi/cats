import '../models/cat.dart';

abstract class CatRepository {
  Future<List<Cat>> getCatImages();
}