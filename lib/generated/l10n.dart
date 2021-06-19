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

  /// `System`
  String get tab_system {
    return Intl.message(
      'System',
      name: 'tab_system',
      desc: '',
      args: [],
    );
  }

  /// `Device`
  String get tab_device {
    return Intl.message(
      'Device',
      name: 'tab_device',
      desc: '',
      args: [],
    );
  }

  /// `Me`
  String get tab_me {
    return Intl.message(
      'Me',
      name: 'tab_me',
      desc: '',
      args: [],
    );
  }

  /// `WX`
  String get tab_wechat {
    return Intl.message(
      'WX',
      name: 'tab_wechat',
      desc: '',
      args: [],
    );
  }

  /// `Project`
  String get tab_project {
    return Intl.message(
      'Project',
      name: 'tab_project',
      desc: '',
      args: [],
    );
  }

  /// `Navigation`
  String get tab_navigation {
    return Intl.message(
      'Navigation',
      name: 'tab_navigation',
      desc: '',
      args: [],
    );
  }

  /// `Share`
  String get share_to_square {
    return Intl.message(
      'Share',
      name: 'share_to_square',
      desc: '',
      args: [],
    );
  }

  /// `Collect`
  String get collect {
    return Intl.message(
      'Collect',
      name: 'collect',
      desc: '',
      args: [],
    );
  }

  /// `CopyLink`
  String get copy_link {
    return Intl.message(
      'CopyLink',
      name: 'copy_link',
      desc: '',
      args: [],
    );
  }

  /// `CopySuccess`
  String get copy_tip {
    return Intl.message(
      'CopySuccess',
      name: 'copy_tip',
      desc: '',
      args: [],
    );
  }

  /// `Exit`
  String get exit {
    return Intl.message(
      'Exit',
      name: 'exit',
      desc: '',
      args: [],
    );
  }

  /// `level: `
  String get level {
    return Intl.message(
      'level: ',
      name: 'level',
      desc: '',
      args: [],
    );
  }

  /// `Integral: `
  String get integral {
    return Intl.message(
      'Integral: ',
      name: 'integral',
      desc: '',
      args: [],
    );
  }

  /// `Click avatar login`
  String get login_tip {
    return Intl.message(
      'Click avatar login',
      name: 'login_tip',
      desc: '',
      args: [],
    );
  }

  /// `Crop image`
  String get crop_image {
    return Intl.message(
      'Crop image',
      name: 'crop_image',
      desc: '',
      args: [],
    );
  }

  /// `Square`
  String get square {
    return Intl.message(
      'Square',
      name: 'square',
      desc: '',
      args: [],
    );
  }

  /// `MeShare`
  String get me_share {
    return Intl.message(
      'MeShare',
      name: 'me_share',
      desc: '',
      args: [],
    );
  }

  /// `MeCollect`
  String get me_collect {
    return Intl.message(
      'MeCollect',
      name: 'me_collect',
      desc: '',
      args: [],
    );
  }

  /// `Q&A`
  String get wenda {
    return Intl.message(
      'Q&A',
      name: 'wenda',
      desc: '',
      args: [],
    );
  }

  /// `Theme`
  String get theme {
    return Intl.message(
      'Theme',
      name: 'theme',
      desc: '',
      args: [],
    );
  }

  /// `Ranking`
  String get rank {
    return Intl.message(
      'Ranking',
      name: 'rank',
      desc: '',
      args: [],
    );
  }

  /// `ranking`
  String get integral_rank {
    return Intl.message(
      'ranking',
      name: 'integral_rank',
      desc: '',
      args: [],
    );
  }

  /// `LoginOut`
  String get loginout {
    return Intl.message(
      'LoginOut',
      name: 'loginout',
      desc: '',
      args: [],
    );
  }

  /// `Loginout Success`
  String get loginoutTip {
    return Intl.message(
      'Loginout Success',
      name: 'loginoutTip',
      desc: '',
      args: [],
    );
  }

  /// `Setting`
  String get setting {
    return Intl.message(
      'Setting',
      name: 'setting',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
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

  /// `Theme Choose`
  String get theme_choose {
    return Intl.message(
      'Theme Choose',
      name: 'theme_choose',
      desc: '',
      args: [],
    );
  }

  /// `Cannot be changed in night mode~`
  String get theme_tips {
    return Intl.message(
      'Cannot be changed in night mode~',
      name: 'theme_tips',
      desc: '',
      args: [],
    );
  }

  /// `NightMode`
  String get night_mode {
    return Intl.message(
      'NightMode',
      name: 'night_mode',
      desc: '',
      args: [],
    );
  }

  /// `Fonts`
  String get switching_fonts {
    return Intl.message(
      'Fonts',
      name: 'switching_fonts',
      desc: '',
      args: [],
    );
  }

  /// `Normal`
  String get normol_font {
    return Intl.message(
      'Normal',
      name: 'normol_font',
      desc: '',
      args: [],
    );
  }

  /// `MiaoQu`
  String get kuaile_font {
    return Intl.message(
      'MiaoQu',
      name: 'kuaile_font',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language_setting {
    return Intl.message(
      'Language',
      name: 'language_setting',
      desc: '',
      args: [],
    );
  }

  /// `Auto`
  String get autoBySystem {
    return Intl.message(
      'Auto',
      name: 'autoBySystem',
      desc: '',
      args: [],
    );
  }

  /// `ClearCache`
  String get clear_cache {
    return Intl.message(
      'ClearCache',
      name: 'clear_cache',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure?`
  String get clear_cache_tip {
    return Intl.message(
      'Are you sure?',
      name: 'clear_cache_tip',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get about {
    return Intl.message(
      'About',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `Blog`
  String get my_blog {
    return Intl.message(
      'Blog',
      name: 'my_blog',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Input username`
  String get username {
    return Intl.message(
      'Input username',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `Input password`
  String get password {
    return Intl.message(
      'Input password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get repassword {
    return Intl.message(
      'Confirm password',
      name: 'repassword',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Input search key`
  String get input_search {
    return Intl.message(
      'Input search key',
      name: 'input_search',
      desc: '',
      args: [],
    );
  }

  /// `Input Empty`
  String get search_tip {
    return Intl.message(
      'Input Empty',
      name: 'search_tip',
      desc: '',
      args: [],
    );
  }

  /// `go`
  String get search {
    return Intl.message(
      'go',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `HotSearch`
  String get hot_search {
    return Intl.message(
      'HotSearch',
      name: 'hot_search',
      desc: '',
      args: [],
    );
  }

  /// `SearchHistory`
  String get search_history {
    return Intl.message(
      'SearchHistory',
      name: 'search_history',
      desc: '',
      args: [],
    );
  }

  /// `Clear`
  String get clear_history {
    return Intl.message(
      'Clear',
      name: 'clear_history',
      desc: '',
      args: [],
    );
  }

  /// `New`
  String get new_article {
    return Intl.message(
      'New',
      name: 'new_article',
      desc: '',
      args: [],
    );
  }

  /// `Top`
  String get top {
    return Intl.message(
      'Top',
      name: 'top',
      desc: '',
      args: [],
    );
  }

  /// `Stranger`
  String get stranger {
    return Intl.message(
      'Stranger',
      name: 'stranger',
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
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
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