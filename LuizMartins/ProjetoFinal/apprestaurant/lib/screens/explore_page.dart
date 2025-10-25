import 'package:apprestaurant/api/mock_service.dart';
import 'package:apprestaurant/components/card_post.dart';
import 'package:apprestaurant/components/categories_component.dart';
import 'package:apprestaurant/components/post_component.dart';
import 'package:apprestaurant/components/restaurant_component.dart';
import 'package:flutter/material.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: MockService().getExplorerData(),
      builder: (context, snapshot) {

        if(snapshot.connectionState == ConnectionState.done) {

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
              CategoryComponent(categories: categories),
              //Component Posts
              PostComponent(posts: posts)
            ],
          );
        } else {
          return Center(child: CircularProgressIndicator(),);
        }
      }
    );
  }
}
