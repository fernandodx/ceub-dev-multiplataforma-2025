import 'package:apprestaurant/components/card_post_component.dart';
import 'package:apprestaurant/models/models.dart';
import 'package:flutter/material.dart';

class PostComponent extends StatelessWidget {
  final List<Post> posts;

  const PostComponent({required this.posts});

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
              "Atividades de Amigos",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 230,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return CardPostComponent(post: posts[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
