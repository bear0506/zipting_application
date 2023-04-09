import 'package:flutter/material.dart';

class ProfileEditorMyhome extends StatefulWidget {
  const ProfileEditorMyhome({ Key? key }) : super(key: key);

  @override
  _ProfileEditorMyhomeState createState() => _ProfileEditorMyhomeState();
}

class _ProfileEditorMyhomeState extends State<ProfileEditorMyhome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 20,
              ),
              Text(
                "[007Yang]님의 집",
                style: TextStyle(fontSize: 24),
              ),
              Spacer(),
              IconButton(
                onPressed: () {
                
                },
                icon: Image.asset('assets/icons/chevron-right.png',
                    width: 32, height: 50),
              )
            ],
          ),
          Expanded(
              child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              SizedBox(
                width: 20,
              ),
              ProfileEditorHomeCard(
                  housename: "태영아파트 ",
                  cityname: "기안동",
                  point: 123,
                  image: "assets/images/ex7.jpeg",
                  stayday:1
                  ),
              ProfileEditorHomeCard(
                  housename: "우리 집",
                  cityname: "거제도",
                  point: 441,
                  image: "assets/images/ex6.jpeg",
                  stayday:4
                  ),
              ProfileEditorHomeCard(
                  housename: "호남아파트",
                  cityname: "전라도",
                  point: 282,
                  image: "assets/images/ex5.jpeg",
                  stayday:2
                  ),
            ],
          )),
          Divider(
            thickness: 2,
          )
        ],
      ),
      height: 300,
    );
  }
}
class ProfileEditorHomeCard extends StatefulWidget {
  final String? housename;
  final String? cityname;
  final int? point;
  final String? image;
  final int? stayday;
  const ProfileEditorHomeCard(
      {Key? key,
      this.housename,
      this.cityname,
      this.point,
      this.image,
      this.stayday})
      : super(key: key);

  @override
  _ProfileEditorHomeCardState createState() => _ProfileEditorHomeCardState();
}

class _ProfileEditorHomeCardState extends State<ProfileEditorHomeCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
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
              Text("/ ${widget.stayday}박",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold))
            ],
          )
        ],
      ),
      width: 190,
    );
  }
}