import 'package:flutter/material.dart';

class FruitClassification  extends StatelessWidget {
  const FruitClassification ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fruit Classification',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const Scaffold(
        body: Center(
          child: Text(
            'Fruit Classification',
            style: TextStyle(fontSize: 22),
          ),
        ),
      ),
    );
  }
}
