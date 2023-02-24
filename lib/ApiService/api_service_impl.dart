import 'package:dio/dio.dart';
import 'package:firebase_bloc/ApiService/api_service.dart';
import 'package:firebase_bloc/apidata.dart';

class ApiServiceImpl extends ApiRepo {
  @override
  fetchDataFromApi() async {
    final dio = Dio();
    final response = await dio.get('https://api.axiossoftwork.com/updatetable');
    final List parsedList = response.data;
    List apiList = parsedList.map((e) => ApiData.fromJson(e)).toList();
    return apiList;
  }
}
