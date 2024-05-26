import 'dart:developer';

import 'package:farmacy_app/core/utils/app_styles.dart';
import 'package:farmacy_app/core/utils/assets.dart';
import 'package:farmacy_app/features/home/data/models/category_model.dart';
import 'package:farmacy_app/features/home/data/models/medicine_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/widgets/push_snack_par.dart';
import '../../../home/data/models/add_item_to_cart_model.dart';
import '../../../home/data/models/item_model.dart';
import '../../../home/presentation/manager/home_provider/provider.dart';
import 'custom_alert_dialog.dart';

class DashBoardMedicineData extends StatelessWidget {
  DashBoardMedicineData(
      {super.key, required this.medicines, required this.selectedCategory});

  final List<SelectedCategoryItemModel> medicines;
  final CategoryModel selectedCategory;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HomeProvider>(context);
    return SizedBox(
      height: MediaQuery.of(context).size.height * (0.77),
      child: ListView.builder(
          itemCount: medicines.length,
          itemBuilder: (context, index) {
            return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              _customContainer(
                  child: Stack(children: [
                const AspectRatio(
                  aspectRatio: 71 / 75,
                  child: Center(
                      child: SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            color: AppStyles.primaryColor,
                            strokeWidth: 3,
                          ))),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: Image.network(medicines[index].photo ??
                        "https://roshetta.azurewebsites.net/Assets\\20245862sasa.jpg"),
                  ),
                ),
              ])),
              _customContainer(
                  child: Text(
                medicines[index].name!,
                overflow: TextOverflow.ellipsis,
              )),
              _customContainer(child: Text("${medicines[index].price!}.LE")),
              _customContainer(
                  child: Text(medicines[index].medicineQuantity.toString())),
              // itemQua
              _customContainer(
                  child: FittedBox(
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        FontAwesomeIcons.edit,
                        color: AppStyles.secondaryColor,
                      ),
                      onPressed: () {
                        ShowAlertDialog.showAlertDialog(
                          context,
                          title: 'Edit  ${medicines[index].name} medicine',
                          onPressed: () async {
                            SnackBarClass.pushSnackPar(context,
                                text: "  Loading .....");

                            await provider.updateMedicineInSpecificCategory(
                                medicineBody: MedicineBody(
                                    id: medicines[index].medicineId.toString(),
                                    photo: provider.pickedImage ?? null,
                                    name: ShowAlertDialog
                                        .nameTextEditingController.value.text,
                                    description: ShowAlertDialog
                                        .nameTextEditingController.value.text,
                                    price: ShowAlertDialog
                                        .priceTextEditingController.value.text,
                                    medicineQuantity: ShowAlertDialog
                                        .quantityTextEditingController
                                        .value
                                        .text,
                                    categoryId: selectedCategory.categoryId
                                        .toString()));
                            log("updateMedicineSuccess  ${provider.updateMedicineSuccess} ========================");
                            if (provider.updateMedicineSuccess &&
                                context.mounted) {
                              await provider.getMedicinesByCategoryId(
                                  selectedCategory.categoryId.toString());
                              SnackBarClass.pushSnackPar(context,
                                  text: "Medicine Updated Successfully");
                            } else if (context.mounted) {
                              SnackBarClass.pushSnackPar(context,
                                  text: "Failed To Update Medicine");
                            }

                            Navigator.pop(context);
                          },
                          buttonText: "Edit",
                          isImageNeeded: true,
                          onPressedImagePicker: () async {
                            log("log apdate Medcicne image called  ========================");
                            await provider.pickImageFromGallery();
                          },
                        );
                      },
                    ),
                    IconButton(
                      icon: const Icon(
                        CupertinoIcons.delete,
                        color: Colors.red,
                      ),
                      onPressed: () async {
                        //delete item
                        await provider.deleteMedicineInSpecificCategory(
                            medicineId: medicines[index].medicineId.toString());
                        if (provider.deleteMedicineSuccess && context.mounted) {
                          SnackBarClass.pushSnackPar(context,
                              text: "Medicine delete success");
                          await provider.getMedicinesByCategoryId(
                              selectedCategory.categoryId.toString());
                        } else if (context.mounted) {
                          SnackBarClass.pushSnackPar(context,
                              text:
                                  "Failed to delete ${medicines[index].name.toString()} ");
                        }
                      },
                    ),
                  ],
                ),
              )),
            ]);
          }),
    );
  }

  _customContainer({required Widget child}) {
    return SizedBox(
      height: 57,
      child: AspectRatio(
        aspectRatio: 71 / 57,
        child: Container(
          padding: EdgeInsets.all(1),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
          ),
          child: Center(child: child),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.title,
    this.textInputType,
  });

  final String title;
  final TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text(
        title,
        style: AppStyles.semiBold17(context).copyWith(color: Colors.black),
      ),
      SizedBox(
        height: 15,
        width: 100,
        child: TextField(
          keyboardType: textInputType ?? TextInputType.number,
        ),
      )
    ]);
  }
}

class MedicineDataModel {
  String? name;
  String? price;
  String? image;
  int? itemQuantity;

  MedicineDataModel({this.name, this.price, this.image, this.itemQuantity});
}
