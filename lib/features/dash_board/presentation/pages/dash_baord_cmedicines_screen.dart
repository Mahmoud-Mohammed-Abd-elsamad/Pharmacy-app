import 'dart:developer';

import 'package:farmacy_app/core/utils/app_styles.dart';
import 'package:farmacy_app/core/utils/widgets/push_snack_par.dart';
import 'package:farmacy_app/features/home/presentation/manager/home_provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../congfig/routes/routes.dart';
import '../../../../core/utils/cach_helper.dart';
import '../../../home/data/models/category_model.dart';
import '../../../home/data/models/item_model.dart';
import '../../../home/data/models/medicine_body.dart';
import '../../../home/presentation/widgets/custom_head_table_information_of_medicines.dart';
import '../widgets/DashBoardMedicineData.dart';
import '../widgets/custom_alert_dialog.dart';
import '../widgets/custom_circle_button.dart';

class DashBoardMedicinesScreen extends StatelessWidget {
  const DashBoardMedicinesScreen(
      {super.key, required this.items, required this.selectedCategory});

  final List<SelectedCategoryItemModel> items;

  final CategoryModel selectedCategory;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HomeProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          selectedCategory.name ?? "",
          style: AppStyles.semiBold20(context)
              .copyWith(color: const Color(0xff5C6E77)),
        ),
        actions: [
          CustomCircleButton(
            icon: Icons.add,
            onTap: () async {
              log("log caled");
              ShowAlertDialog.showAlertDialog(context,
                  title: "Add New Medicine",
                  onPressed: () async {
                    //Cll the add new medicine method
                    //  provider.pickImageFromGallery();
                    if (provider.pickedImage == null) {
                      SnackBarClass.pushSnackPar(context,
                          text: "Please chose an image");
                      return;
                    }

                    await provider.createMedicineInSpecificCategory(
                        medicineBody: MedicineBody(
                            photo: provider.pickedImage!,
                            name: ShowAlertDialog
                                .nameTextEditingController.value.text,
                            description: ShowAlertDialog
                                .nameTextEditingController.value.text,
                            price: ShowAlertDialog
                                .priceTextEditingController.value.text,
                            medicineQuantity: ShowAlertDialog
                                .quantityTextEditingController.value.text,
                            categoryId:
                                selectedCategory.categoryId.toString()));
                    if (provider.createMedicineSuccess && context.mounted) {
                      SnackBarClass.pushSnackPar(context,
                          text: "Medicine Added Successfully");
                    }
                    await provider.getMedicinesByCategoryId(
                        selectedCategory.categoryId.toString());
                    Navigator.pop(context);
                  },
                  buttonText: "Add",
                  isImageNeeded: true,
                  onPressedImagePicker: () async {
                    log("log caled");
                    await provider.pickImageFromGallery();
                  });
            },
            iconSize: 32,
            backgroundColor: Colors.white,
            iconColor: AppStyles.secondaryColor,
          ),
          SizedBox(
            width: 10,
          ),
          SizedBox(
            width: 10,
          ),
          Transform.rotate(
            angle: 1.56 * 2,
            child: CustomCircleButton(
              icon: Icons.logout,
              onTap: () {
                log("logg icon called");
                log("logg icon called");

                ShowAlertDialog.showLogoutAlertDialog(context, onPressed: (){
                  CachHelper.deleteAdmin();
                  CachHelper.deleteUserId();
                  log("logg yes called");
                  Navigator.pushNamedAndRemoveUntil(context, Routes.loginScreen, (route) => false);
                });
              },
              iconSize: 21,
              backgroundColor: AppStyles.secondaryColor,
              iconColor: Colors.white,
            ),
          ),
          SizedBox(
            width: 16,
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 32,
          ),
          const CustomHeadTableInformationOfMedicines(),
          DashBoardMedicineData(
            medicines: context.watch<HomeProvider>().medicines.isEmpty
                ? items
                : provider.medicines,
            selectedCategory: selectedCategory,
          )
        ],
      ),
    );
  }
}
