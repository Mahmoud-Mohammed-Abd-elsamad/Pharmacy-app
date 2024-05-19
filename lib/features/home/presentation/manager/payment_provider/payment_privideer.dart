import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:farmacy_app/core/error/failures.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../core/utils/stripe_services.dart';
import '../../../data/models/stripe_models/payment_intent_body.dart';
import '../../../data/repositories/payment_data_repo.dart';
import '../../../domain/repositories/payment_domain_repo.dart';

class PaymentProvider extends ChangeNotifier {
  PaymentProvider(this.stripeServices);

  StripeServices stripeServices;

  bool isLoading = false;
  bool isPaymentSuccess = false;

  Future makePayment(PaymentIntentBody paymentIntentBody) async {
    final PaymentDomainRepo domainRepo = PaymentDataRepo(stripeServices);

    isLoading = true;
    log("PaymentProvider loading $isLoading");
    notifyListeners();
    Either<FailureError, void> result =
        await domainRepo.makePayment(paymentIntentBody);

    result.fold((left) {
      log("PaymentProvider error 44  ${left.message}");
      isPaymentSuccess = false;
      isLoading = false;
      notifyListeners();
    }, (right) {
      log("PaymentProvider success >>>>>>>>>>>> }");

      isPaymentSuccess = true;
      isLoading = false;
      log("PaymentProvider loading ${isLoading}");

      notifyListeners();
    });
  }
}
