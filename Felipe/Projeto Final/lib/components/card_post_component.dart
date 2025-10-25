import 'package:apprestaurant/models/models.dart';
import 'package:flutter/material.dart';

class CardPostComponent extends StatefulWidget {
  final Post post;

  const CardPostComponent({required this.post, super.key});

  @override
  State<CardPostComponent> createState() => _CardPostComponentState();
}

class _CardPostComponentState extends State<CardPostComponent> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 2,
      color: const Color(0xFFFFF0F3),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cabeçalho com imagem circular e coração
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundImage: NetworkImage(widget.post.profileImageUrl),
                  onBackgroundImageError: (_, __) {},
                ),
                IconButton(
                  icon: Icon(
                    isLiked ? Icons.favorite : Icons.favorite_border_outlined,
                    color: Colors.red,
                    size: 28,
                  ),
                  onPressed: () {
                    setState(() {
                      isLiked = !isLiked;
                    });
                  },
                ),
              ],
            ),

            const SizedBox(height: 12),

            // Comentário
            Text(
              widget.post.comment,
              style: Theme.of(context).textTheme.bodyMedium,
            ),

            const SizedBox(height: 6),

            // Data do post
            Text(
              widget.post.timestamp,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
