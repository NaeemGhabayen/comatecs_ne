import 'package:carousel_slider/carousel_slider.dart';
import 'package:comatecs/utill/app_constants.dart';
import 'package:comatecs/view/base/costom_404.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/categories_provider.dart';
import '../../../utill/color_resources.dart';
import '../home/widget/card_product.dart';

class SectionDetailsScreen extends StatefulWidget {
  String? title;

  SectionDetailsScreen({Key? key, this.title}) : super(key: key);

  @override
  State<SectionDetailsScreen> createState() => _SectionDetailsScreenState();
}

class _SectionDetailsScreenState extends State<SectionDetailsScreen> {
  int _current = 1;
  final int _currentReview = 1;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }

    return result;
  }

  int selected = 0;
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorResources.BACKGROUND,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Provider.of<CategoriesProvider>(context, listen: true)
                    .isLoading
                ? Center(
                    child: CircularProgressIndicator(
                      color: Theme.of(context).primaryColor,
                    ),
                  )
                : SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: const Icon(
                                  Icons.arrow_back_ios,
                                  size: 20,
                                )),
                            Text(
                              widget.title!,
                              textAlign: TextAlign.right,
                              style: const TextStyle(
                                color: Color(0xFF212121),
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Provider.of<CategoriesProvider>(context, listen: true)
                                .subCategoriesList
                                .isEmpty
                            ? const SizedBox()
                            : SizedBox(
                                height: 44,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: Provider.of<CategoriesProvider>(
                                          context,
                                          listen: false)
                                      .subCategoriesList
                                      .length,

                                  itemBuilder: (BuildContext ctx, index) {
                                    return InkWell(
                                      onTap: () {
                                        selected = index;
                                        Provider.of<CategoriesProvider>(context,
                                                listen: false)
                                            .getProductBySubCategory(
                                          context: context,
                                          id: Provider.of<CategoriesProvider>(
                                                  context,
                                                  listen: false)
                                              .subCategoriesList[index]
                                              .id
                                              .toString(),
                                        );
                                        setState(() {});
                                      },
                                      child: Center(
                                        child: Container(
                                          margin:
                                              const EdgeInsets.only(left: 10),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          alignment: Alignment.center,
                                          decoration: ShapeDecoration(
                                            color: selected == index
                                                ? Theme.of(context).primaryColor
                                                : Colors.white,
                                            shape: RoundedRectangleBorder(
                                              side: const BorderSide(
                                                  width: 1,
                                                  color: Color(0x7FE1E1E1)),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                          ),
                                          child: Text(
                                            Provider.of<CategoriesProvider>(
                                                        context,
                                                        listen: false)
                                                    .subCategoriesList[index]
                                                    .name ??
                                                '',
                                            style: TextStyle(
                                              color: selected == index
                                                  ? Colors.white
                                                  : Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                )),
                        const SizedBox(
                          height: 16,
                        ),
                        Provider.of<CategoriesProvider>(context, listen: true)
                                .isLoadingProductBySubCategory
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : Provider.of<CategoriesProvider>(
                            context,
                            listen: false)
                            .subCategoriesItems==null?const Center(
                          child: Custom404(
                            text: 'لا يوجد اي منتجات للعرض',
                          ),
                        )
                            :Column(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: MediaQuery.of(context).size.height *
                                        .20,
                                    decoration: BoxDecoration(
                                        borderRadius:const BorderRadius.all(
                                            Radius.circular(5)),
                                        image: DecorationImage(
                                          image: Provider.of<CategoriesProvider>(
                                                          context,
                                                          listen: false)
                                                      .subCategoriesItems!
                                                      .imageUrl !=
                                                  null
                                              ? NetworkImage(
                                                  '${AppConstants.BASE_URL}/images/${Provider.of<CategoriesProvider>(context, listen: false).subCategoriesItems!.imageUrl}')
                                              : const AssetImage(
                                                      "assets/images/img.png")
                                                  as ImageProvider,
                                          fit: BoxFit.fill,
                                        )),
                                  ),
                                  Container(
                                      width: MediaQuery.of(context).size.width,
                                      margin: const EdgeInsets.only(
                                          top: 24, bottom: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'جميع المنتجات',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                              height: 0,
                                            ),
                                          ),
                                        ],
                                      )),
                                  Provider.of<CategoriesProvider>(context,
                                              listen: false)
                                          .subCategoriesItems!
                                          .products!
                                          .isEmpty
                                      ? const Center(
                                          child: Custom404(
                                            text: 'لا يوجد اي منتجات للعرض',
                                          ),
                                        )
                                      : GridView.count(
                                          crossAxisCount: 2,
                                          childAspectRatio: (100 / 120),
                                          mainAxisSpacing: 16,
                                          crossAxisSpacing: 16,
                                          controller: ScrollController(
                                              keepScrollOffset: false),
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          children:
                                              Provider.of<CategoriesProvider>(
                                                      context,
                                                      listen: false)
                                                  .subCategoriesItems!
                                                  .products!
                                                  .map((value) {
                                            return CardProduct(
                                              productModel: value,
                                            );
                                          }).toList(),
                                        )
                                ],
                              )
                      ],
                    ),
                  ),
          ),
        ));
  }
}
