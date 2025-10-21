import 'package:apprestaurant/models/models.dart';
import 'package:flutter/material.dart';

class CardPostComponent extends StatelessWidget {
  final Post post;

  const CardPostComponent({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
      child: ListTile(
        leading: CircleAvatar(
          radius: 25,
          backgroundImage: NetworkImage(post.profileImageUrl),
          onBackgroundImageError: (exception, stackTrace) {},
        ),
        title: Text(
          post.comment,
          style: textTheme.bodyMedium?.copyWith(
            fontSize: 15,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Text(
            '${post.timestamp} mins ago',
            style: textTheme.bodySmall,
          ),
        ),
        onTap: () => print("Detalhar post"),
      ),
    );
  }
}