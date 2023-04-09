import 'package:flutter/material.dart';

class TravelTrend extends StatelessWidget {
  const TravelTrend({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(        
        children: [
          Row(            
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 30,),
          Text("이 달의 여행 트렌드",style: TextStyle(fontSize: 25)),  
          ]),
          
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
                child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset('assets/icons/mypage/im1.png',
                    width: 180, height: 180, fit: BoxFit.fill)),
          ),
          Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
                child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset('assets/icons/mypage/im2.png',
                    width: 180, height: 180, fit: BoxFit.fill)),
          ),
          ]),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
                child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset('assets/icons/mypage/im3.png',
                    width: 180, height: 180, fit: BoxFit.fill)),
          ),
          Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
                child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset('assets/icons/mypage/im4.png',
                    width: 180, height: 180, fit: BoxFit.fill)),
          ),
          ]),
          SizedBox(height: 30)
        ]),
    );
  }
}