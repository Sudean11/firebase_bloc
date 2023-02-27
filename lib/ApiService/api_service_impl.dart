import 'package:firebase_bloc/ApiService/api_service.dart';
import 'package:firebase_bloc/NetworkService/dio_service_impl.dart';
import 'package:firebase_bloc/NetworkService/network_service.dart';

class ApiServiceImpl extends ApiRepo {
  NetworkService apiCall = DioServiceImpl();

  @override
  fetchDataFromApi() async {
    return apiCall.getValues();
  }
}
