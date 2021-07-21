// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Home`
  String get tab_home {
    return Intl.message(
      'Home',
      name: 'tab_home',
      desc: '',
      args: [],
    );
  }

  /// `loading`
  String get loading {
    return Intl.message(
      'loading',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `Auto by System`
  String get autoBySystem {
    return Intl.message(
      'Auto by System',
      name: 'autoBySystem',
      desc: '',
      args: [],
    );
  }

  /// `Down refresh`
  String get down_refresh {
    return Intl.message(
      'Down refresh',
      name: 'down_refresh',
      desc: '',
      args: [],
    );
  }

  /// `Up refresh`
  String get up_refresh {
    return Intl.message(
      'Up refresh',
      name: 'up_refresh',
      desc: '',
      args: [],
    );
  }

  /// `refreshing`
  String get refreshing {
    return Intl.message(
      'refreshing',
      name: 'refreshing',
      desc: '',
      args: [],
    );
  }

  /// `update time: `
  String get update_time {
    return Intl.message(
      'update time: ',
      name: 'update_time',
      desc: '',
      args: [],
    );
  }

  /// `release refresh`
  String get release_refresh {
    return Intl.message(
      'release refresh',
      name: 'release_refresh',
      desc: '',
      args: [],
    );
  }

  /// `complete`
  String get complete_refresh {
    return Intl.message(
      'complete',
      name: 'complete_refresh',
      desc: '',
      args: [],
    );
  }

  /// `Network error, please try again!`
  String get network_error {
    return Intl.message(
      'Network error, please try again!',
      name: 'network_error',
      desc: '',
      args: [],
    );
  }

  /// `No data, please try again!`
  String get no_data {
    return Intl.message(
      'No data, please try again!',
      name: 'no_data',
      desc: '',
      args: [],
    );
  }

  /// `Unlock`
  String get unlock {
    return Intl.message(
      'Unlock',
      name: 'unlock',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get login {
    return Intl.message(
      'Sign in',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `enter email`
  String get enter_email {
    return Intl.message(
      'enter email',
      name: 'enter_email',
      desc: '',
      args: [],
    );
  }

  /// `enter password`
  String get enter_password {
    return Intl.message(
      'enter password',
      name: 'enter_password',
      desc: '',
      args: [],
    );
  }

  /// `Forget password?`
  String get forget_password {
    return Intl.message(
      'Forget password?',
      name: 'forget_password',
      desc: '',
      args: [],
    );
  }

  /// `No account, \nplease register`
  String get no_account {
    return Intl.message(
      'No account, \nplease register',
      name: 'no_account',
      desc: '',
      args: [],
    );
  }

  /// `Login means that you agree to the`
  String get login_means_user_agreement {
    return Intl.message(
      'Login means that you agree to the',
      name: 'login_means_user_agreement',
      desc: '',
      args: [],
    );
  }

  /// ` user agreement of Bullbox`
  String get user_agreement {
    return Intl.message(
      ' user agreement of Bullbox',
      name: 'user_agreement',
      desc: '',
      args: [],
    );
  }

  /// `Menu`
  String get menu {
    return Intl.message(
      'Menu',
      name: 'menu',
      desc: '',
      args: [],
    );
  }

  /// `No equipment available`
  String get no_equipment_available {
    return Intl.message(
      'No equipment available',
      name: 'no_equipment_available',
      desc: '',
      args: [],
    );
  }

  /// `QR-Code here`
  String get qr_code_here {
    return Intl.message(
      'QR-Code here',
      name: 'qr_code_here',
      desc: '',
      args: [],
    );
  }

  /// `my account`
  String get my_account {
    return Intl.message(
      'my account',
      name: 'my_account',
      desc: '',
      args: [],
    );
  }

  /// `close`
  String get close {
    return Intl.message(
      'close',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `Open drawer`
  String get open_drawer {
    return Intl.message(
      'Open drawer',
      name: 'open_drawer',
      desc: '',
      args: [],
    );
  }

  /// `offline`
  String get offline {
    return Intl.message(
      'offline',
      name: 'offline',
      desc: '',
      args: [],
    );
  }

  /// `User manual`
  String get user_manual {
    return Intl.message(
      'User manual',
      name: 'user_manual',
      desc: '',
      args: [],
    );
  }

  /// `Drawer informations`
  String get drawer_infomations {
    return Intl.message(
      'Drawer informations',
      name: 'drawer_infomations',
      desc: '',
      args: [],
    );
  }

  /// `Introduction Bullbox functions`
  String get introduction_bullbox_function {
    return Intl.message(
      'Introduction Bullbox functions',
      name: 'introduction_bullbox_function',
      desc: '',
      args: [],
    );
  }

  /// `Service key information Bullbox`
  String get service_key_infomation_bullbox {
    return Intl.message(
      'Service key information Bullbox',
      name: 'service_key_infomation_bullbox',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get update {
    return Intl.message(
      'Update',
      name: 'update',
      desc: '',
      args: [],
    );
  }

  /// `Log out`
  String get logout {
    return Intl.message(
      'Log out',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `register`
  String get register {
    return Intl.message(
      'register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the email you want to register with`
  String get please_enter_the_email_you_want_to_register_with {
    return Intl.message(
      'Please enter the email you want to register with',
      name: 'please_enter_the_email_you_want_to_register_with',
      desc: '',
      args: [],
    );
  }

  /// `Please enter password to register`
  String get please_enter_password_to_register {
    return Intl.message(
      'Please enter password to register',
      name: 'please_enter_password_to_register',
      desc: '',
      args: [],
    );
  }

  /// `Please enter password again`
  String get please_enter_password_again {
    return Intl.message(
      'Please enter password again',
      name: 'please_enter_password_again',
      desc: '',
      args: [],
    );
  }

  /// `Please log in and confirm`
  String get please_log_in_and_confirm {
    return Intl.message(
      'Please log in and confirm',
      name: 'please_log_in_and_confirm',
      desc: '',
      args: [],
    );
  }

  /// `confirmed`
  String get confirm {
    return Intl.message(
      'confirmed',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Scan code to add`
  String get scan_code_to_add {
    return Intl.message(
      'Scan code to add',
      name: 'scan_code_to_add',
      desc: '',
      args: [],
    );
  }

  /// `Failed to load, please try again`
  String get failed_to_load_please_try_again {
    return Intl.message(
      'Failed to load, please try again',
      name: 'failed_to_load_please_try_again',
      desc: '',
      args: [],
    );
  }

  /// `Reload`
  String get reload {
    return Intl.message(
      'Reload',
      name: 'reload',
      desc: '',
      args: [],
    );
  }

  /// `Scan result`
  String get scan_reslut {
    return Intl.message(
      'Scan result',
      name: 'scan_reslut',
      desc: '',
      args: [],
    );
  }

  /// `Open`
  String get open {
    return Intl.message(
      'Open',
      name: 'open',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get close1 {
    return Intl.message(
      'Close',
      name: 'close1',
      desc: '',
      args: [],
    );
  }

  /// `Lock`
  String get lock {
    return Intl.message(
      'Lock',
      name: 'lock',
      desc: '',
      args: [],
    );
  }

  /// `Binding`
  String get binding {
    return Intl.message(
      'Binding',
      name: 'binding',
      desc: '',
      args: [],
    );
  }

  /// `Binding succeeded`
  String get binding_succeeded {
    return Intl.message(
      'Binding succeeded',
      name: 'binding_succeeded',
      desc: '',
      args: [],
    );
  }

  /// `Unlocking succeeded`
  String get unlocking_succeeded {
    return Intl.message(
      'Unlocking succeeded',
      name: 'unlocking_succeeded',
      desc: '',
      args: [],
    );
  }

  /// `Unlocking failed`
  String get unlocking_failed {
    return Intl.message(
      'Unlocking failed',
      name: 'unlocking_failed',
      desc: '',
      args: [],
    );
  }

  /// `Choose language`
  String get select_lauguage {
    return Intl.message(
      'Choose language',
      name: 'select_lauguage',
      desc: '',
      args: [],
    );
  }

  /// `Following system`
  String get following_system {
    return Intl.message(
      'Following system',
      name: 'following_system',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'de'),
      Locale.fromSubtags(languageCode: 'zh'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}