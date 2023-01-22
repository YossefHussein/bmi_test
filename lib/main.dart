import 'package:bmi_test/layout/home_layout.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'shared/theme/theme.dart';
import 'shared/translations/codegen_loader.g.dart';

Future<void> main() async {
  // you should use this with adding async to main
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      path: 'assets/translations',
      supportedLocales: const [
        Locale('ar'),
        Locale('en'),
        Locale('es'),
        Locale('fr'),
      ],
      fallbackLocale: const Locale('ar'),
      assetLoader: const CodegenLoader(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme of app
      theme: ThemeData(
        scaffoldBackgroundColor: pColor,
        // add main colors to app
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: pColor,
          secondary: sColor
        ),
        // main theme to text
        textTheme: GoogleFonts.cairoTextTheme().apply(
          bodyColor: pColorText,
          displayColor: pColorText,
        ),
        iconTheme: IconThemeData(
          color: pColorIcon,
        ),
        useMaterial3: true,
      ),

      title: 'Bmi Test',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: const HomeLayout(),
    );
  }
}
