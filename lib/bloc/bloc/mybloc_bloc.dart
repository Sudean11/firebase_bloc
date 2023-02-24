import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_bloc/ApiService/api_service_impl.dart';
import 'package:firebase_bloc/apidata.dart';
import 'package:meta/meta.dart';

part 'mybloc_event.dart';
part 'mybloc_state.dart';

class MyblocBloc extends Bloc<MyblocEvent, NewBolcState> {
  var apiServiceImpl = ApiServiceImpl();

  MyblocBloc() : super(MyblocInitial()) {
    on<ApiCallEventTrigerred>((event, emit) async {
      emit(MyblocLoading());
      var apiList = await apiServiceImpl.fetchDataFromApi();
      emit(MyblocLoaded(apiList: apiList));
    });
  }
}
