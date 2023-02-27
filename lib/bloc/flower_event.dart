part of 'flower_bloc.dart';

@immutable
abstract class FlowerEvent {}

class fetchApi extends FlowerEvent {}

class SelectFlower extends FlowerEvent {
  int index;
  SelectFlower({required this.index});
}

class GetSelectedFlower extends FlowerEvent {}
