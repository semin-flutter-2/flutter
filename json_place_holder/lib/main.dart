import 'package:flutter/material.dart';
import 'package:json_place_holder/data/data_source/remote/post_remote_data_source.dart';
import 'package:json_place_holder/data/repository/post_repository_impl.dart';
import 'package:json_place_holder/domain/use_case/get_post_with_even_id_use_case.dart';
import 'package:json_place_holder/presentation/home/home_screen.dart';
import 'package:json_place_holder/presentation/home/home_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) =>
              HomeViewModel(GetPostWithEvenIdUseCase(PostRepositoryImpl(PostRemoteDataSource()))),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
