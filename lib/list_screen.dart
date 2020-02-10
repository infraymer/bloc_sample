import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masterclass/bloc.dart';

import 'city.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  ListBloc _bloc = ListBloc();

  _ListScreenState() {
    _bloc.add(FetchCitiesListEvent());
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Master class'),
        ),
        body: BlocProvider<ListBloc>(
          create: (BuildContext ctx) => _bloc,
          child: BlocBuilder<ListBloc, ListState>(
            builder: (BuildContext context, ListState state) {
              if (state is LoadingListState) {
                return _progress();
              } else if (state is DataListState) {
                return _list(state.cities);
              } else {
                return _error();
              }
            },
          ),
        ));
  }

  Widget _list(List<City> list) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (ctx, index) {
        final city = list[index];
        return ListTile(
          title: Text(city.name),
        );
      },
    );
  }

  Widget _progress() {
    return Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _error() {
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            Text('Error'),
            RaisedButton(
              child: Text('Update'),
              onPressed: () {
                _bloc.add(FetchCitiesListEvent());
              },
            )
          ],
        ),
      ),
    );
  }
}
