import 'package:firebase_bloc/ApiService/api_service_impl.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Api Calls test", () {
    setUpAll(() {});
    test('Api call responding null', () async {
      bool fetchedValues = false;
      var apiServiceImpl = ApiServiceImpl();
      var data = apiServiceImpl.fetchDataFromApi();
      if (data != null) {
        fetchedValues = true;
      }
      expect(fetchedValues, true);
    });
  });
}




//Source: https://stackoverflow.com/questions/72933945


