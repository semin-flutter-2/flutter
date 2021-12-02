import 'package:flutter/material.dart';

class Ad extends StatelessWidget {
  final String title;
  final Color color;

  const Ad({
    Key key,
    this.title,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    Text('기왕 늦은 거 편하게 택시타고 가자'),
                  ],
                ),
              ),
              Image.network(
                'https://item.kakaocdn.net/do/d84248170c2c52303db27306a00fb861effd194bae87d73dd00522794070855d',
                height: 100,
              )
            ],
          ),
        ),
      ),
    );
  }
}
