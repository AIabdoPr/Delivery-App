class OrderModel {
  final String userName, imagePath, from, to, type;
  final int rate;
  final List<String> orders;
  OrderModel({
    required this.userName,
    required this.imagePath,
    required this.from,
    required this.to,
    required this.type,
    required this.rate,
    required this.orders,
  });

  factory OrderModel.fromMap(Map<String, dynamic> json) => OrderModel(
        userName: json["userName"],
        imagePath: json["imagePath"],
        from: json["from"],
        to: json["to"],
        type: json["type"],
        rate: json["rate"],
        orders: json["orders"],
      );

  Map<String, dynamic> toMap() => {
        "userName": userName,
        "imagePath": imagePath,
        "from": from,
        "to": to,
        "type": type,
        "rate": rate,
        "orders": orders,
      };
}
