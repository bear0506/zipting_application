import 'package:flutter/material.dart';
import 'package:zipting/app/core/values/colors.dart';

class TagAddScreen extends StatefulWidget {
  const TagAddScreen({Key? key}) : super(key: key);

  @override
  _TagAddScreenState createState() => _TagAddScreenState();
}

class _TagAddScreenState extends State<TagAddScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.chevron_left,
                    color: kTextBodyColor,
                    size: 40,
                  )),
              title: Text(
                "태그 추가",
                style: TextStyle(color: kTextBodyColor),
              ),
            ),
            body: ListView(
              children: [
                Align(
                    child: Container(
                        width: 300,
                        height: 100,
                        decoration: BoxDecoration(border: Border.all()),
                        child: TextField()))
              ],
            )));
  }
}
