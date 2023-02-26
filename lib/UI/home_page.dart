import 'package:firebase_bloc/bloc/flower_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  NewWidget({super.key, required this.flowerList, required this.index});

  @override
  Widget build(Object context) {
    return (Container(
      padding: const EdgeInsets.all(10),
      alignment: Alignment.center,
      child: Row(children: [
        Image.network(
          'https://googleflutter.com/sample_image.jpg',
          height: 40,
          width: 40,
        ),
        Flexible(child: Text(flowerList[index].firstName ?? "new"))
      ]),
    ));
  }
}
