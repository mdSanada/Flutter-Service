import 'package:flutter/material.dart';

class Form_text extends StatelessWidget {
  const Form_text({
    Key key,
    @required String value,
    @required String title,
  })  : _value = value,
        _title = title,
        super(key: key);

  final String _value;
  final String _title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(_title),
        Text(
          _value,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
