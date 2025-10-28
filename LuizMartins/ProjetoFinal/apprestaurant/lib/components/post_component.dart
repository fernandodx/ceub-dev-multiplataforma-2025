import 'package:apprestaurant/components/card_post.dart';
// import 'package:apprestaurant/components/card_restaurant_component.dart'; // Não está sendo usado aqui
import 'package:apprestaurant/models/models.dart';
import 'package:flutter/material.dart';

class PostComponent extends StatelessWidget {
  final List<Post> posts;

  const PostComponent({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            child: Text(
              "Comentários",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: posts.length,
            itemBuilder: (context, index) {
              return CardPostComponent(post: posts[index]);
            },
          ),
        ],
      ),
    );
  }
}