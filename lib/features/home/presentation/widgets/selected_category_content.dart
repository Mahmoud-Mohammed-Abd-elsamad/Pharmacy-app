import 'package:farmacy_app/core/utils/assets.dart';
import 'package:farmacy_app/core/utils/widgets/custom_background_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/widgets/custom_app_bar.dart';
import '../../data/models/item_model.dart';

class SelectedCategoryContent extends StatelessWidget {
  SelectedCategoryContent({
    super.key,
  });

  List<ItemModel> items = [
    ItemModel(image: Assets.imageTestData, name: "P55anadol", price: "22 LE"),
    ItemModel(image: Assets.imageTestData3, name: "P55anadol", price: "22 LE"),
    ItemModel(image: Assets.imageTestData3, name: "P55anadol", price: "22 LE"),
    ItemModel(image: Assets.imageTestData, name: "P55anadol", price: "22 LE"),
    ItemModel(image: Assets.imageTestData3, name: "P55anadol", price: "22 LE"),
    ItemModel(image: Assets.imageTestData3, name: "P55anadol", price: "22 LE"),
  ];

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children:[

        CustomAppBar(title: 'Selected Category Name', backgroundColor: Colors.black,),

        Expanded(
          child: Container(
          color: AppStyles.primaryColor,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [

                AspectRatio(
                  aspectRatio: 350/45,
                  child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                          fillColor: Color(0xffF6F2F2),
                          filled: true,
                          hintText: "Search00",
                          prefixIcon: Icon(Icons.search),
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.grey),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(25),
                          ))),
                ),
                SizedBox(height: 0),
                Expanded(
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 159 / 236,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 32),
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return CustomBackgroundContainer(
                          horizontalPadding: 15,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                AspectRatio(
                                    aspectRatio: 122 / 119,
                                    child: Image.asset(
                                      items[index].image,
                                      fit: BoxFit.fill,
                                    )),
                                SizedBox(
                                  height: 15,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 4.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        items[index].name,
                                        style: AppStyles.bold12(context),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        items[index].price,
                                        style: AppStyles.regular12(context),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                AspectRatio(
                                  aspectRatio: 118 / 32,
                                  child: ElevatedButton(
                                      onPressed: () {},
                                      child: Text(
                                        "Add to cart",
                                        style: AppStyles.semiBold12(context),
                                      ),
                                      style: ElevatedButton.styleFrom(

                                        backgroundColor: Color(0xff0194E2),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(5)),
                                      )),
                                ),
                              ]),
                        );
                      }),
                )
              ],
            ),
          ),
                ),
        ),]
    );
  }
}
