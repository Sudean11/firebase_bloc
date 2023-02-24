part of 'mybloc_bloc.dart';

@immutable
abstract class NewBolcState extends Equatable {}

class MyblocInitial extends NewBolcState {
  @override
  List<Object?> get props => [];
}

class MyblocLoading extends NewBolcState {
  @override
  List<Object?> get props => [];
}

class MyblocLoaded extends NewBolcState {
  var apiList;
  MyblocLoaded({this.apiList});

  @override
  List<Object?> get props => [apiList];
}

class MyblocError extends NewBolcState {
  @override
  List<Object?> get props => [];
}
