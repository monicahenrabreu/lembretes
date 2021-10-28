import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:lembretes/src/core/base_view.dart';
import 'package:lembretes/src/features/home/home_view.dart';
import 'package:lembretes/src/features/passed_lembretes/passed_lembretes_view.dart';


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
      ],

      theme: ThemeData(
          primaryColor: const Color(0xffFFDB84),
          scaffoldBackgroundColor: Colors.white
      ),

      initialRoute: BaseView.id,
      routes: {
        BaseView.id: (context) => BaseView(),
        HomeView.id: (context) => const HomeView(),
        PassedLembretesView.id: (context) => const PassedLembretesView(),
      }
    );
  }
}
