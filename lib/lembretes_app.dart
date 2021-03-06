import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:lembretes/theme/lembretes_themes.dart';
import 'package:lembretes/ui/screens/base_page/base_page.dart';
import 'package:lembretes/ui/screens/home_page/home_page.dart';
import 'package:lembretes/ui/screens/past_lembretes_page/past_lembretes_page.dart';


/// The Widget that configures your application.
class LembretesApp extends StatelessWidget {
  const LembretesApp({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Glue the SettingsController to the MaterialApp.
    //
    // The AnimatedBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return MaterialApp(
      // Providing a restorationScopeId allows the Navigator built by the
      // MaterialApp to restore the navigation stack when a user leaves and
      // returns to the app after it has been killed while running in the
      // background.
        restorationScopeId: 'lembretesApp',

        debugShowCheckedModeBanner: false,

        // Provide the generated AppLocalizations to the MaterialApp. This
        // allows descendant Widgets to display the correct translations
        // depending on the user's locale.
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''), // English, no country code
          Locale('pt', ''),
        ],

        theme: LembretesThemes.lightTheme,
        darkTheme: LembretesThemes.darkTheme,
        themeMode: ThemeMode.system,

        initialRoute: BasePage.id,
        routes: {
          BasePage.id: (context) => BasePage(),
          HomePage.id: (context) => const HomePage(),
          PastLembretesPage.id: (context) => const PastLembretesPage(),
        }
    );
  }
}
