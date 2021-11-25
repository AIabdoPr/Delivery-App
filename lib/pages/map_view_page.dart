import 'package:bottom_drawer/bottom_drawer.dart';
import 'package:delivery/views/custom_button_view.dart';
import 'package:delivery/views/custom_drawer_view.dart';
import 'package:delivery/views/delivery_path_view.dart';
import 'package:delivery/views/delivery_place_item_view.dart';
import 'package:delivery/views/location_point_view.dart';
import 'package:delivery/views/map_status_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_badged/flutter_badge.dart';

class MapViewPage extends StatefulWidget {
  @override
  _MapViewPageState createState() => _MapViewPageState();
}

class _MapViewPageState extends State<MapViewPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: CustomDrawerView(),
        body: Stack(
          children: <Widget>[
            Positioned(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image.asset(
                "assets/images/map.png",
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              top: 15,
              left: 15,
              width: 40,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  _scaffoldKey.currentState!.openDrawer();
                },
                child: const Icon(
                  Icons.menu,
                  color: Color(0XFF115056),
                  size: 20,
                ),
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(
                    side: BorderSide(color: Color(0XFF115056)),
                  ),
                  padding: const EdgeInsets.all(10),
                  primary: const Color(0XFFFFFFFF),
                ),
              ),
            ),
            Positioned(
              top: 15,
              width: 100,
              left: (MediaQuery.of(context).size.width / 2) - 50,
              child: MapStatusView(isOnline: false),
            ),
            Positioned(
              top: 15,
              right: 15,
              width: 40,
              height: 40,
              child: ElevatedButton(
                onPressed: () {},
                child: FlutterBadge(
                  icon: const Icon(
                    Icons.notifications,
                    color: Color(0XFFF5A832),
                    size: 25,
                  ),
                  itemCount: 2,
                ),
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(5),
                  primary: const Color(0XFF115056),
                ),
              ),
            ),
            LocationPointView(top: 280, left: 150),
            LocationPointView(top: 135, left: 350, radius: 45, isFocus: true),
            LocationPointView(top: 290, left: 365),
            _buildBottomDrawer(context),
          ],
        ),
      ),
    );
  }
}

double _headerHeight = 25;
double _bodyHeight = 295;
BottomDrawerController _controller = BottomDrawerController();

Widget _buildBottomDrawer(BuildContext context) {
  return BottomDrawer(
    header: _buildBottomDrawerHead(context),
    body: _buildBottomDrawerBody(context),
    headerHeight: _headerHeight,
    drawerHeight: _bodyHeight,
    color: Colors.transparent,
    controller: _controller,
  );
}

Widget _buildBottomDrawerHead(BuildContext context) {
  return Container(
    height: _headerHeight,
    width: MediaQuery.of(context).size.width,
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
      ),
      boxShadow: [
        BoxShadow(
          blurRadius: 1,
          spreadRadius: 1,
          offset: Offset(0, -0.2),
          color: Color(0XCC545454),
        )
      ],
    ),
    child: FractionallySizedBox(
      widthFactor: 0.5,
      heightFactor: 0.2,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color(0XFFC9C9C9),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  );
}

Widget _buildBottomDrawerBody(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: _bodyHeight,
    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
    color: Colors.white,
    child: SingleChildScrollView(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          DeliveryPathView(
            placesCount: 5,
            currentPlace: 1,
            size: Size(50, 5 * 60),
          ),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
          SizedBox(
            width: MediaQuery.of(context).size.width - 95,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    const Text(
                      "Your Place",
                      style: TextStyle(
                        color: Color(0XFF115056),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0XFFF5A832)),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: const <Widget>[
                          Text(
                            "You will earn:",
                            style: TextStyle(
                              color: Color(0XFF115056),
                              fontSize: 10,
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 2.5)),
                          Text(
                            "50",
                            style: TextStyle(
                                color: Color(0XFF115056),
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 1.5)),
                          Text(
                            "LE",
                            style: TextStyle(
                                color: Color(0XFF115056),
                                fontSize: 8,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                DeliveryPlaceItemView(isDone: true),
                DeliveryPlaceItemView(isDone: true, isonGettingImage: true),
                DeliveryPlaceItemView(),
                Row(
                  children: <Widget>[
                    const Text(
                      "Done",
                      style: TextStyle(
                        color: Color(0XFF115056),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    CustomButton(
                      onPressed: () {},
                      isElevated: true,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 5),
                      child: const Text(
                        "Done",
                        style: TextStyle(
                          color: Color(0XFF545454),
                          fontSize: 10,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}
