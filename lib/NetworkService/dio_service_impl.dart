import 'package:firebase_bloc/NetworkService/network_service.dart';
import 'package:dio/dio.dart';
import 'package:firebase_bloc/ApiService/api_service.dart';
import 'package:firebase_bloc/apidata.dart';

class DioServiceImpl extends NetworkService {
  @override
  getValues() async {
    final dio = Dio();
    final response = await dio.get('https://api.axiossoftwork.com/updatetable');
    final List parsedList = response.data;
    List apiList = parsedList.map((e) => ApiData.fromJson(e)).toList();
    return apiList;
  }

  @override
  postValues() {
    // TODO: implement postValues
    throw UnimplementedError();
  }
}
