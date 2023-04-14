import 'package:flutter/material.dart';
import 'package:flutter_login_mobx_multi_authentication/authentication_page.dart';
import 'package:flutter_login_mobx_multi_authentication/authentication_repository_default.dart';
import 'package:flutter_login_mobx_multi_authentication/signin/authentication_signin_store.dart';
import 'package:flutter_login_mobx_multi_authentication/signin/authentication_signin_usecase_default.dart';
import 'package:flutter_login_mobx_multi_theming/theming_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

void main() async {
  // Injection
  final authenticationRepository = AuthenticationRepositoryDefault();
  final authenticationSigninUsecaseDefault = AuthenticationSigninUsecaseDefault(authenticationRepository);
  final authenticationSigninStore = AuthenticationSigninStore(authenticationSigninUsecaseDefault);
  final themingStore = ThemingStore();

  runApp(
    Observer(
      builder: (_) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Login Mobx MultiRepo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            brightness: themingStore.currentTheme.value.isLight ? Brightness.light : Brightness.dark,
          ),
          home: AuthenticationPage(authenticationSigninStore, themingStore),
        );
      },
    ),
  );
}
