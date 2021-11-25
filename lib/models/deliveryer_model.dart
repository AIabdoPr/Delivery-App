class DeliveryerModel {
  final String userName, imagePath;
  final int rate;
  final List<String> deliveries;
  DeliveryerModel({
    required this.userName,
    required this.rate,
    required this.imagePath,
    required this.deliveries,
  });

  factory DeliveryerModel.fromMap(Map<String, dynamic> json) => DeliveryerModel(
        userName: json["userName"],
        imagePath: json["imagePath"],
        rate: json["rate"],
        deliveries: json["deliveries"],
      );

  Map<String, dynamic> toMap() => {
        "userName": userName,
        "imagePath": imagePath,
        "rate": rate,
        "deliveries": deliveries,
      };
}
