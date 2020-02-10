import 'package:equatable/equatable.dart';
import 'package:masterclass/city.dart';

abstract class ListState extends Equatable {
  const ListState();
  @override
  List<Object> get props => [];
}

class InitialListState extends ListState {}
class LoadingListState extends ListState {}
class ErrorListState extends ListState {}

class DataListState extends ListState {
  final List<City> cities;

  DataListState(this.cities);
  @override
  List<Object> get props => [cities];
}