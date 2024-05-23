import 'package:farmacy_app/core/utils/widgets/push_snack_par.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_styles.dart';

class ShowAlertDialog {

 static final nameTextEditingController = TextEditingController();
 static final priceTextEditingController = TextEditingController();
 static final quantityTextEditingController = TextEditingController();
 static final formKey1 = GlobalKey<FormState>();
 static final formKey2 = GlobalKey<FormState>();
 static final formKey3 = GlobalKey<FormState>();

  static showAlertDialog(BuildContext context,{required String title,required void Function()? onPressed,required String buttonText,required bool isImageNeeded, void Function()? onPressedImagePicker}) {
    AlertDialog alert = AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(title,style: AppStyles.semiBold20(context).copyWith(color: Colors.black),),
          const SizedBox(
            height: 32,
          ),
           CustomTextField(
            title: 'Name',
            textInputType: TextInputType.text, controller: nameTextEditingController, formKey: formKey1,
          ),
          const SizedBox(
            height: 16,
          ),
           CustomTextField(
            title: 'Price', controller: priceTextEditingController, formKey: formKey2,
          ),
          const SizedBox(
            height: 16,
          ),
           CustomTextField(
            title: 'Quantity', controller: quantityTextEditingController, formKey: formKey3,
          ),
        ],
      ),
      actions: [
        Center(
            child: Row(
              children: [
              isImageNeeded ?
              ElevatedButton(
                  onPressed: onPressedImagePicker,
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      backgroundColor:
                      MaterialStateProperty.all(AppStyles.secondaryColor)),
                  child: Text(
                    "Choose Image",
                    style: AppStyles.semiBold20(context).copyWith(color: Colors.white),
                  ),
                ): SizedBox(),
                SizedBox(width: 8,),
                ElevatedButton(
                  onPressed: (){
                    if(formKey1.currentState!.validate() && formKey2.currentState!.validate() && formKey3.currentState!.validate()){
                      formKey1.currentState!.save();
                      formKey2.currentState!.save();
                      formKey3.currentState!.save();
                      SnackBarClass.pushSnackPar(context, text:"  Loading...");
                      onPressed!();
                    }
                  },
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      backgroundColor:
                      MaterialStateProperty.all(AppStyles.secondaryColor)),
                  child: Text(
                    buttonText,
                    style: AppStyles.semiBold20(context).copyWith(color: Colors.white),
                  ),
                ),
              ],
            ))
      ],
    );

    // show the dialog
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }

}




class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.title, this.textInputType,required this.controller, required this.formKey,
  });

  final String title;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Row(children: [
        Text(
          title+" : ",
          style: AppStyles.semiBold17(context).copyWith(color: Colors.black),
        ),
        SizedBox(
          width: 100,
          child: Column(
            children: [
              TextFormField(
                validator: (value)
                {
                  if (value!.isEmpty) {
                    return 'this field is required';
                  }
                  return null;
                },
                keyboardType:textInputType ?? TextInputType.number,
                controller: controller,
              ),
            ],
          ),
        )
      ]),
    );
  }
}

