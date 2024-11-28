import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utill/color_resources.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final VoidCallback? onTap;
  final bool? withArrow;

  const CustomAppBar(
      {Key? key, @required this.title, this.onTap, this.withArrow = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const SizedBox(),
      centerTitle: true,
      leadingWidth: 0,
      title: Text(
        title!,
        style: const TextStyle(
          color: ColorResources.WHITE,
          fontSize: 16,
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      elevation: 0,
      flexibleSpace: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.center,
        color: Theme.of(context).primaryColor,
        child: Row(
          children: [
            withArrow!
                ? Container(
                    height: MediaQuery.of(context).size.height,
                    alignment: Alignment.center,
                    child: InkWell(
                      onTap: onTap ??
                          () {
                            Navigator.of(context).pop();
                          },
                      child: const Icon(
                        CupertinoIcons.back,
                        color: ColorResources.WHITE,
                      ),
                    ),
                  )
                : const SizedBox(),

            // Text(
            //   title,
            //   style: const TextStyle(
            //     color: ColorResources.WHITE,
            //     fontSize: 16,
            //   ),
            // ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
