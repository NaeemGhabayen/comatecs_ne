import 'package:flutter/material.dart';

import '../../utill/color_resources.dart';

class CustomAppBarWithMenu extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Function? onTap;
  const CustomAppBarWithMenu({Key? key, @required this.title, this.onTap })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const SizedBox(),
      centerTitle: true,
      leadingWidth: 0,
      title:  Text(
        title!,
        style: const TextStyle(
          color: ColorResources.WHITE,
          fontSize: 16,
        ),
      ),
      backgroundColor:Theme.of(context).primaryColor,
      elevation: 0,
      flexibleSpace: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.center,
        color: Theme.of(context).primaryColor,
        child: const Row(
          children: [
            SizedBox(height: 20,),
            // Text(
            //   title,
            //   style: const TextStyle(
            //     color: ColorResources.WHITE,
            //     fontSize: 16,
            //   ),
            // ),
            Spacer(),


          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
