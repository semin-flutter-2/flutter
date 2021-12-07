import 'package:flutter/material.dart';
import 'package:kakao_t_ui_exam/model/ad.dart';

class AdView extends StatelessWidget {
  final Ad ad;

  const AdView({
    Key key,
    this.ad,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: ad.color,
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
                      ad.title,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    Text(ad.text),
                  ],
                ),
              ),
              Image.network(
                ad.imageUrl,
                height: 100,
              )
            ],
          ),
        ),
      ),
    );
  }
}
