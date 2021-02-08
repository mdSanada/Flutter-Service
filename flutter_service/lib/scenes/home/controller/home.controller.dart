import 'package:flutter/material.dart';
import 'package:flutter_service/core/models/person.dart';
import 'package:flutter_service/core/service/api_response.dart';
import 'package:flutter_service/scenes/home/viewmodel/home.viewmodel.dart';

class HomeController {
  final searchController = TextEditingController();
  HomeViewModel _homeViewModel;

  HomeController(HomeViewModel homeViewModel) {
    _homeViewModel = homeViewModel;
  }

  setSearchData(String person) {
    _homeViewModel.changeSearch(person);
  }

  void didLoad() async {
    setSearchData('1');
    await _homeViewModel.searchData().then((response) async {
      switch (response.status) {
        case Status.LOADING:
          _homeViewModel.setLoading(true);
          break;
        case Status.COMPLETED:
          _homeViewModel.setPerson(response.data);
          break;
        case Status.ERROR:
          _homeViewModel.setErrorState();
          // showAlert(context, response.message);
          break;
      }
    });
    setSearchData('');
  }

  void search() async {
    _homeViewModel.searchData().then((response) async {
      switch (response.status) {
        case Status.LOADING:
          _homeViewModel.setLoading(true);
          break;
        case Status.COMPLETED:
          _homeViewModel.setPerson(response.data);
          break;
        case Status.ERROR:
          _homeViewModel.setErrorState();
          // showAlert(context, response.message);
          break;
      }
    });
  }

  void showAlert(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Atenção!"),
          content: new Text(message),
          actions: <Widget>[
            new FlatButton(
              child: new Text("ok"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
