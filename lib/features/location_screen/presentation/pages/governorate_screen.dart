import 'package:farmacy_app/core/utils/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/governorates_list_view_item.dart';

class GovernorateScreen extends StatelessWidget {
  const GovernorateScreen({super.key});

  static  List<String> egyptGovernorates = getEgyptGovernoratesList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: egyptGovernorates.length,
          itemBuilder: (context, index) =>
              InkWell(
                  onTap: (){
                    Navigator.pop(context, egyptGovernorates[index]);
                  },
                  child: ListViewItem(egyptGovernorates: egyptGovernorates, index: index,))),
    );
  }
}

 List<String> getEgyptGovernoratesList(){
  return [
    'Alexandria',
    'Aswan',
    'Asyut',
    'Beheira',
    'Beni Suef',
    'Cairo',
    'Dakahlia',
    'Damietta',
    'Faiyum',
    'Gharbia',
    'Giza',
    'Ismailia',
    'Kafr El Sheikh',
    'Luxor',
    'Matrouh',
    'Minya',
    'Monufia',
    'New Valley',
    'North Sinai',
    'Port Said',
    'Qalyubia',
    'Qena',
    'Red Sea',
    'Sharqia',
    'Sohag',
    'South Sinai',
    'Suez',
  ];
}
