import 'package:flutter/material.dart';
import 'package:m2mobile/custom_widgets/m2_appbar.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';
import 'package:m2mobile/custom_widgets/product_card.dart';
import 'package:m2mobile/res/dimens.dart';
import 'package:m2mobile/res/icons/m2_icon_icons.dart';

class ProductDetailWidget extends StatefulWidget {
  static const route = "/login/authenticate/main/product_detail";

  final String productName;
  final String productId;

  const ProductDetailWidget({Key key, this.productName, this.productId})
      : super(key: key);

  @override
  _ProductDetailWidgetState createState() => _ProductDetailWidgetState();
}

class _ProductDetailWidgetState extends State<ProductDetailWidget> {
  final List<String> _images = [
    "https://pyxis.nymag.com/v1/imgs/57d/5f1/4e4dae00f150e36a22a13ffa956d4301d8-07-timothee-chalamet.rvertical.w600.jpg",
    "https://pyxis.nymag.com/v1/imgs/57d/5f1/4e4dae00f150e36a22a13ffa956d4301d8-07-timothee-chalamet.rvertical.w600.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: M2AppBar(
          showSearch: false, title: widget.productName, deleteOnly: false),
      body: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          Flexible(
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  _buildProductImagesSlider(),
                  _buildProductDetailInfos()
                ],
              ),
            ),
          ),
          Align(alignment: Alignment.bottomCenter, child: BottomSheet())
        ],
      ),
    );
  }

  Widget _buildProductDetailInfos() => Container(
        height: MediaQuery.of(context).size.height * 0.6,
        padding: EdgeInsets.all(Dimens.marginMedium2),
        decoration: const BoxDecoration(
            color: Color(0xFFF6F6F6),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(Dimens.marginMedium),
              child: Text(
                '1,300,000 MMK',
                style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontWeight: FontWeight.w500,
                    fontSize: Dimens.textRegular2x),
              ),
            ),
            const Divider(thickness: 1),
            Padding(
              padding: const EdgeInsets.all(Dimens.marginMedium),
              child: Text("Description",
                  style: TextStyle(
                      fontSize: Dimens.textRegular2x,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).textTheme.headline1.color)),
            ),
            Padding(
              padding: const EdgeInsets.all(Dimens.marginMedium),
              child: Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. "),
            ),
            const Divider(
              thickness: 1,
            ),
            Padding(
              padding: const EdgeInsets.all(Dimens.marginMedium),
              child: Text("Specification",
                  style: TextStyle(
                      fontSize: Dimens.textRegular2x,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).textTheme.headline1.color)),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(Dimens.marginMedium),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: specifications.length,
                  itemBuilder: (_, index) {
                    debugPrint(specifications[index]);
                    return Padding(
                      padding: const EdgeInsets.all(Dimens.marginMedium),
                      child: Text(
                        "\u2022 " + specifications[index],
                        style: TextStyle(
                            color: Theme.of(context).textTheme.headline1.color),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      );

  Widget _buildProductImagesSlider() => Container(
        height: MediaQuery.of(context).size.height * 0.4,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(Dimens.marginMedium2),
              topRight: Radius.circular(Dimens.marginMedium2)),
          child: Swiper(
            itemCount: _images.length,
            outer: false,
            control: SwiperControl(
                iconNext: null, iconPrevious: null, color: Colors.red),
            loop: true,
            indicatorLayout: PageIndicatorLayout.COLOR,
            autoplay: true,
            autoplayDelay: 2000,
            layout: SwiperLayout.DEFAULT,
            itemBuilder: (context, index) {
              return Hero(
                tag: ProductCard.heroTag + widget.productId,
                child: FadeInImage(
                  fit: BoxFit.cover,
                  placeholder: AssetImage("lib/res/images/earth.jpg"),
                  image: NetworkImage(_images[index]),
                ),
              );
            },
          ),
        ),
      );

  final List<String> specifications = [
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
  ];
}

class BottomSheet extends StatefulWidget {
  @override
  _BottomSheetState createState() => _BottomSheetState();
}

class _BottomSheetState extends State<BottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: Dimens.marginLarge,
      child: Container(
        height: 60,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _buildAddToCartBtn(),
            IconButton(
                icon: Icon(
                  M2Icon.favourite,
                  color: Theme.of(context).iconTheme.color.withOpacity(0.5),
                ),
                onPressed: () {}),
            IconButton(
                icon: Icon(
                  M2Icon.messenger,
                  color: Colors.blueAccent,
                ),
                onPressed: () {})
          ],
        ),
      ),
    );
  }

  Widget _buildAddToCartBtn() => RaisedButton(
        elevation: Dimens.marginMedium2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        disabledColor: Colors.white,
        onPressed: () {},
        color: Colors.white,
        textColor: Theme.of(context).accentColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Icon(M2Icon.cart_plus),
            Container(
                margin: const EdgeInsets.only(left: 10),
                child: Text(
                  'ADD TO CART',
                  style: TextStyle(color: Theme.of(context).accentColor),
                ))
          ],
        ),
      );
}
