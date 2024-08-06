import 'package:carousel_slider/carousel_slider.dart';
import 'package:comatecs/data/model/response/product_model.dart';
import 'package:comatecs/provider/product_provider.dart';
import 'package:comatecs/utill/app_constants.dart';
import 'package:comatecs/utill/navigation.dart';
import 'package:comatecs/view/base/custom_snackbar.dart';
import 'package:comatecs/view/screen/home/widget/card_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../provider/adverstiment_provider.dart';
import '../../../provider/categories_provider.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/images.dart';
import '../section_details/section_details_screen.dart';
import 'all_section/all_section_screen.dart';
import 'widget/fillter_model_sheet.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _current = 0;
  int _currentReview = 1;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }

    return result;
  }

  // List<String> list = [
  //   'الأدوات والمعدات',
  //   'معدات صناعية',
  //   'عدد يدوية',
  //   'المجموعة'
  // ];
  int selected = 0;
  bool isFavorite = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Provider.of<CategoriesProvider>(context, listen: false).getCategoriesList(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.BACKGROUND,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Provider.of<AdvertisementProvider>(context, listen: true)
                        .isLoading ||
                    Provider.of<ProductProvider>(context, listen: true)
                        .isLoading ||
                    Provider.of<CategoriesProvider>(context, listen: true)
                        .isLoading
                ? Center(
                    child: CircularProgressIndicator(
                      color: Theme.of(context).primaryColor,
                    ),
                  )
                : Column(
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
                            'تسوق معنا',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF212121),
                              fontSize: 16,
                              fontFamily: 'Tajawal',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 48,
                              width: MediaQuery.of(context).size.width * .7,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                    width: .8,
                                    strokeAlign: BorderSide.strokeAlignOutside,
                                    color: Color(0x7FE1E1E1),
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              child: TextField(
                                onTap: () {},
                                decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.only(top: 14),
                                    prefixIcon: Icon(Icons.search),
                                    border: InputBorder.none,
                                    hintText: 'بحث عن اسم المنتج ',
                                    hintStyle: TextStyle(
                                      color: Color(0x66212121),
                                      fontSize: 12,
                                      fontFamily: 'Tajawal',
                                      fontWeight: FontWeight.w400,
                                    ),
                                    enabledBorder: InputBorder.none),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  builder: (context) {
                                    return const FractionallySizedBox(
                                      child: FilterModelSheet(),
                                    );
                                  });
                            },
                            child: Container(
                              width: 50,
                              height: 48,
                              decoration: ShapeDecoration(
                                color: Color(0xFF197D47),
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      width: 0.50, color: Color(0x7FE1E1E1)),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              child: Center(
                                child: SvgPicture.asset(Images.filter),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Provider.of<AdvertisementProvider>(context, listen: false)
                              .advertisementList
                              .isEmpty
                          ? SizedBox()
                          : CarouselSlider(
                              options: CarouselOptions(
                                  height:
                                      MediaQuery.of(context).size.height * .23,
                                  viewportFraction:
                                      MediaQuery.of(context).size.width > 700
                                          ? 0.5
                                          : 1,
                                  initialPage: 0,
                                  enableInfiniteScroll: true,
                                  reverse: false,
                                  autoPlayInterval: Duration(seconds: 3),
                                  autoPlayAnimationDuration:
                                      Duration(milliseconds: 800),
                                  autoPlayCurve: Curves.bounceIn,
                                  scrollDirection: Axis.horizontal,
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      _current = index;
                                    });
                                  }),
                              items: Provider.of<AdvertisementProvider>(context,
                                      listen: false)
                                  .advertisementList
                                  .map((index) {
                                return Builder(
                                  builder: (BuildContext context) {
                                    return Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: Column(
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .23,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5)),
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                      '${AppConstants.BASE_URL}/images/${index.imageUrl}'),
                                                  fit: BoxFit.fill,
                                                )),
                                            child: Stack(children: [
                                              Align(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                child: Container(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 12,
                                                      vertical: 8),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: map<Widget>(
                                                      Provider.of<AdvertisementProvider>(
                                                              context,
                                                              listen: false)
                                                          .advertisementList,
                                                      (index, url) {
                                                        return Container(
                                                          width:
                                                              _current == index
                                                                  ? 20
                                                                  : 8,
                                                          height: 8.0,
                                                          margin:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal: 2,
                                                                  vertical:
                                                                      10.0),
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            10)),
                                                            color: _current ==
                                                                    index
                                                                ? Colors.white
                                                                : Color(
                                                                    0x661C1C1C),
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
                                        ],
                                      ),
                                    );
                                  },
                                );
                              }).toList(),
                            ),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(top: 24, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'الأقسام',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF212121),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Provider.of<CategoriesProvider>(context,
                                          listen: false)
                                      .getCategoriesList(context);
                                  AppNavigation.navigateTo(
                                      context, const AllSectionScreen());
                                },
                                child: const Text(
                                  'مشاهدة الكل',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xCC197D47),
                                    fontSize: 14,
                                    fontFamily: 'Effra',
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.underline,
                                    height: 0,
                                  ),
                                ),
                              ),
                            ],
                          )),
                      SizedBox(
                          height: 48,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: Provider.of<CategoriesProvider>(context,
                                    listen: false)
                                .categoriesList
                                .length,
                            // list item builder
                            itemBuilder: (BuildContext ctx, index) {
                              return InkWell(
                                onTap: () {
                                  // selected = index;
                                  Provider.of<CategoriesProvider>(context,
                                          listen: false)
                                      .getSunCategoriesList(
                                          context: context,
                                          id: Provider.of<CategoriesProvider>(
                                                  context,
                                                  listen: false)
                                              .categoriesList[index]
                                              .id
                                              .toString());
                                  AppNavigation.navigateTo(
                                      context,
                                      SectionDetailsScreen(
                                        title: Provider.of<CategoriesProvider>(
                                                context,
                                                listen: false)
                                            .categoriesList[index]
                                            .name,
                                      ));
                                  setState(() {});
                                },
                                child: Center(
                                  child: Container(
                                    margin: EdgeInsets.only(left: 10),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    alignment: Alignment.center,
                                    decoration: ShapeDecoration(
                                      color:
                                          // selected == index
                                          //     ? Theme.of(context).primaryColor
                                          //     :
                                          Colors.white,
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            width: 1, color: Color(0x7FE1E1E1)),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                    child: Text(
                                      Provider.of<CategoriesProvider>(context,
                                                  listen: false)
                                              .categoriesList[index]
                                              .name ??
                                          "",
                                      style: TextStyle(
                                        color:
                                            // selected == index
                                            //     ? Colors.white
                                            //     :
                                            Colors.black,
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
                      Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(top: 24, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const[
                               Text(
                                'الأكثر طلبا',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF212121),
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
                        children: Provider.of<ProductProvider>(context, listen: false).mostPopularProductList.map((ProductModel value) {
                          return CardProduct(productModel: value,);
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
