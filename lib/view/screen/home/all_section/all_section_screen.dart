import 'package:comatecs/view/screen/home/all_section/widget/item_section.dart';
import 'package:flutter/material.dart';

import '../../../../utill/color_resources.dart';

class AllSectionScreen extends StatefulWidget {
  const AllSectionScreen({key});

  @override
  State<AllSectionScreen> createState() => _AllSectionScreenState();
}

class _AllSectionScreenState extends State<AllSectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorResources.BACKGROUND,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                              child: Icon(
                            Icons.arrow_back_ios,
                            size: 20,
                          ))),
                      const Text(
                        'جميع الأقسام',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xFF212121),
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  ListView.builder(
                    itemCount: 10,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext ctx, index) {
                      return ItemSection();
                    },
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
