import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_bloc/Models/flower.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'flower_event.dart';
part 'flower_state.dart';

class FlowerBloc extends Bloc<FlowerEvent, FlowerState> {
  FlowerBloc() : super(FlowerInitial()) {
    Flower? selectedFlower;
    List<Flower>? flowerList;

    on<FlowerEvent>((event, emit) async {
      if (event is fetchApi) {
        emit(FlowerLoading());
        final dio = Dio();
        final response =
            await dio.get('https://api.axiossoftwork.com/updatetable');
        List responseList = response.data;
        List<Flower> responseMapped =
            responseList.map((e) => Flower.fromJson(e)).toList();
        flowerList = responseMapped;
        emit(FlowerLoaded(flowerList: responseMapped));
      } else if (event is SelectFlower) {
        selectedFlower = flowerList![event.index];
      } else if (event is GetSelectedFlower) {
        emit(SelectedFlower(selectedFlower: (selectedFlower ?? Flower())));
      }
    });
  }
}
