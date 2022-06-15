import 'package:astro/controller/astrologer.dart';
import 'package:flutter/material.dart';

class AstrologerActivity extends StatefulWidget {
  const AstrologerActivity({Key key}) : super(key: key);

  @override
  _AstrologerActivityState createState() => _AstrologerActivityState();
}

class _AstrologerActivityState extends State<AstrologerActivity> {
  AstrologerApiServices _astrologerApiServices = new AstrologerApiServices();
  // ignore: deprecated_member_use
  List<Widget> textWidgetList = List<Widget>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Talk to an Astrologer",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    Row(
                      children: [
                        IconButton(
                          iconSize: 10,
                          icon: Image.asset(
                            'assets/search.png',
                            width: 25,
                          ),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Image.asset(
                            'assets/filter.png',
                            width: 25,
                          ),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Image.asset(
                            'assets/sort.png',
                            width: 25,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    )
                  ],
                ),
                astrolger(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget astrolger() {
    return FutureBuilder(
      future: _astrologerApiServices.astrologer(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: snapshot.data.data.length,
              shrinkWrap: true,
              itemBuilder: (
                context,
                index,
              ) {
                for (int i = 0;
                    i < snapshot.data.data[index].skills.length;
                    i++) {
                  textWidgetList.add(
                    Container(
                      child: Text(snapshot.data.data[index].skills[i] + ","),
                    ),
                  );
                }
                return Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 100,
                        child: Image.network(
                            snapshot.data.data[index].images.large.imageUrl),
                      ),
                      Padding(padding: const EdgeInsets.only(left: 20)),
                      Expanded(
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    snapshot.data.data[index].firstName +
                                        " " +
                                        snapshot.data.data[index].lastName,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    snapshot.data.data[index].experience
                                            .toString() +
                                        "Years",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black54),
                                  ),
                                ],
                              ),
                              // Container(
                              //   height:
                              //       MediaQuery.of(context).size.height * .25,
                              //   width: MediaQuery.of(context).size.width * .5,
                              //   child: new ListView(
                              //     physics: NeverScrollableScrollPhysics(),
                              //     shrinkWrap: true,
                              //     // scrollDirection: Axis.horizontal,
                              //     children: snapshot.data.data[index].skills
                              //         .map<Widget>((item) {
                              //       return SizedBox(
                              //           width:
                              //               MediaQuery.of(context).size.width *
                              //                   .5,
                              //           // child: new ListTile(
                              //           //   title: new Text(item),
                              //           // ),
                              //           child: IntrinsicHeight(
                              //             child: Row(
                              //               children: [
                              //                 Text(item + ","),
                              //               ],
                              //             ),
                              //           ));
                              //     }).toList(),
                              //   ),
                              // ),

                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.person_outline,
                                    color: Colors.orange[600],
                                    size: 15,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * .4,
                                    child: ListView.builder(
                                        physics: NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: snapshot
                                            .data.data[index].skills.length,
                                        itemBuilder: (_, i) {
                                          return Padding(
                                            padding: const EdgeInsets.all(0.0),
                                            child: Row(
                                              children: [
                                                Text(snapshot.data.data[index]
                                                        .skills[i] +
                                                    ","),
                                              ],
                                            ),
                                          );
                                        }),
                                  ),
                                ],
                              ),

                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.translate,
                                    color: Colors.orange[600],
                                    size: 15,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * .5,
                                    child: ListView.builder(
                                        physics: NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: snapshot
                                            .data.data[index].languages.length,
                                        itemBuilder: (_, i) {
                                          return Padding(
                                            padding: const EdgeInsets.all(0.0),
                                            child: Row(
                                              children: [
                                                Text(snapshot.data.data[index]
                                                        .languages[i] +
                                                    ","),
                                              ],
                                            ),
                                          );
                                        }),
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.money,
                                    color: Colors.orange[600],
                                    size: 15,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    '\u{20B9}' +
                                        snapshot.data.data[index]
                                            .additionalPerMinuteCharges
                                            .toString() +
                                        " / Min",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                height: 40,
                                width: 150,
                                child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.orange[600]),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Icon(
                                          Icons.phone_outlined,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          'Talk on call',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12),
                                        ),
                                      ],
                                    )),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              });
        }
        return CircularProgressIndicator();
      },
    );
  }
}
