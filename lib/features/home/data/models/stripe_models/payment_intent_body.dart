class PaymentIntentBody {
  final String amount;
   final String currency;
   final String customerId;

  PaymentIntentBody({
    required this.customerId,
  required this.amount, required this.currency});

 Map<String,dynamic> toJson(){
   return{
     "amount": amount,
     "currency":currency,
     "customer":customerId
   };
  }
}