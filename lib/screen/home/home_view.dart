import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pahlawan_indonesia/screen/cari_pahlawan/cari_view.dart';
import 'package:flutter_pahlawan_indonesia/screen/detail_pahlawan/detail_view.dart';
import 'package:flutter_pahlawan_indonesia/screen/home/home_cubit.dart';
import 'package:flutter_pahlawan_indonesia/screen/home/home_state.dart';

import '../../data/model/pahlawan_model.dart';

class HomeView extends StatelessWidget {
  List<Root> data;
  HomeView({Key? key, required this.data}) : super(key: key);
  var _controllerSearch = TextEditingController();
  @override
  Widget build(BuildContext context) {
    HomeCubit _homeCubit = BlocProvider.of<HomeCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Pahlawan Indonesia"),
        actions: [
          Container(
              margin: EdgeInsets.only(right: 20),
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/images/indonesia_flag.png"),
                backgroundColor: Colors.black,
                radius: 15,
              )),
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 15, top: 20),
            decoration: BoxDecoration(
                border: Border(left: BorderSide(width: 2, color: Colors.red))),
            padding: EdgeInsets.only(left: 5),
            child: Text(
              "Cerita & Biografi\nPahlawan-Pahlawan Indonesia",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: "Merriweather"),
            ),
          ),
          Container(
              margin: EdgeInsets.only(left: 15, top: 25, right: 15),
              child:
                  BlocBuilder<HomeCubit, HomeState>(builder: ((context, state) {
                return TextField(
                  controller: _controllerSearch,
                  onChanged: (query) {
                    _homeCubit.setIsClear(query.length > 0);
                  },
                  onSubmitted: (query) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => CariView(
                                  query: query,
                                  data: data
                                      .where((element) => element.name!
                                          .toLowerCase()
                                          .contains(query.toLowerCase()))
                                      .toList(),
                                ))));
                  },
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      hintText: "Cari pahlawan",
                      suffixIcon: state is clearShowState
                          ? IconButton(
                              onPressed: () {
                                _controllerSearch.clear();
                                _homeCubit.setIsClear(false);
                              },
                              icon: Icon(Icons.clear))
                          : null),
                );
              }))),
          Expanded(
            child: ListView.builder(
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
          )
        ],
      ),
    );
  }
}
