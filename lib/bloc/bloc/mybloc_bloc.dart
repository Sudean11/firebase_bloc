import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_bloc/apidata.dart';
import 'package:meta/meta.dart';

part 'mybloc_event.dart';
part 'mybloc_state.dart';

class MyblocBloc extends Bloc<MyblocEvent, NewBolcState> {
  MyblocBloc() : super(MyblocInitial()) {
    on<ApiCallEventTrigerred>((event, emit) async {
      emit(MyblocLoading());

      final dio = Dio();
      final response =
          await dio.get('https://api.axiossoftwork.com/updatetable');
      final List parsedList = response.data;
      List apiList = parsedList.map((e) => ApiData.fromJson(e)).toList();
      print(apiList);
      emit(MyblocLoaded(apiList: apiList));
    });
  }
}
