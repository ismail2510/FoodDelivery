import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fooddelivery/Views/drawer.dart';

import 'cart.dart';
import 'consts/food_data.dart';
import 'consts/utils.dart';
import 'details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  List<Food> foods = Utils.getMockedFoods();
  double value = 0;

  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(child: Stack(
        children: [
          //Background of Drawer
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.orange[400]!,
                  Colors.orange[800]!,
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          //Navigation Menu
          SafeArea(
            child: Container(
              width: 200.0,
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  DrawerHeader(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 50.0,
                          backgroundImage: AssetImage(
                              "images/smile.jpg"),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "kamal magdy",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        ListTile(
                          leading: Icon(
                            Icons.home,
                            color: Colors.white,
                          ),
                          title: Text(
                            "Home",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                          title: Text(
                            "Profile",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.settings,
                            color: Colors.white,
                          ),
                          title: Text(
                            "Settings",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.logout,
                            color: Colors.white,
                          ),
                          title: Text(
                            "Log out",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Main Screen
          TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: value),
            duration: Duration(milliseconds: 500),
            builder: (_, double val, __) {
              return (
                  //Transform Widget
                  Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..setEntry(0, 3, 200 * val)
                        ..rotateY((pi / 6) * val),
                      child:SafeArea(child:Scaffold(
                          resizeToAvoidBottomInset: false,
                          backgroundColor: Colors.orange,
                          appBar: AppBar(

                            titleSpacing: 0.0,
                            backgroundColor: Colors.orange,
                            elevation: 0.0,
                            actions: [
                              Padding(
                                padding: const EdgeInsets.only(right: 20.0),
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context, MaterialPageRoute(builder: (context) => Cart()));
                                  },
                                  icon: Icon(Icons.add_shopping_cart ,color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          body:SafeArea(child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 10),
                                  child: SizedBox(
                                    width: 200,
                                    child: Text(
                                      "Delicious food for you ",
                                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700,color: Colors.white),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width - 80,
                                    height: 40,
                                    child: TextFormField(
                                      cursorColor: Colors.black,
                                      autofocus: false,
                                      decoration: InputDecoration(
                                        filled: true,
                                        prefixIcon: Padding(
                                          padding: EdgeInsets.only(left: 20, right: 20),
                                          child: ImageIcon(AssetImage("images/searchicon.png"),
                                              color: Colors.black),
                                        ),
                                        fillColor: Colors.white,
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.transparent),
                                          borderRadius: BorderRadius.circular(25.7),
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: Colors.white),
                                          borderRadius: BorderRadius.circular(25.7),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(top: 20.0, left: 40.0),
                                  child: Container(

                                    alignment: Alignment.bottomCenter,
                                    child: TabBar(
                                      isScrollable: true,
                                      unselectedLabelColor: Colors.black,
                                      labelColor: Color(0xffFA4A0C),
                                      labelStyle:
                                      TextStyle(fontSize: 17, fontWeight: FontWeight.w300),
                                      tabs: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                                          child: Tab(
                                            text: 'Foods',
                                          ),
                                        ),
                                        Tab(
                                          text: 'Drinks',
                                        ),
                                        Tab(
                                          text: 'Snacks',
                                        ),
                                        Tab(
                                          text: 'Sauces',
                                        ),
                                        Tab(
                                          text: 'Drinks',
                                        ),
                                      ],
                                      controller: _tabController,
                                      indicatorSize: TabBarIndicatorSize.tab,
                                      indicatorColor: Color(0xffFA4A0C),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: TabBarView(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 35.0),
                                        child: CarouselSlider.builder(
                                          itemCount: 4,
                                          itemBuilder: (context, index, realIndex) {
                                            return InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) => DetailsPage(
                                                            selectedFood: foods[index])));
                                              },
                                              child: Stack(
                                                clipBehavior: Clip.none,
                                                children: [
                                                  Container(
                                                    height: 350,
                                                    width: 220,
                                                    child: Card(
                                                      elevation: 4.0,
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                          BorderRadius.circular(30.0)),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment.center,
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          SizedBox(
                                                            height: 130,
                                                          ),
                                                          SizedBox(
                                                            width: 120,
                                                            child: Text(foodList[index].name,
                                                                textAlign: TextAlign.center,
                                                                style: TextStyle(
                                                                    fontWeight: FontWeight.w500,
                                                                    fontSize: 22)),
                                                          ),
                                                          SizedBox(
                                                            height: 20,
                                                          ),
                                                          SizedBox(
                                                            width: 70,
                                                            child: Text(
                                                              r"$" +
                                                                  foodList[index].price.toString(),
                                                              textAlign: TextAlign.center,
                                                              style: TextStyle(
                                                                  color: Color(0xffFA4A0C),
                                                                  fontWeight: FontWeight.w600,
                                                                  fontSize: 17),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    top: -30,
                                                    left: -12,
                                                    child: Image(
                                                      image: AssetImage(foodList[index].imagepath),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                          options: CarouselOptions(
                                              height: 300.0,
                                              enableInfiniteScroll: false,
                                              autoPlay: false,
                                              initialPage: 0,
                                              enlargeCenterPage: false,
                                              viewportFraction: 0.7),
                                        ),
                                      ),
                                      Center(
                                        child: Text("Screen 2"),
                                      ),
                                      Center(
                                        child: Text("Screen 3"),
                                      ),
                                      Center(
                                        child: Text("Screen 4"),
                                      ),
                                      Center(
                                        child: Text("Screen 5"),
                                      ),
                                    ],
                                    controller: _tabController,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ))
                  )));
            },
          ),
          GestureDetector(child: Padding(padding: EdgeInsets.all(20),child: Image.asset("images/drawer.png"),),
            onHorizontalDragUpdate: (e) {
              if (e.delta.dx > 0) {
                setState(() {
                  value = 1;
                });
              } else {
                setState(() {
                  value = 0;
                });
              }
            },
            onTap: () {
              setState(() {
                value == 0 ? value = 1 : value = 0;
              });
            },
          ),
          // Gesture Detector to Open the Drawer.

        ],
      ),
    ));
  }
}



/* 
Widget foodCard(int index) => Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 320,
          width: 220,
          child: GestureDetector(
            onTap: () {},
            child: Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 130,
                  ),
                  SizedBox(
                    width: 120,
                    child: Text(foodList[index].name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 22)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 70,
                    child: Text(
                      r"$" + foodList[index].price.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xffFA4A0C),
                          fontWeight: FontWeight.w600,
                          fontSize: 17),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: -30,
          left: -12,
          child: Image(
            image: AssetImage(foodList[index].imagepath),
          ),
        ),
      ],
    );

*/
