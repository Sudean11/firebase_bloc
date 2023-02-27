import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_bloc/ApiService/api_service_impl.dart';
import 'package:firebase_bloc/Model/apidata.dart';
import 'package:meta/meta.dart';

part 'flower_event.dart';
part 'flower_state.dart';

class FlowerBloc extends Bloc<FlowerEvent, FlowerState> {
  FlowerBloc({required ApiServiceImpl apiService}) : super(MyblocInitial()) {
    on<ApiCallEventTrigerred>((event, emit) async {
      emit(MyblocLoading());
      var apiList = await apiService.fetchDataFromApi();
      emit(MyblocLoaded(apiList: apiList));
    });
  }
}
