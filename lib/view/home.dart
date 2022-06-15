import 'package:astro/controller/astrologer.dart';
import 'package:astro/controller/banner.dart';
import 'package:astro/controller/horoscopes.dart';
import 'package:astro/controller/question.dart';
import 'package:astro/controller/reportsapi.dart';
import 'package:astro/view/astrologer.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeActivity extends StatefulWidget {
  const HomeActivity({Key key}) : super(key: key);

  @override
  _HomeActivityState createState() => _HomeActivityState();
}

class _HomeActivityState extends State<HomeActivity> {
  HoroscopesApiServices _horoscopesApiServices = new HoroscopesApiServices();
  AstrologerApiServices _astrologerApiServices = new AstrologerApiServices();
  ReportsApiServices _reportsApiServices = new ReportsApiServices();
  QuestionApiServices _questionApiServices = new QuestionApiServices();
  BannerApiServices _bannerApiServices = new BannerApiServices();
  String _mySelection;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              banner(),
              horoscopes(),
              astrologer(),
              reports(),
              question(),
              customers(),
            ],
          ),
        ),
      )),
    );
  }

  Widget banner() {
    return FutureBuilder(
      future: _bannerApiServices.question(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: snapshot.data.data.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 5,
                  width: 150,
                  child: InkWell(
                    onTap: () {
                      _launchURL(snapshot.data.data[index].landingUrl);
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.network(
                        snapshot.data.data[index].images.medium.imageUrl,
                        height: 5,
                        width: 5,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }
        return Container();
      },
    );
  }

  Widget horoscopes() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Daliy Horoscopes",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            Text(
              "See All >",
              style: TextStyle(
                  color: Colors.orange[600], fontWeight: FontWeight.bold),
            )
          ],
        ),
        SizedBox(
          height: 5,
        ),
        FutureBuilder(
          future: _horoscopesApiServices.horoscopes(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  Text(snapshot.data.title),
                  GridView.builder(
                      shrinkWrap: true,
                      itemCount: 3,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: (1 / 1),
                      ),
                      padding: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                      ),
                      itemBuilder: (
                        context,
                        index,
                      ) {
                        return GestureDetector(
                          child: SizedBox(
                            height: 3,
                            width: 2,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 8.0, left: 8.0, right: 8.0),
                              child: Card(
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0),
                                ),
                                child: InkWell(
                                  onTap: () async {},
                                  child: Center(
                                      child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 60,
                                        width: 60,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(60),
                                          ),
                                          color: Colors.indigo[100],
                                          image: DecorationImage(
                                            image: NetworkImage(snapshot
                                                .data
                                                .data[index]
                                                .images
                                                .small
                                                .imageUrl),
                                            fit: BoxFit.fitHeight,
                                          ),
                                          // border:
                                          //     Border.all(color: Theme.of(context).accentColor),
                                        ),
                                      ),
                                      Flexible(
                                        child: Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Text(
                                            snapshot.data.data[index].name,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Text(
                                            snapshot.data.data[index].date,
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ],
              );
            }
            return Container();
          },
        )
      ],
    );
  }

  Widget astrologer() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Talk to an Astrologer",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AstrologerActivity()),
                );
              },
              child: Text(
                "See All >",
                style: TextStyle(
                    color: Colors.orange[600], fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Text(
            "Leading astrologers of india are just a phone call away.Our panel of astrologers not just provides solutions to your life problems but also guide you so that you can take the right path towards growth and proserity."),
        FutureBuilder(
          future: _astrologerApiServices.astrologer(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                height: MediaQuery.of(context).size.height * .35,
                child: ListView.builder(
                  itemCount: snapshot.data.data.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (
                    context,
                    index,
                  ) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width * .4,
                      child: Card(
                        elevation: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Padding(
                            padding: const EdgeInsets.all(7.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.width * .35,
                                  width:
                                      MediaQuery.of(context).size.width * .35,
                                  child: Image.network(snapshot
                                      .data.data[index].images.large.imageUrl),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        snapshot.data.data[index].firstName +
                                            " " +
                                            snapshot.data.data[index].lastName,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Text(
                                        snapshot.data.data[index].rating,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.orange[600]),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  snapshot.data.data[index].skills[0],
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Expanded(
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: Text('\u{20B9}' +
                                              snapshot.data.data[index]
                                                  .additionalPerMinuteCharges
                                                  .toString() +
                                              "/min")),
                                      SizedBox(
                                        height: 20,
                                        child: ElevatedButton(
                                            onPressed: () {},
                                            style: ElevatedButton.styleFrom(
                                                primary: Colors.orange[600]),
                                            child: Text(
                                              'Talk Now',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12),
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            }
            return Container();
          },
        )
      ],
    );
  }

  Widget reports() {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Reports",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            Text(
              "See All >",
              style: TextStyle(
                  color: Colors.orange[600], fontWeight: FontWeight.bold),
            )
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Text(
            "Astrology report or what is commonly known as Horoscope. report is basically an in depth look at your birth chart. Horoscope report will look at various planetary positions in your birth charts and also derive relationships and angle to understand your personality and trait."),
        SizedBox(
          height: 5,
        ),
        FutureBuilder(
          future: _reportsApiServices.reports(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                height: MediaQuery.of(context).size.height * .2,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data.data.services.length,
                  itemBuilder: (
                    context,
                    index,
                  ) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width * .6,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 3,
                        child: Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            Container(
                                height: MediaQuery.of(context).size.height,
                                decoration: new BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    image: new DecorationImage(
                                        fit: BoxFit.fill,
                                        image: new NetworkImage(snapshot.data
                                            .data.services[index].imageUrl)))),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10)),
                                color: Colors.black54,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '\u{20B9}' +
                                          snapshot
                                              .data.data.services[index].price +
                                          "/min",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    ),
                                    SizedBox(
                                      height: 20,
                                      child: ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                              primary: Colors.orange[600]),
                                          child: Text(
                                            'Buy Now',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12),
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            }
            return Container();
          },
        )
      ],
    );
  }

  Widget question() {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Ask Question",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Text(
            "Seek accurate answers to your life problems and guide you towards the right path. Whether the problem is related to love, self, life, business, money, education or work, our astrologers will do an in depth study of your birth chart provide personalized responses along with remedies."),
        SizedBox(
          height: 10,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.blue[100],
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Choose Category",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                FutureBuilder(
                  future: _questionApiServices.question(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 40,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: DropdownButtonHideUnderline(
                              child: new DropdownButton<String>(
                                hint: Container(
                                  child: Text(
                                      "  Select a category: Love,career,more"),
                                ),
                                iconSize: 24,
                                elevation: 16,
                                isExpanded: true,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 14.0),
                                items: snapshot.data.data
                                    .map<DropdownMenuItem<String>>((item) {
                                  return new DropdownMenuItem<String>(
                                    child: new Text(item.name.toString()),
                                    value: item.id.toString(),
                                  );
                                }).toList(),
                                onChanged: (newVal) async {
                                  setState(() {
                                    _mySelection = newVal;
                                  });

                                  // getvalue();
                                },
                                value: _mySelection,
                              ),
                            ),
                          ),
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }

                    // By default, show a loading spinner.
                    return Center(child: CircularProgressIndicator());
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          '\u{20B9}' + "99",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "(including GST)",
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Ideas what to ask  ",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                          child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.orange[600]),
                              child: Text(
                                'Ask a Question',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10),
                              )),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget customers() {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Hear from our Happy Customers!",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 270,
          width: 250,
          child: Card(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "I discussed with Mr. Arvind ji and I'm very satisfied with the discussion. He has very good knowledge and understanding and told correctly. My questions are clearly answered and I want to contact with him further for my family as well. Thank you for your support",
                    style: TextStyle(color: Colors.black54),
                  ),
                ),
                Expanded(
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        height: 70,
                        color: Colors.indigo[50],
                        child: Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 30,
                              ),
                              Text("Gangan Deep Agarwal"),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Bhopal,India",
                                style: TextStyle(
                                  fontSize: 10,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: -5.0,
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40)),
                              color: Colors.orange[600]),
                          child: Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  void _launchURL(String finalurl) async {
    var _url = finalurl.toString();

    launch(
      _url,
      //forceWebView: true,
      // enableJavaScript: true,
      // forceSafariVC: true,
      universalLinksOnly: true,
    );
  }
}
