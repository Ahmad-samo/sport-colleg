import 'package:flutter/material.dart';
import 'package:page_view_indicator/page_view_indicator.dart';
import 'package:sport2/screen/first_all.dart';
import 'package:sport2/screen/homescreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  List<pagemodel> pages;
  ValueNotifier<int> _pagenotifire = ValueNotifier(0);

  void addpage() {
    pages = List<pagemodel>();
    pages.add(pagemodel(
        "welcome ",
        Icons.sports_football,
        'assets/image/bg1.jpg',
        "  مرحبا اهلا وسهلا نرحب باستخدامك لهذا التطبيق الرياضي الجامعي"));
    pages.add(pagemodel("about ", Icons.sports_outlined, 'assets/image/bg2.jpg',
        " برنامج رياضي جامعي يحوي اخر الاخبار الرياضية الطلابية الجامعية في جامعة حلب "));
    pages.add(pagemodel(
        "Thank you ",
        Icons.sports_baseball,
        'assets/image/bg5.jpg',
        "كل الشكر لاستخدام هذا التطبيق ونتمنى أن ينال اعجابكم "));
  }

  @override
  Widget build(BuildContext context) {
    addpage();
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: ExactAssetImage(pages[index].image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Transform.translate(
                        child: Icon(pages[index].icons,
                            size: 150, color: Colors.white),
                        offset: Offset(0, -100),
                      ),
                      Text(
                        pages[index].titles,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 48, right: 48, top: 12),
                        child: Text(
                          pages[index].information,
                          style: TextStyle(
                            color: Colors.red.shade900,
                            fontSize: 19,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
            itemCount: pages.length,
            onPageChanged: (index) {
              _pagenotifire.value = index;
            },
          ),
          Transform.translate(
            offset: Offset(0, 175),
            child: Align(
                alignment: Alignment.center,
                child: _pageindicator(pages.length)),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24, right: 16, left: 16),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: RaisedButton(
                  color: Colors.red.shade800,
                  child: Text(
                    'get start',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      letterSpacing: 1,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        _updateseen();
                        return First_all();
                      },
                    ));
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _pageindicator(int length) {
    return PageViewIndicator(
      pageIndexNotifier: _pagenotifire,
      length: length,
      normalBuilder: (animationController, index) => Circle(
        size: 8.0,
        color: Colors.grey,
      ),
      highlightedBuilder: (animationController, index) => ScaleTransition(
        scale: CurvedAnimation(
          parent: animationController,
          curve: Curves.ease,
        ),
        child: Circle(
          size: 12.0,
          color: Colors.red,
        ),
      ),
    );
  }

  void _updateseen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setBool('seen', true);
  }
}

// ignore: camel_case_types
class pagemodel {
  String _titles;
  String _image;
  IconData _icons;
  String _information;

  pagemodel(this._titles, this._icons, this._image, this._information);

  String get image => _image;
  IconData get icons => _icons;

  String get titles => _titles;
  String get information => _information;
}
