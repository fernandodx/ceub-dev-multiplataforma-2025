import 'dart:convert';

import 'package:apprestaurante/models/models.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ExploreData{
  final List<Restaurant> restaurantes;
  final List<FoodCategory> categories;
  final List<Post> FrienPosts;

  ExploreData(this.restaurantes, this.categories, this.FrienPosts);
}

class MockService{

  final String _baseUrl = "http://app-restaurant.wiremockapi.cloud";

  Future<ExploreData> getExploreData() async{
    List<Restaurant> restaurants = await _getRestaurants();
    List<FoodCategory> categories = []; // /categories
    List<Post> post = []; // /posts
    return ExploreData(restaurants, categories, post);
  }

  Future<List<Restaurant>> _getRestaurants()async{
    final response = await http.get(Uri.parse('$_baseUrl/restaurants'));
    if(response.statusCode==200){
      final List<dynamic>jsonList = jsonDecode(response.body);
      return jsonList.map((json) => Restaurant.fromJson(json)).toList();
    }else{
      throw Exception("falha ao carregar os restaurantes");
    }

  }

}
