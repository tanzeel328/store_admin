import 'package:cloud_firestore/cloud_firestore.dart';

class Orderz {
  String address;
  Timestamp orderTime;
  List<Map<String, Object>> productz;
  int total;
  String email;

  Orderz({
    required this.address,
    required this.orderTime,
    required this.productz,
    required this.total,
    required this.email,
  });

  Map<String, Object?> toJson() {
    return {
      'address': address,
      'orderTime': orderTime,
      'products': productz,
      'total': total,
      'email': email,
    };
  }

  Orderz.fromJson(Map<String, Object?> json)
      : this(
          address: json['address']! as String,
          orderTime: json['orderTime']! as Timestamp,
          productz: (json['products'] as List<dynamic>)
              .map((item) => Map<String, Object>.from(item as Map))
              .toList(),
          total: json['total']! as int,
          email: json['email']! as String,
        );

  Orderz copyWith({
    String? address,
    Timestamp? orderTime,
    List<Map<String, Object>>? productz,
    int? total,
    String? email,
  }) {
    return Orderz(
      address: address ?? this.address,
      orderTime: orderTime ?? this.orderTime,
      productz: productz ?? this.productz,
      total: total ?? this.total,
      email: email ?? this.email,
    );
  }
}
