import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:m2mobile/custom_widgets/m2_appbar.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';
import 'package:m2mobile/models/product.dart';
import 'package:m2mobile/res/dimens.dart';
import 'package:m2mobile/res/icons/m2_icon_icons.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:m2mobile/res/styles.dart';
import 'package:m2mobile/stores/store_home.dart';
import 'package:m2mobile/utils/constants.dart';
import 'package:m2mobile/utils/extensions.dart';
import 'package:m2mobile/stores/store_cart.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:m2mobile/stores/store_app.dart';

class ProductDetailWidget extends StatefulWidget {
  static const route = "/main/product_detail";

  final Product product;

  const ProductDetailWidget({Key key, this.product}) : super(key: key);

  @override
  _ProductDetailWidgetState createState() => _ProductDetailWidgetState();
}

class _ProductDetailWidgetState extends State<ProductDetailWidget> {
  List<String> _images;
  bool _discountItem;
  Product _product;

  @override
  void initState() {
    _product = widget.product;
    _discountItem = widget.product.discountPrice != 0;
    _images = _product.images.toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: M2AppBar(
          showSearch: false,
          title: _product.productName,
          deleteOnly: false,
          onBackPressed: () => Modular.to.pop()),
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
                  ))),
          Align(
              alignment: Alignment.bottomCenter,
              child: BottomSheet(product: _product))
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
                child: Row(
                  children: <Widget>[
                    _buildCurrentPrice(),
                    _buildDeletedOldPrice()
                  ],
                )),
            const Divider(thickness: 1),
            Padding(
                padding: const EdgeInsets.all(Dimens.marginMedium),
                child: Text("Description",
                    style: TextStyle(
                        fontSize: Dimens.textRegular2x,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).textTheme.headline1.color))),
            Padding(
              padding: const EdgeInsets.all(Dimens.marginMedium),
              child: Text(_product.description, style: Styles.m2TextTheme),
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
                  child: Text(widget.product.specification)),
            )
          ],
        ),
      );

  Widget _buildProductImagesSlider() => Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(Dimens.marginMedium2),
                  topRight: Radius.circular(Dimens.marginMedium2)),
              child: Swiper(
                itemCount: _images.isEmpty ? 1 : _images.length,
                indicatorLayout: PageIndicatorLayout.NONE,
                autoplay: _images.isNotEmpty && _images.length > 1,
                autoplayDelay: 2000,
                pagination: SwiperPagination(
                    builder: DotSwiperPaginationBuilder(
                        size: 8,
                        activeColor: Theme.of(context).accentColor,
                        activeSize: 12)),
                control: SwiperControl(iconNext: null, iconPrevious: null),
                itemBuilder: (context, index) {
                  return AspectRatio(
                    aspectRatio: 1 / 1,
                    child: FadeInImage(
                      placeholder: AssetImage("lib/res/images/placeholder.png"),
                      image: _images.isEmpty
                          ? Image.asset("lib/res/images/placeholder.png")
                          : NetworkImage(baseUrl + '/' + _images[index]),
                    ),
                  );
                },
              ),
            ),
          ),
          Align(
              alignment: Alignment.topRight, child: _buildDiscountPercentTag())
        ],
      );

  Widget _buildDiscountPercentTag() => _discountItem
      ? Material(
          color: const Color(0xFF92C038),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(Dimens.marginMedium2),
              bottomLeft: Radius.circular(Dimens.marginMedium2)),
          elevation: Dimens.cardElevation,
          child: Container(
            padding: const EdgeInsets.all(Dimens.marginMedium),
            child: Text("${_product.discountPrice.toDouble().money()} off",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: Dimens.textRegular2x)),
          ),
        )
      : Container();

  Widget _buildCurrentPrice() {
    return _discountItem
        ? Text(
            _product.discountPrice.toDouble().money(),
            style: TextStyle(
                color: Theme.of(context).accentColor,
                fontWeight: FontWeight.w500,
                fontSize: Dimens.textRegular2x),
          )
        : Text(
            _product.price.toDouble().money(),
            style: TextStyle(
                color: Theme.of(context).accentColor,
                fontWeight: FontWeight.w500,
                fontSize: Dimens.textRegular2x),
          );
  }

  Widget _buildDeletedOldPrice() {
    return _discountItem
        ? Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Text(
              _product.price.toDouble().money(),
              style: TextStyle(
                  decoration: TextDecoration.lineThrough,
                  fontSize: Dimens.textRegular_small),
            ),
          )
        : Container();
  }
}

class BottomSheet extends StatefulWidget {
  final Product product;

  const BottomSheet({Key key, this.product}) : super(key: key);
  @override
  _BottomSheetState createState() => _BottomSheetState();
}

class _BottomSheetState extends State<BottomSheet> {
  final StoreCart _storeCart = Modular.get<StoreCart>();
  bool _favorite = false;
  @override
  void initState() {
    _favorite = (widget.product.favoriteId ?? "").isNotEmpty;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: Dimens.marginLarge,
      child: Container(
        height: 60,
        color: Colors.white,
        child: Observer(builder: (_) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _buildAddToCartBtn(),
              _buildFavoriteBtn(),
              IconButton(
                  icon: Icon(
                    M2Icon.messenger,
                    color: Colors.blueAccent,
                  ),
                  onPressed: () async {
                    try {
                      await launch(
                          Modular.get<StoreApp>().companyInfo.messagerurl);
                    } catch (e) {
                      e.toString().showSnack(context);
                    }
                  })
            ],
          );
        }),
      ),
    );
  }

  Widget _buildFavoriteBtn() => IconButton(
      icon: Icon(
        M2Icon.favourite,
        color: _favorite
            ? Theme.of(context).iconTheme.color
            : const Color(0x8AE9E9E9),
      ),
      onPressed: () async {
        await Modular.get<StoreHome>().operateFavorite(widget.product);
        setState(() {
          _favorite = !_favorite;
        });
      });

  Widget _buildAddToCartBtn() => RaisedButton(
      elevation: Dimens.marginMedium2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      disabledColor: Colors.white,
      onPressed: () {
        if (_storeCart.cartProducts.containsKey(widget.product.productId)) {
          _storeCart.removeFromCart(widget.product);
        } else {
          _storeCart.addToCart(widget.product);
        }
      },
      color: Colors.white,
      textColor: Theme.of(context).accentColor,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Icon(_storeCart.cartProducts.containsKey(widget.product.productId)
                ? M2Icon.cart_cross
                : M2Icon.cart_plus),
            Container(
                margin: const EdgeInsets.only(left: 10),
                child: Text(
                  _storeCart.cartProducts.containsKey(widget.product.productId)
                      ? 'REMOVE FROM CART'
                      : 'ADD TO CART',
                  style: TextStyle(color: Theme.of(context).accentColor),
                ))
          ]));
}
