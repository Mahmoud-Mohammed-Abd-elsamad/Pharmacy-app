

import 'package:dartz/dartz.dart';
import 'package:farmacy_app/core/error/failures.dart';

import '../../../../core/utils/stripe_services.dart';
import '../../domain/repositories/payment_domain_repo.dart';
import '../models/stripe_models/payment_intent_body.dart';

class PaymentDataRepo extends PaymentDomainRepo{
  PaymentDataRepo(this.stripeServices);

  final StripeServices stripeServices;

  @override
  Future<Either<FailureError, void>> makePayment(PaymentIntentBody paymentIntentBody) async{
    try{
     var result = await stripeServices.makePayment(paymentIntentBody);

      return  Right(result);
    } catch(e){
      return Left(FailureError(e.toString()));
    }
  }


}