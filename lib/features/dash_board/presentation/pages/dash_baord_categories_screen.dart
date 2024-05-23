import 'package:farmacy_app/core/utils/app_styles.dart';
import 'package:farmacy_app/features/home/presentation/manager/home_provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/admin_info.dart';
import '../widgets/categories_lsit.dart';

class DashBoardCategoriesScreen extends StatelessWidget {
  const DashBoardCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
     Provider.of<HomeProvider>(context,listen: false).getAllCategories().then((value) {
       print("getAllCategories called dashBoard ========================");
     //  const Duration(seconds: 2);
     });
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 16,left: 16,top: 40),
        child: Column(
          children: [
            AdminInfo(),
            SizedBox(height: 16,),
            SizedBox(
                height:MediaQuery.of(context).size.height * 0.8,
                child:const CategoriesList())


          ]
        ),
      ),
    );
  }
}

