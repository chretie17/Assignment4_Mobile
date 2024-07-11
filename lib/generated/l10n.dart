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
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Hello`
  String get title {
    return Intl.message(
      'Hello',
      name: 'title',
      desc: 'The application title',
      args: [],
    );
  }

  /// `Increment`
  String get increment {
    return Intl.message(
      'Increment',
      name: 'increment',
      desc: 'Increment button tooltip',
      args: [],
    );
  }

  /// `You have pushed the button this many times:`
  String get counterMessage {
    return Intl.message(
      'You have pushed the button this many times:',
      name: 'counterMessage',
      desc: 'Message showing how many times the button has been pressed',
      args: [],
    );
  }

  /// `Get Contacts`
  String get getContacts {
    return Intl.message(
      'Get Contacts',
      name: 'getContacts',
      desc: 'Button to get contacts',
      args: [],
    );
  }

  /// `Edit Profile Picture`
  String get editProfilePicture {
    return Intl.message(
      'Edit Profile Picture',
      name: 'editProfilePicture',
      desc: 'Title for editing profile picture dialog',
      args: [],
    );
  }

  /// `Select from Gallery`
  String get selectFromGallery {
    return Intl.message(
      'Select from Gallery',
      name: 'selectFromGallery',
      desc: 'Option to select image from gallery',
      args: [],
    );
  }

  /// `Take a Picture`
  String get takePicture {
    return Intl.message(
      'Take a Picture',
      name: 'takePicture',
      desc: 'Option to take a picture',
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
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
