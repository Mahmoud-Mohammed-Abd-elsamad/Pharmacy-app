class EphemeralKeyBody{
  final  String customerId;
  final  String stripeVersion;

  EphemeralKeyBody({required this.customerId, required this.stripeVersion});

  Map<String, dynamic> toJson()  {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['customer'] = customerId;
    data['Stripe-Version'] = stripeVersion;
    return data;
  }





}