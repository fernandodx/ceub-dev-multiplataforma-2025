// API service for restaurant data
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/models.dart';

class RestaurantApiService {
  static const String baseUrl = 'https://api.restaurant.com/v1';
  
  // Get all restaurants
  static Future<List<Restaurant>> getRestaurants() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/restaurants'),
        headers: {'Content-Type': 'application/json'},
      );
      
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => Restaurant.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load restaurants');
      }
    } catch (e) {
      throw Exception('Error fetching restaurants: $e');
    }
  }
  
  // Get restaurant by ID
  static Future<Restaurant> getRestaurantById(String id) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/restaurants/$id'),
        headers: {'Content-Type': 'application/json'},
      );
      
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        return Restaurant.fromJson(data);
      } else {
        throw Exception('Failed to load restaurant');
      }
    } catch (e) {
      throw Exception('Error fetching restaurant: $e');
    }
  }
  
  // Get food categories
  static Future<List<FoodCategory>> getFoodCategories() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/categories'),
        headers: {'Content-Type': 'application/json'},
      );
      
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => FoodCategory.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load food categories');
      }
    } catch (e) {
      throw Exception('Error fetching food categories: $e');
    }
  }
  
  // Get posts
  static Future<List<Post>> getPosts() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/posts'),
        headers: {'Content-Type': 'application/json'},
      );
      
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => Post.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load posts');
      }
    } catch (e) {
      throw Exception('Error fetching posts: $e');
    }
  }
}
