import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/widgets/custom_button.dart';

class ForgetPasswordVerificationWidget extends StatefulWidget {
  ForgetPasswordVerificationWidget({super.key, this.ontTape});

  final void Function()? ontTape;
  @override
  State<ForgetPasswordVerificationWidget> createState() =>
      _ForgetPasswordVerificationWidgetState();
}

class _ForgetPasswordVerificationWidgetState
    extends State<ForgetPasswordVerificationWidget> {
  List<TextEditingController> otpController =
      List.generate(6, (index) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 32,
        ),
        Center(
            child: Text("Verification Code",
                style: AppStyles.extraBold24(context)
                    .copyWith(color: const Color(0xff455A64)))),
        const SizedBox(
          height: 28,
        ),
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Enter code that we have sent yo your email",
                  style: AppStyles.regular14(context)),
              Text("example@gmail.com", style: AppStyles.regular14(context)),
            ],
          ),
        ),
        const SizedBox(
          height: 32,
        ),
        _generateTextFormField(),
        const SizedBox(
          height: 70,
        ),
        CustomButton(
          onPressed:widget.ontTape,
          text: "Submit",
          textColor: const Color(0XFF757575),
          height: 48,
          width: 320,
          backColor: Colors.grey,
        ),
        SizedBox(
          height: 30,
        ),
        Text("Resend code",
            style: AppStyles.semiBold16(context)
                .copyWith(color: Color(0xff45A2CF))),
      ],
    );
  }

  Widget _generateTextFormField() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            otpController.length,
            (index) {
              return _textFormField(index);
            },
          ),
        ),
      ],
    );
  }

  Widget _textFormField(int index) {
    return Center(
      child: SizedBox(
        height: 50,
        width: 70,
        child: TextFormField(
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          controller: otpController[index],
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(1),
          ],
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.black,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.blueAccent,
              ),
            ),
          ),
          onChanged: (value) {
            if (value.isEmpty) {
              _focusPreviousField(index);
            } else {
              _focusNextField(index + 1);
            }
          },
        ),
      ),
    );
  }

  void _focusNextField(int index) {
    if (index < 6) {
      FocusScope.of(context).nextFocus();
    }
  }

  void _focusPreviousField(int index) {
    if (index > 0) {
      FocusScope.of(context).previousFocus();
    }
  }
}
