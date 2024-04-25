import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListViewItem extends StatelessWidget {
  const ListViewItem({
    super.key,
    required this.egyptGovernorates, required this.index,
  });

  final List<String> egyptGovernorates;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(
          color: Colors.grey.withOpacity(.5),
          thickness: .2,
          endIndent: 15,
          indent: 15,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(egyptGovernorates[index]),
        ),


      ],
    );
  }
}
