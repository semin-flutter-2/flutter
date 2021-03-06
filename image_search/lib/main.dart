import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:image_search/data/data_source/remote/picture_remote_data_source.dart';
import 'package:image_search/data/repository/picture_repository_impl.dart';
import 'package:image_search/presentation/home/home_screen.dart';
import 'package:image_search/presentation/home/home_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
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
      home: ChangeNotifierProvider<HomeViewModel>(
        create: (_) => HomeViewModel(
          PictureRepositoryImpl(
            PictureRemoteDataSource(
              Client(),
            ),
          ),
        ),
        // State
        child: const HomeScreen(),
      ),
    );
  }
}
