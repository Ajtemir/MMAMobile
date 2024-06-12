import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../user/userData.dart';

class FiltersScreen extends StatefulWidget {
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  List<PopularFilterListData> popularFilterListData =
      PopularFilterListData.popularFList;
  List<PopularFilterListData> accomodationListData =
      PopularFilterListData.accomodationList;

  RangeValues _values = const RangeValues(0, 600);
  double distValue = 50.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: <Widget>[
            getAppBarUI(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    priceBarFilter(),
                    const Divider(
                      height: 1,
                    ),
                    popularFilter(),
                    const Divider(
                      height: 1,
                    ),
                    distanceViewUI(),
                    const Divider(
                      height: 1,
                    ),
                    allAccommodationUI()
                  ],
                ),
              ),
            ),
            const Divider(
              height: 1,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 16, right: 16, bottom: 16, top: 8),
              child: Container(
                height: 48,
                decoration: BoxDecoration(
                  color: HotelAppTheme.buildLightTheme().primaryColor,
                  borderRadius: const BorderRadius.all(Radius.circular(24.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.6),
                      blurRadius: 8,
                      offset: const Offset(4, 4),
                    ),
                  ],
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: const BorderRadius.all(Radius.circular(24.0)),
                    highlightColor: Colors.transparent,
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Center(
                      child: Text(
                        'Применить',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget allAccommodationUI() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
          child: Text(
            'Type of Accommodation',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Colors.grey,
                fontSize: MediaQuery.of(context).size.width > 360 ? 18 : 16,
                fontWeight: FontWeight.normal),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16, left: 16),
          child: Column(
            children: getAccomodationListUI(),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }

  List<Widget> getAccomodationListUI() {
    final List<Widget> noList = <Widget>[];
    for (int i = 0; i < accomodationListData.length; i++) {
      final PopularFilterListData date = accomodationListData[i];
      noList.add(
        Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: const BorderRadius.all(Radius.circular(4.0)),
            onTap: () {
              setState(() {
                checkAppPosition(i);
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      date.titleTxt,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  CupertinoSwitch(
                    activeColor: date.isSelected
                        ? HotelAppTheme.buildLightTheme().primaryColor
                        : Colors.grey.withOpacity(0.6),
                    onChanged: (bool value) {
                      setState(() {
                        checkAppPosition(i);
                      });
                    },
                    value: date.isSelected,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
      if (i == 0) {
        noList.add(const Divider(
          height: 1,
        ));
      }
    }
    return noList;
  }

  void checkAppPosition(int index) {
    if (index == 0) {
      if (accomodationListData[0].isSelected) {
        accomodationListData.forEach((d) {
          d.isSelected = false;
        });
      } else {
        accomodationListData.forEach((d) {
          d.isSelected = true;
        });
      }
    } else {
      accomodationListData[index].isSelected =
          !accomodationListData[index].isSelected;

      int count = 0;
      for (int i = 0; i < accomodationListData.length; i++) {
        if (i != 0) {
          final PopularFilterListData data = accomodationListData[i];
          if (data.isSelected) {
            count += 1;
          }
        }
      }

      if (count == accomodationListData.length - 1) {
        accomodationListData[0].isSelected = true;
      } else {
        accomodationListData[0].isSelected = false;
      }
    }
  }

  Widget distanceViewUI() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
          child: Text(
            'Distance from city center',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Colors.grey,
                fontSize: MediaQuery.of(context).size.width > 360 ? 18 : 16,
                fontWeight: FontWeight.normal),
          ),
        ),
        SliderView(
          distValue: distValue,
          onChangedistValue: (double value) {
            distValue = value;
          },
        ),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }

  Widget popularFilter() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
          child: Text(
            'Выберите категории',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Colors.grey,
                fontSize: MediaQuery.of(context).size.width > 360 ? 18 : 16,
                fontWeight: FontWeight.normal),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16, left: 16),
          child: Column(
            children: getPList(),
          ),
        ),
        const SizedBox(
          height: 8,
        )
      ],
    );
  }

  List<Widget> getPList() {
    final List<Widget> noList = <Widget>[];
    int count = 0;
    const int columnCount = 2;
    for (int i = 0; i < popularFilterListData.length / columnCount; i++) {
      final List<Widget> listUI = <Widget>[];
      for (int i = 0; i < columnCount; i++) {
        try {
          final PopularFilterListData date = popularFilterListData[count];
          listUI.add(Expanded(
            child: Row(
              children: <Widget>[
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                    onTap: () {
                      setState(() {
                        date.isSelected = !date.isSelected;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            date.isSelected
                                ? Icons.check_box
                                : Icons.check_box_outline_blank,
                            color: date.isSelected
                                ? HotelAppTheme.buildLightTheme().primaryColor
                                : Colors.grey.withOpacity(0.6),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            date.titleTxt,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ));
          if (count < popularFilterListData.length - 1) {
            count += 1;
          } else {
            break;
          }
        } catch (e) {
          print(e);
        }
      }
      noList.add(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: listUI,
      ));
    }
    return noList;
  }

  Widget priceBarFilter() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Цена',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Colors.grey,
                fontSize: MediaQuery.of(context).size.width > 360 ? 18 : 16,
                fontWeight: FontWeight.normal),
          ),
        ),
        RangeSliderView(
          type: '',
          values: _values,
          onChangeRangeValues: (RangeValues values) {
            _values = values;
          },
        ),
        const SizedBox(
          height: 8,
        )
      ],
    );
  }

  Widget getAppBarUI() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              offset: const Offset(0, 2),
              blurRadius: 4.0),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top, left: 8, right: 8),
        child: Row(
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              width: AppBar().preferredSize.height + 40,
              height: AppBar().preferredSize.height,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(32.0),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.close),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  'Filters',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                  ),
                ),
              ),
            ),
            Container(
              width: AppBar().preferredSize.height + 40,
              height: AppBar().preferredSize.height,
            )
          ],
        ),
      ),
    );
  }
}

class PopularFilterListData {
  PopularFilterListData({
    this.titleTxt = '',
    this.isSelected = false,
  });

  String titleTxt;
  bool isSelected;

  static List<PopularFilterListData> popularFList = <PopularFilterListData>[
    PopularFilterListData(
      titleTxt: 'Free Breakfast',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'Free Parking',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'Pool',
      isSelected: true,
    ),
    PopularFilterListData(
      titleTxt: 'Pet Friendly',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'Free wifi',
      isSelected: false,
    ),
  ];

  static List<PopularFilterListData> accomodationList = [
    PopularFilterListData(
      titleTxt: 'All',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'Apartment',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'Home',
      isSelected: true,
    ),
    PopularFilterListData(
      titleTxt: 'Villa',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'Hotel',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'Resort',
      isSelected: false,
    ),
  ];
}

class HotelAppTheme {
  static TextTheme _buildTextTheme(TextTheme base) {
    const String fontName = 'WorkSans';
    return base.copyWith(
      displayLarge: base.displayLarge?.copyWith(fontFamily: fontName),
      displayMedium: base.displayMedium?.copyWith(fontFamily: fontName),
      displaySmall: base.displaySmall?.copyWith(fontFamily: fontName),
      headlineMedium: base.headlineMedium?.copyWith(fontFamily: fontName),
      headlineSmall: base.headlineSmall?.copyWith(fontFamily: fontName),
      titleLarge: base.titleLarge?.copyWith(fontFamily: fontName),
      labelLarge: base.labelLarge?.copyWith(fontFamily: fontName),
      bodySmall: base.bodySmall?.copyWith(fontFamily: fontName),
      bodyLarge: base.bodyLarge?.copyWith(fontFamily: fontName),
      bodyMedium: base.bodyMedium?.copyWith(fontFamily: fontName),
      titleMedium: base.titleMedium?.copyWith(fontFamily: fontName),
      titleSmall: base.titleSmall?.copyWith(fontFamily: fontName),
      labelSmall: base.labelSmall?.copyWith(fontFamily: fontName),
    );
  }

  static ThemeData buildLightTheme() {
    final Color primaryColor = HexColor('#FFFF6B00'); // Medium purple
    final Color secondaryColor = HexColor('#FFFF6B00'); // Medium purple
    final ColorScheme colorScheme = const ColorScheme.light().copyWith(
      primary: primaryColor,
      secondary: secondaryColor,
    );
    final ThemeData base = ThemeData.light();
    return base.copyWith(
      colorScheme: colorScheme,
      primaryColor: primaryColor,
      indicatorColor: Colors.white,
      splashColor: Colors.white24,
      splashFactory: InkRipple.splashFactory,
      canvasColor: Colors.white,
      scaffoldBackgroundColor: const Color(0xFFF2F2F2),
      buttonTheme: ButtonThemeData(
        colorScheme: colorScheme,
        textTheme: ButtonTextTheme.primary,
      ),
      textTheme: _buildTextTheme(base.textTheme),
      primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
      platform: TargetPlatform.iOS,
    );
  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}

class RangeSliderView extends StatefulWidget {
  RangeSliderView(
      {Key? key, this.values, this.onChangeRangeValues, required this.type})
      : super(key: key);

  final Function(RangeValues)? onChangeRangeValues;
  final RangeValues? values;
  final String? type;

  @override
  _RangeSliderViewState createState() => _RangeSliderViewState();
}

class _RangeSliderViewState extends State<RangeSliderView> {
  RangeValues? _values;
  String? _type;

  @override
  void initState() {
    _values = widget.values;
    _type = widget.type!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    flex: _values!.start.round(),
                    child: const SizedBox(),
                  ),
                  Container(
                    width: 54,
                    child: Text(
                      '\$${_values!.start.round()}',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    flex: _type == 'tender'
                        ? (UserData.price!.round() - _values!.start.round())
                        : (1000 - _values!.start.round()),
                    child: const SizedBox(),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: _values!.end.round(),
                    child: const SizedBox(),
                  ),
                  Container(
                    width: 54,
                    child: Text(
                      '\$${_values!.end.round()}',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    flex: _type == 'tender'
                        ? UserData.price!.round() - _values!.end.round()
                        : 1000 - _values!.end.round(),
                    child: const SizedBox(),
                  ),
                ],
              ),
            ],
          ),
          SliderTheme(
            data: SliderThemeData(
              rangeThumbShape: CustomRangeThumbShape(),
            ),
            child: RangeSlider(
              values: _values!,
              min: _type == 'tender' ? 0.0 : UserData.price!,
              max: _type == 'tender' ? UserData.price ?? 10000 : 10000.0,
              activeColor: HotelAppTheme.buildLightTheme().primaryColor,
              inactiveColor: Colors.grey.withOpacity(0.4),
              divisions: 1000,
              onChanged: (RangeValues values) {
                try {
                  setState(() {
                    _values = values;
                  });
                  widget.onChangeRangeValues!(_values!);
                } catch (_) {}
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CustomRangeThumbShape extends RangeSliderThumbShape {
  static const double _thumbSize = 3.0;
  static const double _disabledThumbSize = 3.0;

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return isEnabled
        ? const Size.fromRadius(_thumbSize)
        : const Size.fromRadius(_disabledThumbSize);
  }

  static final Animatable<double> sizeTween = Tween<double>(
    begin: _disabledThumbSize,
    end: _thumbSize,
  );

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    bool isDiscrete = false,
    bool isEnabled = false,
    bool? isOnTop,
    bool? isPressed,
    required SliderThemeData sliderTheme,
    TextDirection textDirection = TextDirection.ltr,
    Thumb thumb = Thumb.start,
  }) {
    final Canvas canvas = context.canvas;
    final ColorTween colorTween = ColorTween(
      begin: sliderTheme.disabledThumbColor,
      end: sliderTheme.thumbColor,
    );

    final double size = _thumbSize * sizeTween.evaluate(enableAnimation);
    Path thumbPath;
    switch (textDirection) {
      case TextDirection.rtl:
        switch (thumb) {
          case Thumb.start:
            thumbPath = _rightTriangle(size, center);
            break;
          case Thumb.end:
            thumbPath = _leftTriangle(size, center);
            break;
        }
        break;
      case TextDirection.ltr:
        switch (thumb) {
          case Thumb.start:
            thumbPath = _leftTriangle(size, center);
            break;
          case Thumb.end:
            thumbPath = _rightTriangle(size, center);
            break;
        }
        break;
    }

    canvas.drawPath(
        Path()
          ..addOval(Rect.fromPoints(Offset(center.dx + 12, center.dy + 12),
              Offset(center.dx - 12, center.dy - 12)))
          ..fillType = PathFillType.evenOdd,
        Paint()
          ..color = Colors.black.withOpacity(0.5)
          ..maskFilter =
              MaskFilter.blur(BlurStyle.normal, convertRadiusToSigma(8)));

    final Paint cPaint = Paint();
    cPaint..color = Colors.white;
    cPaint..strokeWidth = 14 / 2;
    canvas.drawCircle(Offset(center.dx, center.dy), 12, cPaint);
    cPaint..color = colorTween.evaluate(enableAnimation)!;
    canvas.drawCircle(Offset(center.dx, center.dy), 10, cPaint);
    canvas.drawPath(thumbPath, Paint()..color = Colors.white);
  }

  double convertRadiusToSigma(double radius) {
    return radius * 0.57735 + 0.5;
  }

  Path _rightTriangle(double size, Offset thumbCenter, {bool invert = false}) {
    final Path thumbPath = Path();
    final double sign = invert ? -1.0 : 1.0;
    thumbPath.moveTo(thumbCenter.dx + 5 * sign, thumbCenter.dy);
    thumbPath.lineTo(thumbCenter.dx - 3 * sign, thumbCenter.dy - 5);
    thumbPath.lineTo(thumbCenter.dx - 3 * sign, thumbCenter.dy + 5);
    thumbPath.close();
    return thumbPath;
  }

  Path _leftTriangle(double size, Offset thumbCenter) =>
      _rightTriangle(size, thumbCenter, invert: true);
}

class SliderView extends StatefulWidget {
  const SliderView({Key? key, this.onChangedistValue, this.distValue})
      : super(key: key);

  final Function(double)? onChangedistValue;
  final double? distValue;

  @override
  _SliderViewState createState() => _SliderViewState();
}

class _SliderViewState extends State<SliderView> {
  double distValue = 50;

  @override
  void initState() {
    distValue = widget.distValue!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                flex: distValue.round(),
                child: const SizedBox(),
              ),
              Container(
                width: 170,
                child: Text(
                  '${(distValue)} \$',
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                flex: 100 - distValue.round(),
                child: const SizedBox(),
              ),
            ],
          ),
          SliderTheme(
            data: SliderThemeData(
              thumbShape: CustomThumbShape(),
            ),
            child: Slider(
              onChanged: (double value) {
                setState(() {
                  distValue = value;
                });
                try {
                  widget.onChangedistValue!(distValue);
                } catch (_) {}
              },
              min: 0,
              max: 100,
              activeColor: HotelAppTheme.buildLightTheme().primaryColor,
              inactiveColor: Colors.grey.withOpacity(0.4),
              divisions: 100,
              value: distValue,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomThumbShape extends SliderComponentShape {
  static const double _thumbSize = 3.0;
  static const double _disabledThumbSize = 3.0;

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return isEnabled
        ? const Size.fromRadius(_thumbSize)
        : const Size.fromRadius(_disabledThumbSize);
  }

  static final Animatable<double> sizeTween = Tween<double>(
    begin: _disabledThumbSize,
    end: _thumbSize,
  );

  @override
  void paint(
    PaintingContext context,
    Offset thumbCenter, {
    Animation<double>? activationAnimation,
    Animation<double>? enableAnimation,
    bool? isDiscrete,
    TextPainter? labelPainter,
    RenderBox? parentBox,
    Size? sizeWithOverflow,
    SliderThemeData? sliderTheme,
    TextDirection textDirection = TextDirection.ltr,
    double? textScaleFactor,
    double? value,
  }) {
    final Canvas canvas = context.canvas;
    final ColorTween colorTween = ColorTween(
      begin: sliderTheme?.disabledThumbColor,
      end: sliderTheme?.thumbColor,
    );
    canvas.drawPath(
        Path()
          ..addOval(Rect.fromPoints(
              Offset(thumbCenter.dx + 12, thumbCenter.dy + 12),
              Offset(thumbCenter.dx - 12, thumbCenter.dy - 12)))
          ..fillType = PathFillType.evenOdd,
        Paint()
          ..color = Colors.black.withOpacity(0.5)
          ..maskFilter =
              MaskFilter.blur(BlurStyle.normal, convertRadiusToSigma(8)));

    final Paint cPaint = Paint();
    cPaint..color = Colors.white;
    cPaint..strokeWidth = 14 / 2;
    canvas.drawCircle(Offset(thumbCenter.dx, thumbCenter.dy), 12, cPaint);
    cPaint..color = colorTween.evaluate(enableAnimation!)!;
    canvas.drawCircle(Offset(thumbCenter.dx, thumbCenter.dy), 10, cPaint);
  }

  double convertRadiusToSigma(double radius) {
    return radius * 0.57735 + 0.5;
  }
}
