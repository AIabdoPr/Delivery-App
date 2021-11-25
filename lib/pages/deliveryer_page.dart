import 'package:delivery/views/map_status_view.dart';
import 'package:delivery/views/order_item_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DeliveryerPage extends StatefulWidget {
  DeliveryerPage({Key? key}) : super(key: key);

  @override
  _DeliveryerPageState createState() => _DeliveryerPageState();
}

class _DeliveryerPageState extends State<DeliveryerPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('Drawer Header'),
              ),
              ListTile(title: const Text('Item 1'), onTap: () {}),
              ListTile(title: const Text('Item 2'), onTap: () {}),
              ListTile(title: const Text('Item 3'), onTap: () {}),
            ],
          ),
        ),
        appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 150),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 40,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () => _scaffoldKey.currentState!.openDrawer(),
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
                const Spacer(),
                SizedBox(width: 100, child: MapStatusView(isOnline: true)),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_forward_ios),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 2,
                spreadRadius: 1,
                offset: const Offset(0, -0.5),
                color: Colors.black.withOpacity(0.2),
              )
            ],
          ),
          child: Row(
            children: <Widget>[
              ElevatedButton(
                onPressed: () {},
                child: const Icon(Icons.close),
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  primary: Colors.red,
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {},
                // onPressed: () => Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) =>
                //         OrderCallPage(orderModel: widget.orderModel),
                //   ),
                // ),
                child: Row(
                  children: const [
                    Text(
                      "Accept",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 4)),
                    Icon(Icons.delivery_dining_outlined)
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  primary: const Color(0XFF115056),
                ),
              ),
            ],
          ),
        ),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  const Padding(padding: EdgeInsets.symmetric(vertical: 15)),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      "assets/images/man.png",
                      fit: BoxFit.cover,
                      height: 80,
                      width: 80,
                    ),
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 4)),
                  const Text(
                    "Ahmed mohamed",
                    style: TextStyle(
                      color: Color(0XFF115056),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RatingBarIndicator(
                        rating: 4,
                        direction: Axis.horizontal,
                        itemSize: 12,
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int index) =>
                            const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                      ),
                      const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 3)),
                      const Text(
                        "4.0",
                        style: TextStyle(
                          color: Color(0XFF545454),
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0XFF115056)),
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "You will earn",
                              style: TextStyle(
                                color: Color(0XFF115056),
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15)),
                            Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: const Color(0XFF115056),
                              ),
                              child: const Text(
                                "10",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                            )
                          ],
                        ),
                        const OrderItemView(),
                        const OrderItemView(),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Row(
                      children: const [
                        Text(
                          "To:",
                          style: TextStyle(
                            color: Color(0XFF115056),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                        Text(
                          "فيلا 5, فلل الجامعة, الزقازيق",
                          style: TextStyle(
                            color: Color(0XFF545454),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Text(
                          "Total order cost :",
                          style: TextStyle(
                            color: Color(0XFF115056),
                            fontSize: 12,
                          ),
                        ),
                        Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                        Text(
                          "816  L.E",
                          style: TextStyle(
                            color: Color(0XFF115056),
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
