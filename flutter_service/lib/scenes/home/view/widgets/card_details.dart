import 'package:flutter/material.dart';
import 'package:flutter_service/scenes/home/view/widgets/form_text.dart';
import 'package:flutter_service/scenes/home/viewmodel/home.viewmodel.dart';

class CardDetails extends StatelessWidget {
  const CardDetails({
    Key key,
    @required double width,
    @required HomeViewModel homeViewModel,
  })  : _width = width,
        _homeViewModel = homeViewModel,
        super(key: key);

  final double _width;
  final HomeViewModel _homeViewModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Container(
              width: (_width - 90) / 2,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Form_text(
                          title: 'name:', value: _homeViewModel.person.name),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Form_text(
                          title: 'gender:',
                          value: _homeViewModel.person.gender),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Form_text(
                          title: 'skin color:',
                          value: _homeViewModel.person.skinColor),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Form_text(
                          title: 'eye color:',
                          value: _homeViewModel.person.eyeColor),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
        Column(
          children: [
            Container(
              width: (_width - 90) / 2,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Form_text(
                          title: 'birthYear:',
                          value: _homeViewModel.person.birthYear),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Form_text(
                          title: 'height:',
                          value: _homeViewModel.person.height),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Form_text(
                          title: 'mass:', value: _homeViewModel.person.mass),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Form_text(
                          title: 'skin color:',
                          value: _homeViewModel.person.skinColor),
                    ],
                  ),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
