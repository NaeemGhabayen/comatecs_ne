import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/categories_provider.dart';
import '../../../utill/color_resources.dart';
import '../home/widget/card_product.dart';

class SectionDetailsScreen extends StatefulWidget {
  String? title;
   SectionDetailsScreen({Key? key ,this.title}) : super(key: key);

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

  final List _list = ['1', '2', '2', '2'];
  final List<String> _lists = ['1', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2'];

  // List<String> list = [
  //   'الكل',
  //   'مولدات كهربائية',
  //   'معدات صناعية',
  //   'عدد يدوية',
  //   'عدد',
  //   'المجموعة'
  // ];
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
                                  print("sssssssssss");
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
                        Provider.of<CategoriesProvider>(context, listen: false)
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
                                  // list item builder
                                  itemBuilder: (BuildContext ctx, index) {
                                    return InkWell(
                                      onTap: () {
                                        selected = index;
                                        setState(() {});
                                      },
                                      child: Center(
                                        child: Container(
                                          margin: const EdgeInsets.only(left: 10),
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
                        CarouselSlider(
                          options: CarouselOptions(
                              height: MediaQuery.of(context).size.height * .20,
                              viewportFraction: .85,
                              initialPage: 1,
                              enableInfiniteScroll: false,
                              reverse: false,
                              enlargeCenterPage: true,
                              autoPlayInterval: const Duration(seconds: 3),
                              autoPlayAnimationDuration:
                                  const Duration(milliseconds: 800),
                              autoPlayCurve: Curves.easeInBack,
                              scrollDirection: Axis.horizontal,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  _current = index;
                                });
                              }),
                          items: _list.map((index) {
                            return Builder(
                              builder: (BuildContext context) {
                                return SingleChildScrollView(
                                  child: Container(
                                    width: double.infinity,
                                    height: MediaQuery.of(context).size.height *
                                        .20,
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/img.png"),
                                          fit: BoxFit.fill,
                                        )),
                                    child: Stack(children: [
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 12, vertical: 8),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: map<Widget>(
                                              _list,
                                              (index, url) {
                                                return Container(
                                                  width: _current == index
                                                      ? 20
                                                      : 8,
                                                  height: 8.0,
                                                  margin: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 2,
                                                      vertical: 10.0),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                10)),
                                                    color: _current == index
                                                        ? Colors.white
                                                        : const Color(0x661C1C1C),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      )
                                      // Positioned(top: 0,left: 0,right: 0,child: Image.asset('assets/images/img.png' ,fit: BoxFit.fill,),),
                                    ]),
                                  ),
                                );
                              },
                            );
                          }).toList(),
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.only(top: 24, bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'جميع المنتجات',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    height: 0,
                                  ),
                                ),
                              ],
                            )),
                        GridView.count(
                          crossAxisCount: 2,
                          childAspectRatio: (100 / 120),
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                          controller: ScrollController(keepScrollOffset: false),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          children: _lists.map((String value) {
                            return  const CardProduct();
                          }).toList(),
                        )
                      ],
                    ),
                  ),
          ),
        ));
  }
}
