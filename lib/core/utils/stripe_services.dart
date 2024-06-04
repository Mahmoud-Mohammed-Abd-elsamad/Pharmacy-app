import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import '../../features/home/data/models/stripe_models/payment_ephemeral_key _model.dart';
import '../../features/home/data/models/stripe_models/payment_intent_body.dart';
import '../../features/home/data/models/stripe_models/payment_intent_model.dart';

import '../api/api_servicess.dart';
import 'api_keys.dart';


class StripeServices {
  Future<PaymentIntentModel> _createPaymentIntent(
      {required PaymentIntentBody paymentIntentBody}) async {
    try {
      log("_createPaymentIntent call ");
      ApiServices apiServices = ApiServices();
      var result = await apiServices.post(
          url: "https://api.stripe.com/v1/payment_intents",
          data: paymentIntentBody.toJson(),
          token: ApiKys.secretKey,
          contentType: Headers.formUrlEncodedContentType,);
      log("_createPaymentIntent first ${result.statusCode} ");
      if (result.statusCode == 200) {
        var paymentIntentModel = PaymentIntentModel.fromJson(result.data);
        log("_createPaymentIntent ${result.statusCode} ");

        return paymentIntentModel;
      }
      var paymentIntentModel = PaymentIntentModel();
      log("_createPaymentIntent else ${result.statusCode} ");
      return paymentIntentModel;
    } catch (e) {
      log("_createPaymentIntent catch ${e} ");
      var paymentIntentModel = PaymentIntentModel();
      return paymentIntentModel;
    }
  }

  Future<PaymentEphemeralModel> _createEphemeralKey(
      {required String customerId}) async {
    try {
      log("_createEphemeralKey call ");

      ApiServices apiServices = ApiServices();
      var result = await apiServices.post(
          url: "https://api.stripe.com/v1/ephemeral_keys",
          data: {"customer":customerId},
          contentType: Headers.formUrlEncodedContentType,
          headers: {
            'Authorization': 'Bearer ${ApiKys.secretKey}',
            "Stripe-Version": "2024-04-10"
          }, token: ApiKys.secretKey);
      if (result.statusCode == 200) {
        var paymentEphemeralModel = PaymentEphemeralModel.fromJson(result.data);
        log("_createEphemeralKey ${result.statusCode} ");

        return paymentEphemeralModel;
      } else{
        log("_createEphemeralKey else ${result.statusCode} ");
        var paymentEphemeralModel = PaymentEphemeralModel();
        return paymentEphemeralModel;
      }

    } catch (e) {
      log("_createEphemeralKey catch ${e} ");
      var paymentEphemeralModel = PaymentEphemeralModel();
      return paymentEphemeralModel;
    }
  }

  Future<void> _initPaymentSheet(
      {required PaymentIntentModel paymentIntentModel,required PaymentEphemeralModel ephemeralModel}) async {
    try {
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          // Main params
          merchantDisplayName: 'Mahmoud',
          paymentIntentClientSecret: paymentIntentModel.clientSecret,
          customerId: ApiKys.customerId,
          customerEphemeralKeySecret: ephemeralModel.secret,
        ),
      );
    } catch (e) {
      print('$e  55');
    }
  }

  Future _presentPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future<void> makePayment(PaymentIntentBody paymentIntentBody) async {
    var paymentModel =
        await _createPaymentIntent(paymentIntentBody: paymentIntentBody);
   var ephemeralKeyModel =  await _createEphemeralKey(customerId: ApiKys.customerId);

    await _initPaymentSheet(paymentIntentModel: paymentModel, ephemeralModel: ephemeralKeyModel);
    await _presentPaymentSheet();
  }
}
