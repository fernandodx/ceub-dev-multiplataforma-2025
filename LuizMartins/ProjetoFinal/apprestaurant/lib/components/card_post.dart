import 'package:apprestaurant/models/models.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CardPostComponent extends StatefulWidget {
  final Post post;

  CardPostComponent({required this.post});

  @override
  State<CardPostComponent> createState() => _CardPostComponentState();
}

class _CardPostComponentState extends State<CardPostComponent> {

  bool isLiked = false;

  void _toggleLike() {
    setState(() {
      isLiked = !isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(widget.post.profileImageUrl),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.post.comment,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Text(
                      '${widget.post.timestamp} minutos atrás.',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.grey[600]
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: _toggleLike,
                      icon: Icon(
                        isLiked
                            ? Icons.favorite
                            : Icons.favorite_border_outlined,
                      ),
                      iconSize: 18,
                      color: isLiked ? Colors.red : Colors.grey[600],
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}