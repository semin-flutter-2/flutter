import 'package:counter/data/data_source/counter.dart';
import 'package:counter/data/repository/normal_counter_repository_impl.dart';
import 'package:counter/data/repository/double_counter_repository_impl.dart';
import 'package:counter/presentation/home/home_page.dart';
import 'package:counter/presentation/home/home_view_model.dart';
import 'package:flutter/material.dart';
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
        create: (_) => HomeViewModel(DoubleCountRepository(Counter())),
        child: const HomePage(),
      ),
    );
  }
}
