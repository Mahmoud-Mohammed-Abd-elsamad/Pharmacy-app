

import 'package:dartz/dartz.dart';
import 'package:farmacy_app/core/error/failures.dart';

import '../../data/models/stripe_models/payment_intent_body.dart';


abstract class PaymentDomainRepo{

  Future<Either<FailureError,void>> makePayment(PaymentIntentBody paymentIntentBody);
}