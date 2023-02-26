part of 'flower_bloc.dart';

@immutable
abstract class FlowerState extends Equatable {}

class FlowerInitial extends FlowerState {
  @override
  List<Object?> get props => [];
}

class FlowerLoading extends FlowerState {
  @override
  List<Object?> get props => [];
}

class FlowerLoaded extends FlowerState {
  var flowerList;
  FlowerLoaded({this.flowerList});

  @override
  List<Object?> get props => [flowerList];
}
