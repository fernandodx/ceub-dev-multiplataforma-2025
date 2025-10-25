import 'dart:convert';

import 'package:apprestaurant/models/models.dart';
import 'package:http/http.dart' as http;

class ExploreData {
  final List<Restaurant> restaurants;
  final List<FoodCategory> categories;
  final List<Post> friendPosts;

  ExploreData(this.restaurants, this.categories, this.friendPosts);
}

class MockService {
  final String _restaurantsUrl = "https://68f68cfa6b852b1d6f171151.mockapi.io/app-restaurant/restaurants";
  final String _categoriesUrl = "https://68f68cfa6b852b1d6f171151.mockapi.io/app-restaurant/categories";
  final String _postsUrl = "https://mocki.io/v1/08b9dad6-230d-42ff-a0cf-85377abcb6f2";

  Future<ExploreData> getExploreData() async {
    final List<Future> futures = [
      _getRestaurants(),
      _getCategories(),
      _getPosts(),
    ];
    
    final results = await Future.wait(futures);
    
    return ExploreData(
      results[0] as List<Restaurant>,
      results[1] as List<FoodCategory>,
      results[2] as List<Post>,
    );
  }

  Future<List<Restaurant>> _getRestaurants() async {
    final response = await http.get(Uri.parse(_restaurantsUrl));
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((json) => Restaurant.fromJson(json)).toList();
    } else {
      throw Exception("Falha ao carregar os restaurantes");
    }
  }

  Future<List<FoodCategory>> _getCategories() async {
    final response = await http.get(Uri.parse(_categoriesUrl));
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((json) => FoodCategory.fromJson(json)).toList();
    } else {
      throw Exception("Falha ao carregar as categorias");
    }
  }

  Future<List<Post>> _getPosts() async {
    final response = await http.get(Uri.parse(_postsUrl));
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((json) => Post.fromJson(json)).toList();
    } else {
      throw Exception("Falha ao carregar os posts");
    }
  }
}
