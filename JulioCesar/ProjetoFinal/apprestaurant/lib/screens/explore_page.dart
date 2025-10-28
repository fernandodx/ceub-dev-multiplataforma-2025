import 'package:apprestaurant/api/mock_service.dart';
import 'package:apprestaurant/components/food_category_component.dart';
import 'package:apprestaurant/components/post_component.dart';
import 'package:apprestaurant/components/restaurant_component.dart';
import 'package:flutter/material.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {

  late Future<ExploreData> _exploreDataFuture;
  @override
  void initState() {
    super.initState();
    _exploreDataFuture = MockService().getExploreData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _exploreDataFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final restaurants = snapshot.data?.restaurants ?? [];
          final categories = snapshot.data?.categories ?? [];
          final posts = snapshot.data?.friendPosts ?? [];

          return ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: [
              //Component Restaurante
              RestaurantComponent(restaurants: restaurants),

              //Component Categorias
              FoodCategoryComponent(categories: categories),

              //Component Posts
              PostComponent(posts: posts)
            ],
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
