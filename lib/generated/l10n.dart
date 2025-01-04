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

  /// `Your Medicines`
  String get your_medicines {
    return Intl.message(
      'Your Medicines',
      name: 'your_medicines',
      desc: '',
      args: [],
    );
  }

  /// `Stop Alarm`
  String get stop_alarm {
    return Intl.message(
      'Stop Alarm',
      name: 'stop_alarm',
      desc: '',
      args: [],
    );
  }

  /// `اللغة العربية`
  String get language {
    return Intl.message(
      'اللغة العربية',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `No Selected Medicines`
  String get no_selected_medicines {
    return Intl.message(
      'No Selected Medicines',
      name: 'no_selected_medicines',
      desc: '',
      args: [],
    );
  }

  /// `Similars of the drug:`
  String get similars {
    return Intl.message(
      'Similars of the drug:',
      name: 'similars',
      desc: '',
      args: [],
    );
  }

  /// `Dose:`
  String get dose {
    return Intl.message(
      'Dose:',
      name: 'dose',
      desc: '',
      args: [],
    );
  }

  /// `Side Effects:`
  String get side_effects {
    return Intl.message(
      'Side Effects:',
      name: 'side_effects',
      desc: '',
      args: [],
    );
  }

  /// `Tips:`
  String get tips {
    return Intl.message(
      'Tips:',
      name: 'tips',
      desc: '',
      args: [],
    );
  }

  /// `Add your times`
  String get add_your_times {
    return Intl.message(
      'Add your times',
      name: 'add_your_times',
      desc: '',
      args: [],
    );
  }

  /// `Set New Alarm`
  String get set_new_alarm {
    return Intl.message(
      'Set New Alarm',
      name: 'set_new_alarm',
      desc: '',
      args: [],
    );
  }

  /// `Clear All`
  String get clear_all {
    return Intl.message(
      'Clear All',
      name: 'clear_all',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
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
      Locale.fromSubtags(languageCode: 'ar'),
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
