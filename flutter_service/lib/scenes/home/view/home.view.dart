import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_service/scenes/home/controller/home.controller.dart';
import 'package:flutter_service/scenes/home/view/widgets/card_details.dart';
import 'package:flutter_service/scenes/home/viewmodel/home.viewmodel.dart';
import 'package:get_it/get_it.dart';

class HomeView extends StatefulWidget {
  HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeController _homeController;
  HomeViewModel _homeViewModel;
  double _width;

  @override
  void initState() {
    super.initState();
    _homeViewModel = GetIt.instance<HomeViewModel>();
    _homeController = HomeController(_homeViewModel);
    _homeController.didLoad();
  }

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Dio'),
      ),
      body: Observer(builder: (context) {
        bool isLoading = _homeViewModel.isLoading;
        return (isLoading)
            ? Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Flexible(
                              child: TextField(
                                controller: _homeController.searchController,
                                onChanged: (value) async {
                                  _homeController.setSearchData(value);
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: FlatButton(
                                color: Theme.of(context).accentColor,
                                textColor: Colors.white,
                                disabledColor: Colors.grey,
                                disabledTextColor: Colors.black,
                                onPressed: _homeViewModel.search.isNotEmpty
                                    ? () {
                                        _homeController.search();
                                      }
                                    : null,
                                child: Text(
                                  "Search",
                                  style: TextStyle(fontSize: 14.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider()
                      ],
                    ),
                  ),
                  Observer(builder: (context) {
                    bool isError = _homeViewModel.onError;
                    return isError
                        ? Container()
                        : Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: _width - 40,
                                  color: Colors.transparent,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .accentColor
                                          .withAlpha(150),
                                      borderRadius: BorderRadius.only(
                                        topLeft: const Radius.circular(40.0),
                                        topRight: const Radius.circular(40.0),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Column(
                                        children: [
                                          CardDetails(
                                              width: _width,
                                              homeViewModel: _homeViewModel)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Image(
                                  width: _width - 40,
                                  height: _width - 40,
                                  fit: BoxFit.cover,
                                  image: NetworkImage(_homeViewModel.imageUrl),
                                )
                              ],
                            ),
                          );
                  }),
                ],
              );
      }),
    );
  }
}
