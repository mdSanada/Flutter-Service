import 'package:flutter/material.dart';
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
    await _homeViewModel.searchData();
    setSearchData('');
  }

  void search() async {
    _homeViewModel.searchData();
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
