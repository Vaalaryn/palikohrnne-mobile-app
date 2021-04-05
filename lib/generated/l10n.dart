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

  /// `en`
  String get actualLocale {
    return Intl.message(
      'en',
      name: 'actualLocale',
      desc: '',
      args: [],
    );
  }

  /// `Show description`
  String get articleShowMore {
    return Intl.message(
      'Show description',
      name: 'articleShowMore',
      desc: '',
      args: [],
    );
  }

  /// `Read article`
  String get articleReadArticle {
    return Intl.message(
      'Read article',
      name: 'articleReadArticle',
      desc: '',
      args: [],
    );
  }

  /// `Il y a {year} an`
  String articleDateInYear(Object year) {
    return Intl.message(
      'Il y a $year an',
      name: 'articleDateInYear',
      desc: '',
      args: [year],
    );
  }

  /// `Il y a {year} ans`
  String articleDateInYears(Object year) {
    return Intl.message(
      'Il y a $year ans',
      name: 'articleDateInYears',
      desc: '',
      args: [year],
    );
  }

  /// `Il y a {month} mois`
  String articleDateInMonth(Object month) {
    return Intl.message(
      'Il y a $month mois',
      name: 'articleDateInMonth',
      desc: '',
      args: [month],
    );
  }

  /// `Il y a {month} mois`
  String articleDateInMonths(Object month) {
    return Intl.message(
      'Il y a $month mois',
      name: 'articleDateInMonths',
      desc: '',
      args: [month],
    );
  }

  /// `Il y a {day} jour`
  String articleDateInDay(Object day) {
    return Intl.message(
      'Il y a $day jour',
      name: 'articleDateInDay',
      desc: '',
      args: [day],
    );
  }

  /// `Il y a {day} jours`
  String articleDateInDays(Object day) {
    return Intl.message(
      'Il y a $day jours',
      name: 'articleDateInDays',
      desc: '',
      args: [day],
    );
  }

  /// `Il y a {hours} heure`
  String articleDateInHour(Object hours) {
    return Intl.message(
      'Il y a $hours heure',
      name: 'articleDateInHour',
      desc: '',
      args: [hours],
    );
  }

  /// `Il y a {hours} heures`
  String articleDateInHours(Object hours) {
    return Intl.message(
      'Il y a $hours heures',
      name: 'articleDateInHours',
      desc: '',
      args: [hours],
    );
  }

  /// `Il y a {minutes} minute`
  String articleDateInMinute(Object minutes) {
    return Intl.message(
      'Il y a $minutes minute',
      name: 'articleDateInMinute',
      desc: '',
      args: [minutes],
    );
  }

  /// `Il y a {minutes} minutes`
  String articleDateInMinutes(Object minutes) {
    return Intl.message(
      'Il y a $minutes minutes',
      name: 'articleDateInMinutes',
      desc: '',
      args: [minutes],
    );
  }

  /// `Unknow source`
  String get articleNoSource {
    return Intl.message(
      'Unknow source',
      name: 'articleNoSource',
      desc: '',
      args: [],
    );
  }

  /// `No description`
  String get articleNoDesc {
    return Intl.message(
      'No description',
      name: 'articleNoDesc',
      desc: '',
      args: [],
    );
  }

  /// `Choose a filter`
  String get filterSelect {
    return Intl.message(
      'Choose a filter',
      name: 'filterSelect',
      desc: '',
      args: [],
    );
  }

  /// `Default filter`
  String get filterDefault {
    return Intl.message(
      'Default filter',
      name: 'filterDefault',
      desc: '',
      args: [],
    );
  }

  /// `Custom filter`
  String get filterCustom {
    return Intl.message(
      'Custom filter',
      name: 'filterCustom',
      desc: '',
      args: [],
    );
  }

  /// `Reminder set`
  String get snackBarReminderSet {
    return Intl.message(
      'Reminder set',
      name: 'snackBarReminderSet',
      desc: '',
      args: [],
    );
  }

  /// `Reminder deleted`
  String get snackBarReminderUnset {
    return Intl.message(
      'Reminder deleted',
      name: 'snackBarReminderUnset',
      desc: '',
      args: [],
    );
  }

  /// `Article add to favorite`
  String get snackBarFavoritesSet {
    return Intl.message(
      'Article add to favorite',
      name: 'snackBarFavoritesSet',
      desc: '',
      args: [],
    );
  }

  /// `Article deleted from favorite`
  String get snackBarFavoritesUnset {
    return Intl.message(
      'Article deleted from favorite',
      name: 'snackBarFavoritesUnset',
      desc: '',
      args: [],
    );
  }

  /// `User info`
  String get profilUser {
    return Intl.message(
      'User info',
      name: 'profilUser',
      desc: '',
      args: [],
    );
  }

  /// `Change your username`
  String get profilUpdateUsername {
    return Intl.message(
      'Change your username',
      name: 'profilUpdateUsername',
      desc: '',
      args: [],
    );
  }

  /// `Change your mail`
  String get profilUpdateMail {
    return Intl.message(
      'Change your mail',
      name: 'profilUpdateMail',
      desc: '',
      args: [],
    );
  }

  /// `Change your avatar`
  String get profilUpdateAvatar {
    return Intl.message(
      'Change your avatar',
      name: 'profilUpdateAvatar',
      desc: '',
      args: [],
    );
  }

  /// `Change your password`
  String get profilUpdatePassword {
    return Intl.message(
      'Change your password',
      name: 'profilUpdatePassword',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get profilDisconnect {
    return Intl.message(
      'Logout',
      name: 'profilDisconnect',
      desc: '',
      args: [],
    );
  }

  /// `Theme`
  String get profilThemeTitle {
    return Intl.message(
      'Theme',
      name: 'profilThemeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Night mode`
  String get profilDarkTheme {
    return Intl.message(
      'Night mode',
      name: 'profilDarkTheme',
      desc: '',
      args: [],
    );
  }

  /// `Main color`
  String get profilColorSelect {
    return Intl.message(
      'Main color',
      name: 'profilColorSelect',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get profilLangTitle {
    return Intl.message(
      'Language',
      name: 'profilLangTitle',
      desc: '',
      args: [],
    );
  }

  /// `Choose a Language`
  String get profilLangLabel {
    return Intl.message(
      'Choose a Language',
      name: 'profilLangLabel',
      desc: '',
      args: [],
    );
  }

  /// `Français`
  String get profilLangFr {
    return Intl.message(
      'Français',
      name: 'profilLangFr',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get profilLangEn {
    return Intl.message(
      'English',
      name: 'profilLangEn',
      desc: '',
      args: [],
    );
  }

  /// `Deutsch`
  String get profilLangDe {
    return Intl.message(
      'Deutsch',
      name: 'profilLangDe',
      desc: '',
      args: [],
    );
  }

  /// `Español`
  String get profilLangEs {
    return Intl.message(
      'Español',
      name: 'profilLangEs',
      desc: '',
      args: [],
    );
  }

  /// `日本の`
  String get profilLangJp {
    return Intl.message(
      '日本の',
      name: 'profilLangJp',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get inscriptionTitle {
    return Intl.message(
      'Sign up',
      name: 'inscriptionTitle',
      desc: '',
      args: [],
    );
  }

  /// `Fill this input`
  String get inscriptionMsgFieldsEmpty {
    return Intl.message(
      'Fill this input',
      name: 'inscriptionMsgFieldsEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Mail`
  String get inscriptionLabelMail {
    return Intl.message(
      'Mail',
      name: 'inscriptionLabelMail',
      desc: '',
      args: [],
    );
  }

  /// `Wrong mail`
  String get inscriptionMsgWrongMail {
    return Intl.message(
      'Wrong mail',
      name: 'inscriptionMsgWrongMail',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get inscriptionLabelPseudo {
    return Intl.message(
      'Username',
      name: 'inscriptionLabelPseudo',
      desc: '',
      args: [],
    );
  }

  /// `Wrong username`
  String get inscriptionMsgWrongPseudo {
    return Intl.message(
      'Wrong username',
      name: 'inscriptionMsgWrongPseudo',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get inscriptionLabelMdp {
    return Intl.message(
      'Password',
      name: 'inscriptionLabelMdp',
      desc: '',
      args: [],
    );
  }

  /// `Wrong password`
  String get inscriptionMsgWrongPassword {
    return Intl.message(
      'Wrong password',
      name: 'inscriptionMsgWrongPassword',
      desc: '',
      args: [],
    );
  }

  /// `Password confirm`
  String get inscriptionLabelConfPassword {
    return Intl.message(
      'Password confirm',
      name: 'inscriptionLabelConfPassword',
      desc: '',
      args: [],
    );
  }

  /// `Wrong password confrim`
  String get inscriptionMsgWrongConfPassword {
    return Intl.message(
      'Wrong password confrim',
      name: 'inscriptionMsgWrongConfPassword',
      desc: '',
      args: [],
    );
  }

  /// `Password doesn't match`
  String get inscriptionMsgMdpNoMatch {
    return Intl.message(
      'Password doesn\'t match',
      name: 'inscriptionMsgMdpNoMatch',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get inscriptionButtonValidation {
    return Intl.message(
      'Sign up',
      name: 'inscriptionButtonValidation',
      desc: '',
      args: [],
    );
  }

  /// `Mail already used`
  String get inscriptionMailAlreadyUsed {
    return Intl.message(
      'Mail already used',
      name: 'inscriptionMailAlreadyUsed',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get inscriptionSuccess {
    return Intl.message(
      'Done',
      name: 'inscriptionSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get connexionTitle {
    return Intl.message(
      'Sign in',
      name: 'connexionTitle',
      desc: '',
      args: [],
    );
  }

  /// `Mail`
  String get connexionLabelMail {
    return Intl.message(
      'Mail',
      name: 'connexionLabelMail',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get connexionLabelPassword {
    return Intl.message(
      'Password',
      name: 'connexionLabelPassword',
      desc: '',
      args: [],
    );
  }

  /// `Remember me`
  String get connexionLabelRememberMe {
    return Intl.message(
      'Remember me',
      name: 'connexionLabelRememberMe',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get connexionLabelButtonConnexion {
    return Intl.message(
      'Submit',
      name: 'connexionLabelButtonConnexion',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get connexionLabelGoToInscription {
    return Intl.message(
      'Sign up',
      name: 'connexionLabelGoToInscription',
      desc: '',
      args: [],
    );
  }

  /// `Wrong mail`
  String get connexionMsgWrongMail {
    return Intl.message(
      'Wrong mail',
      name: 'connexionMsgWrongMail',
      desc: '',
      args: [],
    );
  }

  /// `Wrong password`
  String get connexionMsgWrongPassword {
    return Intl.message(
      'Wrong password',
      name: 'connexionMsgWrongPassword',
      desc: '',
      args: [],
    );
  }

  /// `Error while attempting to connect`
  String get connexionMsgConnectionError {
    return Intl.message(
      'Error while attempting to connect',
      name: 'connexionMsgConnectionError',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get connexionCloseError {
    return Intl.message(
      'OK',
      name: 'connexionCloseError',
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
      Locale.fromSubtags(languageCode: 'fr'),
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