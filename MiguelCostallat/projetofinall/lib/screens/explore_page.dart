
import 'package:flutter/material.dart';
import 'package:projetofinall/api/mock_service.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: MockService().getExploreData(),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.done){
          final 
          final
          final

          return ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: [
              //Component Restaurante

              //Component Categorias

              //Component Posts
            ],
          );
        }else {
          return Center(child: CircularProgressIndicator(),);
        }
      }
    );
  }
}
