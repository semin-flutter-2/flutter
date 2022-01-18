import 'package:flutter/material.dart';
import 'package:json_place_holder/presentation/home/home_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      _updateUi(1);
    });
  }

  Future<void> _updateUi(int page) async {
    final viewModel = context.read<HomeViewModel>();
    viewModel.fetch(page);
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: viewModel.isLoading
          ? const CircularProgressIndicator()
          : Column(
              children: [
                Expanded(
                  child: ListView(
                    children:
                        viewModel.posts.map((e) => Text('${e.id}')).toList(),
                  ),
                ),
                Row(
                  children: List.generate(10, (index) => index + 1)
                      .map((page) => TextButton(
                          onPressed: () {
                            viewModel.fetch(page);
                          },
                          child: Text('$page')))
                      .toList(),
                )
              ],
            ),
    );
  }
}
