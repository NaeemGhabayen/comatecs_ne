import 'package:comatecs/data/model/response/favorite_product_model.dart';
import 'package:comatecs/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/auth_provider.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/images.dart';
import '../home/widget/card_product.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ProductProvider>(context, listen: false).getFavoriteProductList(
        context,
        Provider.of<AuthProvider>(context, listen: false).getUserId()!);
  }

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
                    Image.asset(
                      Images.logo,
                      width: 24,
                      height: 24,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Text(
                      'المفضلة',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF212121),
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                Provider.of<ProductProvider>(context, listen: true).isLoading
                    ? Center(
                        child: CircularProgressIndicator(
                          color: Theme.of(context).primaryColor,
                        ),
                      )
                    : GridView.count(
                        crossAxisCount: 2,
                        childAspectRatio: (100 / 120),
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        controller: ScrollController(keepScrollOffset: false),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: Provider.of<ProductProvider>(context, listen: false).favoriteProductList.map((FavoriteProductModel value) {
                          return  CardProduct(productModel:value.product ,);
                        }).toList(),
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
