import 'package:flutter/material.dart';
import 'package:zipting/app/ui/house/house_ui.dart';

class KeepCard extends StatefulWidget {
  final String? housename;
  final String? cityname;
  final int? point;
  final String? image;

  const KeepCard(
      {Key? key, this.housename, this.cityname, this.point, this.image})
      : super(key: key);

  @override
  _KeepCardState createState() => _KeepCardState();
}

class _KeepCardState extends State<KeepCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.pushNamed(context, HouseUi.routeName);
      },
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15,
            ),
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(30)),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset('${widget.image}',
                      width: 150, height: 150, fit: BoxFit.fill)),
            ),
            SizedBox(height: 5),
            Text("${widget.housename}",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text("${widget.cityname}",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Row(
              children: [
                Text("${widget.point} 포인트",
                    style: TextStyle(fontSize: 12, color: Colors.pink[500])),
                Text("/ 1박",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold))
              ],
            )
          ],
        ),
        width: 190,
      ),
    );
  }
}
