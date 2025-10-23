import 'dart:convert';
import 'package:app_restaurant/models/models.dart';
import 'package:http/http.dart' as http;

class ExploreData {
  final List<Restaurant> restaurants;
  final List<FoodCategory> categories;
  final List<Post> friendPosts;

  ExploreData(this.restaurants, this.categories, this.friendPosts);
}

class MockService {
  final String _baseUrlMain = "https://68f68cfa6b852b1d6f171151.mockapi.io/app-restaurant";
  final String _baseUrlPosts = "https://mocki.io/v1/08b9dad6-230d-42ff-a0cf-85377abcb6f2";

  Future<ExploreData> getExploreData() async {
    final restaurants = await _getRestaurants();
    final categories = await _getCategories();
    final posts = await _getPosts();
    return ExploreData(restaurants, categories, posts);
  }

  Future<List<Restaurant>> _getRestaurants() async {
    final response = await http.get(Uri.parse('$_baseUrlMain/restaurants'));
    if (response.statusCode == 200) {
      final List list = jsonDecode(response.body) as List;
      return list.map((e) => Restaurant.fromJson(e)).toList();
    }
    throw Exception("Falha ao carregar restaurantes (${response.statusCode})");
  }

  Future<List<FoodCategory>> _getCategories() async {
    final response = await http.get(Uri.parse('$_baseUrlMain/categories'));
    if (response.statusCode == 200) {
      final List list = jsonDecode(response.body) as List;
      return list.map((e) => FoodCategory.fromJson(e)).toList();
    }
    throw Exception("Falha ao carregar categorias (${response.statusCode})");
  }

  Future<List<Post>> _getPosts() async {
    final response = await http.get(Uri.parse(_baseUrlPosts));
    if (response.statusCode == 200) {
      final List list = jsonDecode(response.body) as List;
      return list.map((e) => Post.fromJson(e)).toList();
    }
    throw Exception("Falha ao carregar posts (${response.statusCode})");
  }
}
