import 'dart:convert';

class Subscription {
  final String plan;
  final String status;
  final String paymentMethod;
  final String term;

  Subscription({
    required this.plan,
    required this.status,
    required this.paymentMethod,
    required this.term,
  });

  Subscription copyWith({
    String? plan,
    String? status,
    String? paymentMethod,
    String? term,
  }) =>
      Subscription(
        plan: plan ?? this.plan,
        status: status ?? this.status,
        paymentMethod: paymentMethod ?? this.paymentMethod,
        term: term ?? this.term,
      );

  factory Subscription.fromRawJson(String str) =>
      Subscription.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Subscription.fromJson(Map<String, dynamic> json) => Subscription(
        plan: json["plan"],
        status: json["status"],
        paymentMethod: json["payment_method"],
        term: json["term"],
      );

  Map<String, dynamic> toJson() => {
        "plan": plan,
        "status": status,
        "payment_method": paymentMethod,
        "term": term,
      };
}
