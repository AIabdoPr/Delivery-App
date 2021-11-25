import 'package:delivery/models/order_model.dart';
import 'package:delivery/views/map_status_view.dart';
import 'package:delivery/views/orders_item_view.dart';
import 'package:delivery/views/selection_list_view.dart';
import 'package:flutter/material.dart';

class OrdersPage extends StatefulWidget {
  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
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
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FractionallySizedBox(
                widthFactor: 0.8,
                child: SelectionListView(
                  items: const ["Notifiactions", "Orders Now", "History"],
                  onSelect: (int index) {},
                ),
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 20)),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.6,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 1,
                        spreadRadius: 1,
                        color: Colors.black38,
                        offset: Offset(1, 1),
                      )
                    ]),
                child: ListView.builder(
                  itemCount: 100,
                  itemBuilder: (context, index) => OrdersItemView(
                    isActive: index % 4 <= 1,
                    orderModel: OrderModel(
                      userName: "Ahmed mohamed",
                      imagePath: "assets/images/man.png",
                      from: "بجوار كلية العلوم, بنها",
                      to: "شارع 5, الزراعة, الزقازيق",
                      type: "delivrry",
                      rate: 4,
                      orders: List.generate(
                          45, (index) => "order " + index.toString()),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
