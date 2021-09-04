import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:layout/Pages/detail.dart';

class HomePage extends StatefulWidget {
  //const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Workshop Layouts"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: FutureBuilder(
            builder: (context, snapshot) {
              var data = json.decode(snapshot.data.toString());
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return MyBox(data[index]['title'], data[index]['subtitle'],
                      data[index]['img_URL'], data[index]['detail']);
                },
                itemCount: data.length,
              );
            },
            future:
                DefaultAssetBundle.of(context).loadString('assets/data.json'),
          )),
    );
  }

  Widget MyBox(String title, String subtitle, String img_URL, String detail) {
    var v1 = title, v2 = subtitle, v3 = img_URL, v4 = detail;

    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
      padding: EdgeInsets.all(20),
      //color: Colors.blue[100],
      height: 150,
      decoration: BoxDecoration(
          //color: Colors.blue[100],
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              image: NetworkImage(img_URL),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5), BlendMode.darken))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            subtitle,
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Column(
              children: [
                TextButton(
                  onPressed: () {
                    print("Next Pade >>");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailPage(v1, v2, v3, v4)));
                  },
                  child: Text("อ่านต่อ"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
