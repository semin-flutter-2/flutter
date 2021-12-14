import 'package:flutter/material.dart';
import 'package:kakao_t_ui_exam/model/menu.dart';
import 'package:kakao_t_ui_exam/ui/kakao_t/detail_screen.dart';

class MenuWidget extends StatelessWidget {
  final Menu menu;

  const MenuWidget({
    Key? key,
    required this.menu,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              menu: menu,
            ),
          ),
        );
      },
      child: Column(
        children: [
          Stack(
            children: [
              Hero(
                tag: menu.imageUrl,
                child: Image.network(
                  menu.imageUrl,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                right: 0,
                bottom: 5,
                child: Icon(
                  Icons.star_outlined,
                  color: menu.isFavorite ? Colors.yellow : Colors.black,
                ),
              ),
              // if (menu.isFavorite)
              //   Positioned(
              //     right: 0,
              //     bottom: 5,
              //     child: Icon(
              //       Icons.star_outlined,
              //       color: Colors.yellow,
              //     ),
              //   ),
              // if (!menu.isFavorite)
              //   Positioned(
              //     right: 0,
              //     bottom: 5,
              //     child: Icon(
              //       Icons.star_outlined,
              //       color: Colors.black,
              //     ),
              //   ),
            ],
          ),
          Text(
            menu.title,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
