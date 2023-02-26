import 'package:firebase_bloc/bloc/flower_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IndividualPage extends StatelessWidget {
  String firstname;
  IndividualPage({super.key, required this.firstname});

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(title: const Text("hello")),
      body: Column(children: [
        Center(
          child: Image.network(
            'https://googleflutter.com/sample_image.jpg',
            height: 40,
            width: 40,
          ),
        ),
        const Padding(padding: EdgeInsets.only(bottom: 40)),
        Text(firstname)
      ]),
    ));
  }
}
