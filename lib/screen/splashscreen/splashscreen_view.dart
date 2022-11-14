import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_pahlawan_indonesia/data/model/pahlawan_model.dart';
import 'package:flutter_pahlawan_indonesia/screen/home/home_view.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    loadData(context);
    return Scaffold(
        backgroundColor: Colors.red,
        body: Stack(
          children: [
            Positioned(
              child: Container(
                margin: EdgeInsets.only(bottom: 3),
                child: Center(
                  child: Text(
                    "Coded by Ricky V 💻",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              bottom: 0,
              right: 0,
              left: 0,
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage("assets/images/pahlawan.jpg"),
                      radius: 100,
                    )
                  ],
                ),
                Container(
                    margin: EdgeInsets.only(top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.favorite,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Pahlawan Indonesia",
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.favorite,
                          color: Colors.white,
                        )
                      ],
                    )),
              ],
            ),
          ],
        ));
  }

  Future<void> loadData(context) async {
    String data = await DefaultAssetBundle.of(context)
        .loadString("assets/data/data.json");
    List<Root> res =
        (jsonDecode(data) as List).map((e) => Root.fromJson(e)).toList();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder) {
        return HomeView(
          data: res,
        );
      }));
    });
  }
}
