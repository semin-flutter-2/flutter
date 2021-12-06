import 'package:flutter/material.dart';
import 'package:kakao_t_ui_exam/model/ad.dart';
import 'package:kakao_t_ui_exam/model/menu.dart';

final List<Menu> fakeMenus =
    List.generate(7, (index) => Menu(
      title: '택시',
      imageUrl: 'https://w.namu.la/s/40de86374ddd74756b31d4694a7434ee9398baa51fa5ae72d28f2eeeafdadf0c475c55c58e29a684920e0d6a42602b339f8aaf6d19764b04405a0f8bee7f598d2922db9475579419aac4635d0a71fdb8a4b2343cb550e6ed93e13c1a05cede75',
    ));

final List<Ad> fakeAds = [
  Ad(
    title: '일어나 회사 가야지',
    text: '기왕 늦은거 편하게 택시타고 가자',
    color: Colors.green,
    imageUrl: 'https://item.kakaocdn.net/do/d84248170c2c52303db27306a00fb861effd194bae87d73dd00522794070855d',
  ),
  Ad(
    title: '일어나 회사 가야지2',
    text: '기왕 늦은거 편하게 택시타고 가자2',
    color: Colors.yellow,
    imageUrl: 'https://item.kakaocdn.net/do/d84248170c2c52303db27306a00fb861effd194bae87d73dd00522794070855d',
  ),
  Ad(
    title: '일어나 회사 가야지3',
    text: '기왕 늦은거 편하게 택시타고 가자3',
    color: Colors.red,
    imageUrl: 'https://item.kakaocdn.net/do/d84248170c2c52303db27306a00fb861effd194bae87d73dd00522794070855d',
  ),
];