import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:issaq_pro/page/doa_page.dart';
import 'package:issaq_pro/page/notifikasi_page.dart';
import 'package:issaq_pro/page/sholat_page.dart';
import 'package:issaq_pro/page/tambahan_page.dart';
import 'package:provider/provider.dart';
import 'package:issaq_pro/model/navigasi-item.dart';
import 'package:issaq_pro/page/artikel-page.dart';
import 'package:issaq_pro/page/quran-page.dart';
import 'package:issaq_pro/page/header_page.dart';
import 'package:issaq_pro/provider/navigation_provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Navigation Drawer';

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => NavigationProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: title,
          theme: ThemeData(primarySwatch: Colors.deepOrange),
          home: MainPage(),
        ),
      );
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => buildPages();

  Widget buildPages() {
    final provider = Provider.of<NavigationProvider>(context);
    final navigationItem = provider.navigationItem;

    switch (navigationItem) {
      case NavigationItem.header:
        return HeaderPage();
      case NavigationItem.quran:
        return QuranPage();
      case NavigationItem.artikel:
        return ArtikelPage();
      case NavigationItem.sholat:
        return WorkflowPage();
      case NavigationItem.doa:
        return DoaPage();
      case NavigationItem.tambahan:
        return PluginsPage();
      case NavigationItem.notifikasi:
        return NotificationsPage();
    }
  }
}
