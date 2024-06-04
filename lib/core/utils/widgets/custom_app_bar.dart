import 'package:farmacy_app/core/utils/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../app_styles.dart';

class CustomAppBarA extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBarA({
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
      backgroundColor: backgroundColor ,
      elevation: 0,
      centerTitle: true,
      title:  Text(title,style: AppStyles.bold17(context).copyWith(color: Colors.white),),
      leading: leading  ,
      actions: actions,

    );
  }


}
class CustomAppBar extends StatelessWidget  implements PreferredSizeWidget {
  const CustomAppBar({
    super.key, required this.onPressed,
  });

  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(
        color: Colors.white, //change your color here
      ),
      backgroundColor: AppStyles.secondaryColor,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPicture.asset(Assets.iconAppBarrLogo, height: 40,width: 10,)
        ],
      ),
      actions: [IconButton(onPressed:onPressed , icon: Icon(Icons.menu,color: Colors.white,))],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60.0);
}

