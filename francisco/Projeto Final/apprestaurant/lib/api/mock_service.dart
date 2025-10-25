import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/models.dart';

class ExploreData {
  final List<Restaurant> restaurants;
  final List<FoodCategory> categories;
  final List<Post> friendPosts;

  ExploreData(this.restaurants, this.categories, this.friendPosts);
}

class MockService {
  // Endpoints atualizados - Opção 1
  final String restaurantsUrl = 'https://68f68cfa6b852b1d6f171151.mockapi.io/app-restaurant/restaurants';
  final String categoriesUrl = 'https://68f68cfa6b852b1d6f171151.mockapi.io/app-restaurant/categories';
  final String postsUrl = 'https://mocki.io/v1/08b9dad6-230d-42ff-a0cf-85377abcb6f2';

  Future<ExploreData> getExploreData() async {
    final restaurants = await getRestaurants();
    final categories = await getCategories();
    final friendPosts = await getFriendPosts();
    
    return ExploreData(restaurants, categories, friendPosts);
  }

  Future<List<Restaurant>> getRestaurants() async {
    try {
      final response = await http.get(Uri.parse(restaurantsUrl));
      
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => Restaurant.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load restaurants');
      }
    } catch (e) {
      print('Erro ao carregar restaurantes: $e');
      return _getMockRestaurants();
    }
  }

  Future<List<FoodCategory>> getCategories() async {
    try {
      final response = await http.get(Uri.parse(categoriesUrl));
      
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => FoodCategory.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      print('Erro ao carregar categorias: $e');
      return _getMockCategories();
    }
  }

  Future<List<Post>> getFriendPosts() async {
    try {
      final response = await http.get(Uri.parse(postsUrl));
      
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => Post.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load posts');
      }
    } catch (e) {
      print('Erro ao carregar posts: $e');
      return _getMockPosts();
    }
  }

  List<Restaurant> _getMockRestaurants() {
    return [
      Restaurant(
        id: '1',
        name: 'Café Grão Fino',
        address: 'Rua das Flores, 123',
        attributes: 'Cafeteria, Padaria, \$\$',
        imageUrl: 'https://images.unsplash.com/photo-1554118811-1e0d58224f24?w=400&h=300&fit=crop',
        imageCredits: 'Unsplash',
        distance: 2.5,
        rating: 4.5,
        items: [],
      ),
      Restaurant(
        id: '2',
        name: 'Bella Notte Trattoria',
        address: 'Av. Principal, 456',
        attributes: 'Italiana, Massa, \$\$\$',
        imageUrl: 'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?w=400&h=300&fit=crop',
        imageCredits: 'Unsplash',
        distance: 1.8,
        rating: 4.8,
        items: [],
      ),
      Restaurant(
        id: '3',
        name: 'Sakura Sushi',
        address: 'Rua do Comércio, 789',
        attributes: 'Japonês, Sushi, \$\$\$\$',
        imageUrl: 'https://images.unsplash.com/photo-1579584425555-c3ce17fd4351?w=400&h=300&fit=crop',
        imageCredits: 'Unsplash',
        distance: 3.2,
        rating: 4.6,
        items: [],
      ),
    ];
  }

  List<FoodCategory> _getMockCategories() {
    return [
      FoodCategory('Brasileira', 120, 'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?w=100&h=100&fit=crop'),
      FoodCategory('Hambúrgueres', 85, 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=100&h=100&fit=crop'),
      FoodCategory('Italiana', 95, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ca4b?w=100&h=100&fit=crop'),
      FoodCategory('Japonesa', 80, 'https://images.unsplash.com/photo-1579584425555-c3ce17fd4351?w=100&h=100&fit=crop'),
      FoodCategory('Sobremesa', 45, 'https://images.unsplash.com/photo-1551024506-0bccd828d307?w=100&h=100&fit=crop'),
      FoodCategory('Vegetariana', 60, 'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=100&h=100&fit=crop'),
    ];
  }

  List<Post> _getMockPosts() {
    return [
      Post(
        '1',
        'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=50&h=50&fit=crop&crop=face',
        'Acabei de almoçar no Bella Notte Trattoria, a carbonara estava divina! 🍝 Recomendo muito.',
        '10',
      ),
      Post(
        '2',
        'https://images.unsplash.com/photo-1494790108755-2616b612b786?w=50&h=50&fit=crop&crop=face',
        'Sushi 🍣 no Sakura hoje foi incrível! O sashimi estava perfeito.',
        '80',
      ),
      Post(
        '3',
        'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=50&h=50&fit=crop&crop=face',
        'Fiz uma salada deliciosa hoje! 🥗 Saudável e saborosa.',
        '20',
      ),
      Post(
        '4',
        'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=50&h=50&fit=crop&crop=face',
        'Hambúrguer artesanal no Café Grão Fino! 🍔 Melhor da cidade.',
        '45',
      ),
    ];
  }
}