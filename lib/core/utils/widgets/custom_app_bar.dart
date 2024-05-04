import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../app_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key, required this.title, required this.backgroundColor,  this.leading,this.actions
  });
  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60.0);
  final String title;
  final Color backgroundColor;
  final Widget? leading;
  final List<Widget>? actions;


  @override
  Widget build(BuildContext context) {
    return AppBar(

      iconTheme:IconThemeData(color: Colors.white),
      backgroundColor: AppStyles.primaryColor,
      elevation: 0,
      centerTitle: true,
      title:  Text(title,style: AppStyles.bold17(context).copyWith(color: Colors.white),),
      leading: leading  ,
      actions: actions,

    );
  }


}
