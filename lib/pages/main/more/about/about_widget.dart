import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:m2mobile/custom_widgets/m2_appbar.dart';
import 'package:m2mobile/custom_widgets/screen_bg_card.dart';
import 'package:m2mobile/res/dimens.dart';
import 'package:m2mobile/res/icons/m2_icon_icons.dart';
import 'package:m2mobile/res/styles.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutWidget extends StatefulWidget {
  static const route = "/main/more/about";
  static const heroTag = "About-logo-hero-tag";

  @override
  _AboutWidgetState createState() => _AboutWidgetState();
}

class _AboutWidgetState extends State<AboutWidget> {
  final Completer<GoogleMapController> _controller = Completer();

  static const location = LatLng(21.940372, 96.083979);

  void _onMapCreated(GoogleMapController controller) {
    debugPrint("Google Map Created");
    _controller.complete(controller);
  }

  final Set<Marker> _markers = {
    Marker(
        infoWindow:
            const InfoWindow(title: 'M2 Mobile', snippet: 'A shop location'),
        position: location,
        markerId: MarkerId(location.toString()),
        icon: BitmapDescriptor.defaultMarker),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: M2GradientAppBar(
            title: 'About',
            gradient:
                LinearGradient(colors: [Color(0xFFED6A46), Color(0xFFF2493E)]),
            onBackPressed: () => Modular.to.pop()),
        body: Stack(
          children: <Widget>[
            _buildBackgroundGradient(),
            SingleChildScrollView(
              child: Stack(
                children: <Widget>[
                  Container(
                      height: MediaQuery.of(context).size.height,
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.125),
                      child: ScreenBgCard()),
                  Column(
                    children: <Widget>[
                      _buildM2AboutArea(),
                      _buildFacebookBtn(),
                      _buildMapArea()
                    ],
                  ),
                ],
              ),
            )
            // _buildAppBar()
          ],
        ));
  }

  Widget _buildM2AboutArea() => Align(
        child: Container(
          margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.03,
              left: Dimens.marginLarge,
              right: Dimens.marginLarge),
          child: Column(
            children: <Widget>[
              Hero(
                tag: AboutWidget.heroTag,
                child: SvgPicture.asset(
                  "lib/res/svgs/m2_logo.svg",
                  width: MediaQuery.of(context).size.width * 0.3,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(Dimens.marginMedium2),
                child: Text(
                  "M2 Mobile",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w400,
                      fontSize: Dimens.textHeading1x),
                ),
              ),
              SizedBox(height: Dimens.marginLargeX),
              Container(
                margin: const EdgeInsets.only(bottom: Dimens.marginLarge),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Icon(
                      M2Icon.phone,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      width: Dimens.marginLarge,
                    ),
                    Expanded(
                        child: Text("09 683619391, 09 450255553,\n09 5230214",
                            style: Styles.m2TextTheme.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: Dimens.textRegular2x,
                                height: 1.5)))
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: Dimens.marginLargeX),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Icon(
                      M2Icon.location,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      width: Dimens.marginLarge,
                    ),
                    Expanded(
                        child: Text(
                            "Mandalay 69 Street, Between 37 and 38\nMandalay MaNawHaRi Street, Between 57 and 58\nMandalay 56 Street, Corner of 104A",
                            textAlign: TextAlign.start,
                            style: Styles.m2TextTheme.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: Dimens.textRegular2x,
                                height: 1.5)))
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  Widget _buildMapArea() => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Container(
        width: double.infinity,
        height: 160,
        child: Card(
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: GoogleMap(
              minMaxZoomPreference: const MinMaxZoomPreference(20, 50),
              markers: _markers,
              initialCameraPosition: const CameraPosition(target: location),
              onMapCreated: _onMapCreated,
            ),
          ),
        ),
      ));

  Widget _buildFacebookBtn() => Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 8),
          child: RaisedButton(
              color: Color(0xFF3B5998),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Icon(
                    M2Icon.facebook,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 5),
                  Text("FACEBOOK", style: TextStyle(color: Colors.white))
                ],
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              onPressed: () async {
                const fbUrl =
                    "https://www.facebook.com/J-%E1%80%99%E1%80%9F%E1%80%AC-%E1%80%90%E1%80%9B%E1%80%AF%E1%80%90%E1%80%B9%E1%80%80%E1%80%AC%E1%80%B8%E1%80%95%E1%80%85%E1%81%A5%E1%80%8A%E1%80%B9%E1%80%B8%E1%80%94%E1%80%BD%E1%80%84%E1%80%B9%E1%80%B7%E1%80%B1%E1%80%91%E1%80%AC%E1%80%B9%E1%80%9C%E1%80%AC%E1%80%82%E1%80%BA%E1%80%AE%E1%80%95%E1%80%85%E1%81%A5%E1%80%8A%E1%80%B9%E1%80%B8%E1%80%B1%E1%80%9B%E1%80%AC%E1%80%84%E1%80%B9%E1%80%B8%E1%80%9D%E1%80%9A%E1%80%B9%E1%80%B1%E1%80%9B%E1%80%B8-106787410695838/about/?ref=page_internal";
                await launch(fbUrl);
              }),
        ),
      );

  Widget _buildBackgroundGradient() => Container(
        decoration: BoxDecoration(
            gradient:
                LinearGradient(colors: [Color(0xFFED6A46), Color(0xFFF2493E)])),
      );
}
