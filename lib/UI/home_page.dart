// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_bloc/UI/individual_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:firebase_bloc/bloc/flower_bloc.dart';

import '../Models/flower.dart';

class HomePage extends StatelessWidget {
  FlowerBloc flowerBloc = FlowerBloc();

  HomePage({super.key}) {
    flowerBloc.add(fetchApi());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hello"),
      ),
      body: BlocProvider(
        create: (context) => flowerBloc,
        child: Column(children: [
          Text("hellos"),
          BlocBuilder<FlowerBloc, FlowerState>(
            builder: (context, state) {
              print('hello');
              if (state is FlowerLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is FlowerLoaded) {
                return Expanded(
                  child: ListView.builder(
                      itemCount: state.flowerList.length,
                      itemBuilder: (context, index) {
                        return NewWidget(
                          index: index,
                          flowerList: state.flowerList,
                        );
                      }),
                );
              } else {
                return (Text("hello test"));
              }
            },
          )
        ]),
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  List<Flower> flowerList;
  int index;
  NewWidget({
    Key? key,
    required this.flowerList,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Container(
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: () {
            const snack = SnackBar(content: Text("hello"));
            // ScaffoldMessenger.of(context).showSnackBar(snack);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => IndividualPage(
                        firstname: flowerList[index].firstName ?? "")));
          },
          child: Card(
            child: Row(
              children: [
                ClipPath(
                  clipper: NewClipper(),
                  child: Image.network(
                    'https://googleflutter.com/sample_image.jpg',
                    height: 40,
                    width: 40,
                  ),
                ),
                const Padding(padding: EdgeInsets.only(left: 20)),
                Flexible(child: Text(flowerList[index].firstName ?? "new"))
              ],
            ),
          ),
        )));
  }
}

class NewClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width / 2, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(NewClipper oldClipper) => false;
}
