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
  final String _baseUrl = "https://68f68cfa6b852b1d6f171151.mockapi.io/app-restaurant";

  Future<ExploreData> getExploreData() async {
    List<Restaurant> restaurants = await _getRestaurants();
    //TODO Criar método getCategories para consultar do endpoint
    List<FoodCategory> categories = await _getCategories();
    //TODO Criar método getPost para consultar do endpoint
    List<Post> posts = await _getPosts();
    return ExploreData(restaurants, categories, posts);
  }

  Future<List<Restaurant>> _getRestaurants() async {
    final response = await http.get(Uri.parse('$_baseUrl/restaurants'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((json) => Restaurant.fromJson(json)).toList();
    } else {
      throw Exception("Falha ai carregar os restaurantes");
    }
  }

  Future<List<FoodCategory>> _getCategories() async {
    final response = await http.get(Uri.parse('$_baseUrl/categories'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((json) => FoodCategory.fromJson(json)).toList();
    } else {
      throw Exception("Falha ai carregar as categorias");
    }
  }

  Future<List<Post>> _getPosts() async {
    final response = await http.get(Uri.parse('https://mocki.io/v1/08b9dad6-230d-42ff-a0cf-85377abcb6f2'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((json) => Post.fromJson(json)).toList();
    } else {
      throw Exception("Falha ai carregar os posts");
    }
  }
}
