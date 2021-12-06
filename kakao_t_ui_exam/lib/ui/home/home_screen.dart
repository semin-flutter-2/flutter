import 'package:flutter/material.dart';
import 'package:kakao_t_ui_exam/data/fake_data.dart';
import 'package:kakao_t_ui_exam/model/ad.dart';
import 'package:kakao_t_ui_exam/ui/home/components/ad_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          '카카오 T',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    final PageController controller = PageController(initialPage: 0);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          ..._buildMenu(),
          _buildAds(controller),
          _buildNotice(),
        ],
      ),
    );
  }

  List<Widget> _buildMenu() {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Image.network(
                'https://w.namu.la/s/40de86374ddd74756b31d4694a7434ee9398baa51fa5ae72d28f2eeeafdadf0c475c55c58e29a684920e0d6a42602b339f8aaf6d19764b04405a0f8bee7f598d2922db9475579419aac4635d0a71fdb8a4b2343cb550e6ed93e13c1a05cede75',
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 10),
              Text(
                '택시',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          Column(
            children: [
              Image.network(
                'https://w.namu.la/s/40de86374ddd74756b31d4694a7434ee9398baa51fa5ae72d28f2eeeafdadf0c475c55c58e29a684920e0d6a42602b339f8aaf6d19764b04405a0f8bee7f598d2922db9475579419aac4635d0a71fdb8a4b2343cb550e6ed93e13c1a05cede75',
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 10),
              Text(
                '택시',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          Column(
            children: [
              Image.network(
                'https://w.namu.la/s/40de86374ddd74756b31d4694a7434ee9398baa51fa5ae72d28f2eeeafdadf0c475c55c58e29a684920e0d6a42602b339f8aaf6d19764b04405a0f8bee7f598d2922db9475579419aac4635d0a71fdb8a4b2343cb550e6ed93e13c1a05cede75',
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 10),
              Text(
                '택시',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          Column(
            children: [
              Image.network(
                'https://w.namu.la/s/40de86374ddd74756b31d4694a7434ee9398baa51fa5ae72d28f2eeeafdadf0c475c55c58e29a684920e0d6a42602b339f8aaf6d19764b04405a0f8bee7f598d2922db9475579419aac4635d0a71fdb8a4b2343cb550e6ed93e13c1a05cede75',
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 10),
              Text(
                '택시',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ],
      ),
      SizedBox(
        height: 30,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Image.network(
                'https://w.namu.la/s/40de86374ddd74756b31d4694a7434ee9398baa51fa5ae72d28f2eeeafdadf0c475c55c58e29a684920e0d6a42602b339f8aaf6d19764b04405a0f8bee7f598d2922db9475579419aac4635d0a71fdb8a4b2343cb550e6ed93e13c1a05cede75',
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 10),
              Text(
                '택시',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          Column(
            children: [
              Image.network(
                'https://w.namu.la/s/40de86374ddd74756b31d4694a7434ee9398baa51fa5ae72d28f2eeeafdadf0c475c55c58e29a684920e0d6a42602b339f8aaf6d19764b04405a0f8bee7f598d2922db9475579419aac4635d0a71fdb8a4b2343cb550e6ed93e13c1a05cede75',
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 10),
              Text(
                '택시',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          Column(
            children: [
              Image.network(
                'https://w.namu.la/s/40de86374ddd74756b31d4694a7434ee9398baa51fa5ae72d28f2eeeafdadf0c475c55c58e29a684920e0d6a42602b339f8aaf6d19764b04405a0f8bee7f598d2922db9475579419aac4635d0a71fdb8a4b2343cb550e6ed93e13c1a05cede75',
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 10),
              Text(
                '택시',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          SizedBox(
            width: 80,
            height: 80,
          ),
        ],
      ),
    ];
  }

  Widget _buildAds(PageController controller) {
    return SizedBox(
          height: 150,
          child: PageView(
            scrollDirection: Axis.horizontal,
            controller: controller,
            children: fakeAds.map((Ad e) => AdView(ad: e)).toList(),
            // children: <Widget>[
            //   AdView(
            //     ad: fakeAds[0],
            //   ),
            //   AdView(
            //     ad: fakeAds[1],
            //   ),
            //   AdView(
            //     ad: fakeAds[2],
            //   ),
            // ],
          ),
        );
  }

  Widget _buildNotice() {
    return Expanded(
      child: ListView(
        children: List.generate(50, (index) => Text('공지 $index')),
      ),
    );
  }
}
