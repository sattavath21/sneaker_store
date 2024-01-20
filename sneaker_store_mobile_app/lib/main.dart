import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sneaker_store_mobile_app/central_data_store.dart';
import 'package:sneaker_store_mobile_app/screen/explore_page/buy_product_page.dart';
import 'package:sneaker_store_mobile_app/screen/home_page/home_page.dart';
import 'package:sneaker_store_mobile_app/screen/notification_page/explore_page.dart';
import 'package:sneaker_store_mobile_app/screen/notification_page/notification_page.dart';
import 'package:sneaker_store_mobile_app/screen/profile_page/profile_page.dart';
import 'package:sneaker_store_mobile_app/styles/app_text_styles.dart';


// TODO: WHEN RUN IN RELEASE MODE TO FIX THE GridView IN HomePage most of the networkImage doesn't load.
main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  return runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('lo', 'LA'),
        Locale('th', 'TH'),
        Locale('zh', 'CN')
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('en', 'US'),
      child: ChangeNotifierProvider(
        create: (BuildContext context) => CentralStore(),
        child: MyApp(),
      ),
    ),
  );
} //ef

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _pageIndex = 0;

  static final List<Widget> _pageOptions = <Widget>[
    HomePage(),
    ExplorePage(),
    NotificationPage(),
    ProfilePage()
  ];

  final List<bool> _showAppBar = [
    true,
    true,
    false,
    false
    // Add more as needed
  ];

  bool isDark = false;

  void _onItemTapped(int index) {
    setState(() {
      _pageIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool? hasShownPopup = prefs.getBool('has_shown_popup');

      if (hasShownPopup == null || !hasShownPopup) {
        // Show your pop-up here
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: Colors.transparent,
            elevation: 0,
            insetPadding: EdgeInsets.all(4),
            content: Stack(
              children: [
                InkWell(
                  onTap: () {
                    // Navigate to a new page on image tap
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BuyProductPage(),
                      ),
                    );
                  },
                  child: Image.network(
                    "https://i.ytimg.com/vi/5ETkNjeOPBg/maxresdefault.jpg",
                    // width: MediaQuery.of(context).size.width - 20,
                    // height: MediaQuery.of(context).size.width / 2,
                  ),
                ),
                Positioned(
                    top: 0.0,
                    right: 0.0,
                    child: IconButton(
                      icon: Icon(Icons.cancel_rounded),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )),
              ],
            ),
          ),
          // Tapping outside the image closes the dialog
        );

        // Set the flag to indicate that the pop-up has been shown
        prefs.setBool('has_shown_popup', true);
      }
    });

    Provider.of<CentralStore>(context, listen: false).initializeProductList();
    Provider.of<CentralStore>(context, listen: false).initializeCustomer();
    Provider.of<CentralStore>(context, listen: false).initializeBillList();
    Provider.of<CentralStore>(context, listen: false)
        .initializeRecentProductList();
  }

  @override
  Widget build(BuildContext context) {
    //store reference
    var store1 = Provider.of<CentralStore>(context);
    return MaterialApp(
      //language section
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      //end language section
      debugShowCheckedModeBanner: false,
      theme: myAppTheme,
      home: Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();

          prefs.setBool('has_shown_popup', false);
        }),
        backgroundColor: _pageIndex == 3 ? Colors.black12 : Colors.white,
        appBar: _showAppBar[_pageIndex]
            ? AppBar(
              scrolledUnderElevation: 0.0,
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                shadowColor: Colors.transparent,
                title: CupertinoSearchTextField(
                  placeholder: "Search for product or brand".tr(),
                  prefixIcon: Icon(
                    Icons.search_rounded,
                    color: Colors.black54,
                    size: 20,
                  ),
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              )
            : null,
        body: _pageOptions.elementAt(_pageIndex),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _pageIndex,
          selectedItemColor: Colors.black87,
          onTap: _onItemTapped,
          elevation: 1,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: false,
          unselectedLabelStyle: app_text_style.latoStyle(),
          selectedLabelStyle: app_text_style.latoStyle(),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: 'HOME'.tr(),
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.trending_up_rounded),
            //   label: 'TREND',
            // ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search_rounded),
              label: 'EXPLORE'.tr(),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications_rounded),
              label: 'NOTIFICATION'.tr(),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded),
              label: 'PROFILE'.tr(),
            ),
          ],
        ),
      ),
    );
  }
} //ec

ThemeData myAppTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.blue,
    accentColor: Colors.black,
    cardColor: Colors.white,
    backgroundColor: Colors.white,
    errorColor: Colors.red,
    brightness: Brightness.dark,
  ),
  appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.black)),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    unselectedIconTheme: IconThemeData(color: Colors.black45),
    selectedIconTheme: IconThemeData(color: Colors.black),
  ),
  textTheme: GoogleFonts.latoTextTheme().copyWith(
    displaySmall: const TextStyle(color: Colors.black),
    displayMedium: const TextStyle(color: Colors.black),
    displayLarge: const TextStyle(color: Colors.black),
    bodySmall: const TextStyle(color: Colors.black),
    bodyMedium: const TextStyle(color: Colors.black),
    bodyLarge: const TextStyle(color: Colors.black),
  ),
);
