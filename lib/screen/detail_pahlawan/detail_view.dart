import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pahlawan_indonesia/data/model/pahlawan_model.dart';

class DetailView extends StatefulWidget {
  Root pahlawanModel;
  String tag;
  DetailView({Key? key, required this.pahlawanModel, required this.tag})
      : super(key: key);

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  ScrollController scrollController = ScrollController();
  bool visible = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        bool isTop = scrollController.position.pixels == 0;

        if (isTop && !visible) {
          setState(() {
            visible = true;
          });
        } else if (!isTop && visible) {
          setState(() {
            visible = false;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.pahlawanModel.name!),
        ),
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              color: Colors.grey[200],
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(top: 80),
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 80, right: 5),
                      padding: EdgeInsets.only(left: 5, top: 5, bottom: 5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.date_range,
                                color: Colors.red,
                              ),
                              Text("Tanggal lahir : "),
                              Flexible(
                                  child: Text(
                                widget.pahlawanModel.birthdate!,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ))
                            ],
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.place,
                                color: Colors.red,
                              ),
                              Text("Tempat lahir : "),
                              Flexible(
                                  child: Text(
                                widget.pahlawanModel.birthplace!,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ))
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15, right: 5),
                      padding: EdgeInsets.only(left: 5, top: 5, bottom: 5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.date_range,
                                color: Colors.red,
                              ),
                              Text("Tanggal wafat : "),
                              Flexible(
                                  child: Text(
                                widget.pahlawanModel.deathdate!,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ))
                            ],
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.place,
                                color: Colors.red,
                              ),
                              Text("Tempat wafat : "),
                              Flexible(
                                  child: Text(
                                widget.pahlawanModel.deathplace!,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ))
                            ],
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                "assets/images/grave.png",
                                width: 24,
                                height: 24,
                              ),
                              Text("Tempat makam : "),
                              Flexible(
                                  child: Text(
                                widget.pahlawanModel.burialplace!,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ))
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      padding:
                          EdgeInsets.only(left: 8, top: 5, bottom: 5, right: 8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                          )),
                      child: Text(
                        widget.pahlawanModel.description!,
                        style: TextStyle(fontSize: 16),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
                left: 0,
                right: 0,
                top: 20,
                child: AnimatedOpacity(
                  opacity: visible ? 1 : 0,
                  duration: Duration(milliseconds: 500),
                  child: Hero(
                    tag: widget.tag,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 62,
                      child: CircleAvatar(
                        backgroundImage: CachedNetworkImageProvider(
                            widget.pahlawanModel.photourl!),
                        radius: 60,
                      ),
                    ),
                  ),
                ))
          ],
        ));
  }
}
