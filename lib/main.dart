import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/core/config/constants.dart';
import 'app/core/routes/app_pages.dart';
import 'app/core/themes/theme_data.dart';
import 'app/core/themes/theme_service.dart';
import 'app/presentation/notfound/notfound_view.dart';
import 'injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  Injector.setup();
  await GetStorage.init();
  runApp(EasyLocalization(
    supportedLocales: const [Locale('en', 'US'), Locale('id', 'ID')],
    path: 'assets/translations',
    fallbackLocale: const Locale('en', 'US'),
    //Defaut language
    startLocale: const Locale('en', 'US'),
    useOnlyLangCode: true,
    useFallbackTranslations: true,
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      title: Constants.appName,
      theme: ThemeModel().lightTheme,
      darkTheme: ThemeModel().darkTheme,
      initialRoute: AppPages.inital,
      unknownRoute: GetPage(
          name: Routes.notfound,
          fullscreenDialog: true,
          transition: Transition.cupertino,
          page: () => const NotFoundScreen()),
      themeMode: ThemeService().getThemeMode(),
      getPages: AppPages.routes,
    );
  }
}
