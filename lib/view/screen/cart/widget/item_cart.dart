import 'package:flutter/material.dart';

import '../../../../utill/images.dart';
import '../../../base/card_counter.dart';
import '../../../base/show_dialog.dart';

class ItemCart extends StatefulWidget {
  const ItemCart({Key? key, }) : super(key: key);

  @override
  State<ItemCart> createState() => _ItemCartState();
}

class _ItemCartState extends State<ItemCart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      height: 86,
      padding: const EdgeInsets.all(16),
      decoration: const ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 0.50, color: Color(0xFFE1E1E1)),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              Container(
                  margin: const EdgeInsets.only(left: 12),
                  width: MediaQuery.of(context).size.width * .13,
                  child: Image.asset(
                    'assets/images/img_1.png',
                    fit: BoxFit.fill,
                  )),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'الاسم التجاري الشائع',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(0xFF212121),
                      fontSize: 13,
                      fontFamily: 'Tajawal',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                  CardCounter(),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return ShowCustomDialog(
                            title: 'حذف المنتج من السلة',
                            desAgree: 'إلغاء',
                            textAgree: 'حذف',
                            description:
                                'هل أنت متأكد من إزالة هذا المنتج من السلة؟',
                            failed: () {
                              Navigator.pop(context);
                            },
                            ok: () {},
                          );
                        });
                  },
                  child: Image.asset(
                    Images.delete,
                    width: 20,
                    height: 20,
                    color: Colors.black26,
                  )),
              const Text(
                '16.000 JOD',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF197D47),
                  fontSize: 13,
                  fontFamily: 'Tajawal',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
