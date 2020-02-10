import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:masterclass/city.dart';

import './bloc.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  @override
  ListState get initialState => InitialListState();

  @override
  Stream<ListState> mapEventToState(ListEvent event) async* {
    if (event is FetchCitiesListEvent) {
      yield* mapToFetchCitiesEvent(event);
    }
  }

  Stream<ListState> mapToFetchCitiesEvent(FetchCitiesListEvent event) async* {
    yield LoadingListState();
    try {
      final cities = await getCities();
      yield DataListState(cities);
    } catch (_) {
      yield ErrorListState();
    }
  }
}

Future<List<City>> getCities() async {
  await Future.delayed(const Duration(milliseconds: 1000));
  final num = Random().nextInt(10);
  if (num > 2) throw('Server not access');
  return [
    City(0, 'Москва'),
    City(1, 'Лондон'),
    City(2, 'Питер'),
    City(3, 'Тюмень'),
    City(4, 'Казань'),
  ];
}