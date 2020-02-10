import 'package:equatable/equatable.dart';

abstract class ListEvent extends Equatable {
  const ListEvent();
  @override
  List<Object> get props => [];
}

class FetchCitiesListEvent extends ListEvent {}
