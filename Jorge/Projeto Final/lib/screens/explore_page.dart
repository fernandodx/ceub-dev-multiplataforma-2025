import 'package:app_restaurant/api/mock_service.dart';
import 'package:app_restaurant/components/restaurant_component.dart';
import 'package:app_restaurant/components/category_component.dart';
import 'package:app_restaurant/components/post_component.dart';
import 'package:flutter/material.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  late final Future<ExploreData> _future;

  @override
  void initState() {
    super.initState();
    _future = MockService().getExploreData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ExploreData>(
      future: _future,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(
              "Erro ao carregar dados.\n${snapshot.error}",
              textAlign: TextAlign.center,
            ),
          );
        }

        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        }

        final data = snapshot.data!;
        final restaurants = data.restaurants;
        final categories = data.categories;
        final posts = data.friendPosts;

        return RefreshIndicator(
          onRefresh: () async {
            setState(() {
              _future = MockService().getExploreData();
            });
          },
          child: ListView(
            children: [
              // Restaurantes (carrossel horizontal)
              RestaurantComponent(restaurants: restaurants),

              // Categorias (chips horizontais)
              CategoryComponent(
                categories: categories,
                onTap: (c) {
                  // Aqui você pode filtrar restaurantes por categoria, abrir uma página etc.
                  // print("Categoria selecionada: ${c.name}");
                },
              ),

              // Posts (lista vertical)
              PostComponent(posts: posts),
            ],
          ),
        );
      },
    );
  }
}
