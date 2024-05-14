import 'package:farmacy_app/features/home/data/models/cart_item_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/assets.dart';
import 'custo_button.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key, required this.cartItemModel,
  });

  final CartItemModel cartItemModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0,vertical: 8),
      child: Card(
        elevation: 1,shadowColor: Colors.grey,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
          height: 120,
          decoration: BoxDecoration(
              color: Color(0xff0FBFBFB),
              borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.withOpacity(.6)),
            boxShadow:  [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 3,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],

          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(cartItemModel.image, height: 70, width: 70),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    cartItemModel.name,
                    style: AppStyles.semiBold20(context).copyWith(color: Colors.black),
                  ),
                  Text(
                    cartItemModel.price + "EGP",
                    style: AppStyles.semiBold20(context).copyWith(color: Color(0xff58ACD4)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customAddAbstractCircleIcon(
                          icon: Icons.minimize,

                          backgroundColor: Colors.grey,
                          iconColor: Colors.black, radius: 15, onPressed: () {  }),
                      SizedBox(width: 16,),
                      Text(
                        "1",
                        style: AppStyles.bold25(context).copyWith(color: Colors.black),
                      ),
                      SizedBox(width: 16,),

                      customAddAbstractCircleIcon(
                          icon: Icons.add,
                          backgroundColor: Color(0xff407CE2),
                          iconColor: Colors.white, radius: 15, onPressed: () {  })
                    ],
                  ),
                ],
              ),
              const Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Icon(
                    CupertinoIcons.delete,  color: Colors.grey,
                    size: 30,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
