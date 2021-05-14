import 'package:dro_app/provider/appState.dart';
import 'package:dro_app/screens/GridScreen.dart';
import 'package:dro_app/utils/sizeConfig/sizeConfig.dart';
import 'package:dro_app/utils/styles/color_utils.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:hive/hive.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';





Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final appDocumentDirectory = await path_provider.getApplicationDocumentsDirectory();

  Hive.init(appDocumentDirectory.path);

//  Hive.registerAdapter(UserAdapter());

//  await Hive.openBox("user");
//  final box = Hive.box("user");
//  User user = box.get('user', defaultValue: null);
  final SharedPreferences sharedPref = await SharedPreferences.getInstance();
  String hasUsedApp = sharedPref.getString("OPEN_APP");
  String token = sharedPref.getString("token");
  bool hasUserUsedApp = hasUsedApp != null && hasUsedApp.isNotEmpty ? false : true;


  runApp(
      DevicePreview(
          enabled: true,
          builder: (context) =>
              MultiProvider(
                  providers: [
                    ChangeNotifierProvider(create: (_) => AppState()),


                  ],
                  child: MyApp(
                    hasUserUsedApp: hasUserUsedApp,
                  )))
  );
}

class MyApp extends StatelessWidget {
  final bool hasUserUsedApp;
  MyApp({this.hasUserUsedApp});
  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(
      builder: (context, constraints){
        return OrientationBuilder(
          builder: (context, orientation){
            SizeConfig().init(constraints, orientation);
            return OverlaySupport(
              child: GestureDetector(
                onTap: (){
                  FocusScopeNode currentFocus = FocusScope.of(context);

                  if (!currentFocus.hasPrimaryFocus &&
                      currentFocus.focusedChild != null) {
                    currentFocus.focusedChild.unfocus();
                  }

                },
                child: MaterialApp(
                  title: 'Book Keeper',
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(
                      primarySwatch: Colors.blue,
                      fontFamily: 'inter',
                      primaryColor: blue //
                  ),

                  locale: DevicePreview.locale(context), // Add the locale here
                  builder: DevicePreview.appBuilder,
                  home: GridScreen()
                ),
              ),
            );

          },
        );
      },
    );
  }
}



