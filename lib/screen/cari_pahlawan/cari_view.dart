import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../data/model/pahlawan_model.dart';
import '../detail_pahlawan/detail_view.dart';

class CariView extends StatelessWidget {
  String query;
  List<Root> data;
  CariView({Key? key, required this.query, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cari pahlawan '" + query + "'"),
      ),
      body: data.length == 0
          ? Center(
              child: Text(
                "'" + query + "' Tidak ditemukan",
                style: TextStyle(color: Colors.red),
              ),
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(top: 20, left: 15, right: 15),
                  child: ListTile(
                    tileColor: Colors.white,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailView(
                                    pahlawanModel: data[index],
                                    tag: "pahlawanku" + index.toString(),
                                  )));
                    },
                    trailing: Text(
                      (index + 1).toString(),
                      style: TextStyle(color: Colors.grey),
                    ),
                    isThreeLine: true,
                    leading: Hero(
                      tag: "pahlawanku" + index.toString(),
                      child: FadeInImage(
                          placeholder:
                              AssetImage("assets/images/indonesia_flag.png"),
                          image: CachedNetworkImageProvider(
                              data[index].photourl!)),
                    ),
                    title: Text(
                      data[index].name!,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      data[index].description != null
                          ? data[index].description!
                          : "",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(color: Colors.red[400]),
                    ),
                  ),
                );
              },
              itemCount: data.length,
            ),
    );
  }
}
