import 'package:apprestaurant/components/card_post_component.dart';
import 'package:apprestaurant/models/models.dart';
import 'package:flutter/material.dart';

class PostComponent extends StatelessWidget {
  final List<Post> posts;

  const PostComponent({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
            child: Text(
              "Friend's Activity",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
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