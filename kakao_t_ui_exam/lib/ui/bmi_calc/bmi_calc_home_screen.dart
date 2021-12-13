import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'bmi_calc_result_screen.dart';

class BmiCalcHomeScreen extends StatefulWidget {
  const BmiCalcHomeScreen({Key key}) : super(key: key);

  @override
  State<BmiCalcHomeScreen> createState() => _BmiCalcHomeScreenState();
}

class _BmiCalcHomeScreenState extends State<BmiCalcHomeScreen> {
  final _heightTextEditingController = TextEditingController();
  final _weightTextEditingController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _heightTextEditingController.dispose();
    _weightTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI 계산기'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                controller: _heightTextEditingController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '키',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '키를 입력하세요';
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: _weightTextEditingController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '몸무게',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '몸무게를 입력하세요';
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
              ),
              ButtonBar(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        // 버튼 눌렀을 때
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BmiCalcResultScreen(
                                double.parse(_heightTextEditingController.text.trim()),
                                double.parse(_weightTextEditingController.text.trim()),
                              )),
                        );
                      }
                    },
                    child: Text('계산'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
