import 'package:bloc_test/bloc_test.dart';
import 'package:firebase_bloc/ApiService/api_service_impl.dart';
import 'package:firebase_bloc/Model/apidata.dart';
import 'package:firebase_bloc/bloc/bloc/flower_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockFlowerBloc extends MockBloc<FlowerEvent, FlowerState>
    implements FlowerBloc {}

class MockApiServiceImpl extends Mock implements ApiServiceImpl {}

void main() {
  ApiServiceImpl apiService;
  FlowerBloc flowerBloc;
  group("Listening", () {
    test('initial state is MyblocInitial', () {
      apiService = MockApiServiceImpl();
      flowerBloc = FlowerBloc(apiService: apiService);
      expect(flowerBloc.state, MyblocInitial());
    });

    apiService = MockApiServiceImpl();
    flowerBloc = FlowerBloc(apiService: apiService);
    blocTest<FlowerBloc, FlowerState>(
      'emits [MyblocLoading, MyblocLoaded] when ApiCallEventTrigerred is added',
      build: () {
        when(apiService.fetchDataFromApi()).thenAnswer(
            (_) async => [ApiData(id: 2, firstName: "sdfa", image: "sdfa")]);
        return flowerBloc;
      },
      act: (bloc) {
        bloc.add(ApiCallEventTrigerred());
        return Future.delayed(const Duration(seconds: 2));
      },
      expect: () => <FlowerState>[
        MyblocLoading(),
        MyblocLoaded(
            apiList: [ApiData(id: 2, firstName: "sdfa", image: "sdfa")])
      ],
    );
  });
}
