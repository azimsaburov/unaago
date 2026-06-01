import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ru.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'localization/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ru'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In ru, this message translates to:
  /// **'UnaaGo'**
  String get appTitle;

  /// No description provided for @home.
  ///
  /// In ru, this message translates to:
  /// **'Главная'**
  String get home;

  /// No description provided for @locations.
  ///
  /// In ru, this message translates to:
  /// **'Локации'**
  String get locations;

  /// No description provided for @favorites.
  ///
  /// In ru, this message translates to:
  /// **'Избранные'**
  String get favorites;

  /// No description provided for @profile.
  ///
  /// In ru, this message translates to:
  /// **'Профиль'**
  String get profile;

  /// No description provided for @carBrand.
  ///
  /// In ru, this message translates to:
  /// **'Марка'**
  String get carBrand;

  /// No description provided for @carModel.
  ///
  /// In ru, this message translates to:
  /// **'Модель'**
  String get carModel;

  /// No description provided for @pricePerDay.
  ///
  /// In ru, this message translates to:
  /// **'Цена в сутки'**
  String get pricePerDay;

  /// No description provided for @rentNow.
  ///
  /// In ru, this message translates to:
  /// **'Арендовать'**
  String get rentNow;

  /// No description provided for @login.
  ///
  /// In ru, this message translates to:
  /// **'Вход'**
  String get login;

  /// No description provided for @register.
  ///
  /// In ru, this message translates to:
  /// **'Регистрация'**
  String get register;

  /// No description provided for @email.
  ///
  /// In ru, this message translates to:
  /// **'Электронная почта'**
  String get email;

  /// No description provided for @password.
  ///
  /// In ru, this message translates to:
  /// **'Пароль'**
  String get password;

  /// No description provided for @name.
  ///
  /// In ru, this message translates to:
  /// **'Имя'**
  String get name;

  /// No description provided for @selectRole.
  ///
  /// In ru, this message translates to:
  /// **'Выберите роль'**
  String get selectRole;

  /// No description provided for @roleRenter.
  ///
  /// In ru, this message translates to:
  /// **'Арендатор'**
  String get roleRenter;

  /// No description provided for @roleOwner.
  ///
  /// In ru, this message translates to:
  /// **'Частный владелец'**
  String get roleOwner;

  /// No description provided for @roleCompany.
  ///
  /// In ru, this message translates to:
  /// **'Компания'**
  String get roleCompany;

  /// No description provided for @noAccount.
  ///
  /// In ru, this message translates to:
  /// **'Нет аккаунта? Зарегистрироваться'**
  String get noAccount;

  /// No description provided for @haveAccount.
  ///
  /// In ru, this message translates to:
  /// **'Уже есть аккаунт? Войти'**
  String get haveAccount;

  /// No description provided for @addCar.
  ///
  /// In ru, this message translates to:
  /// **'Добавить автомобиль'**
  String get addCar;

  /// No description provided for @myCars.
  ///
  /// In ru, this message translates to:
  /// **'Мои автомобили'**
  String get myCars;

  /// No description provided for @year.
  ///
  /// In ru, this message translates to:
  /// **'Год выпуска'**
  String get year;

  /// No description provided for @description.
  ///
  /// In ru, this message translates to:
  /// **'Описание'**
  String get description;

  /// No description provided for @transmission.
  ///
  /// In ru, this message translates to:
  /// **'Трансмиссия'**
  String get transmission;

  /// No description provided for @fuelType.
  ///
  /// In ru, this message translates to:
  /// **'Тип топлива'**
  String get fuelType;

  /// No description provided for @manual.
  ///
  /// In ru, this message translates to:
  /// **'Механика'**
  String get manual;

  /// No description provided for @automatic.
  ///
  /// In ru, this message translates to:
  /// **'Автомат'**
  String get automatic;

  /// No description provided for @petrol.
  ///
  /// In ru, this message translates to:
  /// **'Бензин'**
  String get petrol;

  /// No description provided for @diesel.
  ///
  /// In ru, this message translates to:
  /// **'Дизель'**
  String get diesel;

  /// No description provided for @electric.
  ///
  /// In ru, this message translates to:
  /// **'Электро'**
  String get electric;

  /// No description provided for @hybrid.
  ///
  /// In ru, this message translates to:
  /// **'Гибрид'**
  String get hybrid;

  /// No description provided for @save.
  ///
  /// In ru, this message translates to:
  /// **'Сохранить'**
  String get save;

  /// No description provided for @emptyCarsList.
  ///
  /// In ru, this message translates to:
  /// **'У вас пока нет добавленных автомобилей'**
  String get emptyCarsList;

  /// No description provided for @settings.
  ///
  /// In ru, this message translates to:
  /// **'Настройки'**
  String get settings;

  /// No description provided for @logout.
  ///
  /// In ru, this message translates to:
  /// **'Выйти'**
  String get logout;

  /// No description provided for @search.
  ///
  /// In ru, this message translates to:
  /// **'Поиск'**
  String get search;

  /// No description provided for @filters.
  ///
  /// In ru, this message translates to:
  /// **'Фильтры'**
  String get filters;

  /// No description provided for @allCars.
  ///
  /// In ru, this message translates to:
  /// **'Все автомобили'**
  String get allCars;

  /// No description provided for @details.
  ///
  /// In ru, this message translates to:
  /// **'Детали'**
  String get details;

  /// No description provided for @perDay.
  ///
  /// In ru, this message translates to:
  /// **'/ день'**
  String get perDay;

  /// No description provided for @bookNow.
  ///
  /// In ru, this message translates to:
  /// **'Забронировать'**
  String get bookNow;

  /// No description provided for @selectDates.
  ///
  /// In ru, this message translates to:
  /// **'Выбрать даты'**
  String get selectDates;

  /// No description provided for @totalPrice.
  ///
  /// In ru, this message translates to:
  /// **'Итоговая стоимость'**
  String get totalPrice;

  /// No description provided for @bookingSuccess.
  ///
  /// In ru, this message translates to:
  /// **'Автомобиль успешно забронирован!'**
  String get bookingSuccess;

  /// No description provided for @myBookings.
  ///
  /// In ru, this message translates to:
  /// **'Мои бронирования'**
  String get myBookings;

  /// No description provided for @startDate.
  ///
  /// In ru, this message translates to:
  /// **'Дата начала'**
  String get startDate;

  /// No description provided for @endDate.
  ///
  /// In ru, this message translates to:
  /// **'Дата окончания'**
  String get endDate;

  /// No description provided for @subscriptions.
  ///
  /// In ru, this message translates to:
  /// **'Подписки'**
  String get subscriptions;

  /// No description provided for @selectPlan.
  ///
  /// In ru, this message translates to:
  /// **'Выберите тарифный план'**
  String get selectPlan;

  /// No description provided for @monthly.
  ///
  /// In ru, this message translates to:
  /// **'в месяц'**
  String get monthly;

  /// No description provided for @unlimitedCars.
  ///
  /// In ru, this message translates to:
  /// **'Безлимитно авто'**
  String get unlimitedCars;

  /// No description provided for @support.
  ///
  /// In ru, this message translates to:
  /// **'Поддержка 24/7'**
  String get support;

  /// No description provided for @buyNow.
  ///
  /// In ru, this message translates to:
  /// **'Купить подписку'**
  String get buyNow;

  /// No description provided for @activeSubscriptionRequired.
  ///
  /// In ru, this message translates to:
  /// **'Для добавления авто необходима активная подписка'**
  String get activeSubscriptionRequired;

  /// No description provided for @payment.
  ///
  /// In ru, this message translates to:
  /// **'Оплата'**
  String get payment;

  /// No description provided for @cardNumber.
  ///
  /// In ru, this message translates to:
  /// **'Номер карты'**
  String get cardNumber;

  /// No description provided for @expiryDate.
  ///
  /// In ru, this message translates to:
  /// **'Срок действия'**
  String get expiryDate;

  /// No description provided for @pay.
  ///
  /// In ru, this message translates to:
  /// **'Оплатить'**
  String get pay;

  /// No description provided for @addToFavorites.
  ///
  /// In ru, this message translates to:
  /// **'Добавить в избранное'**
  String get addToFavorites;

  /// No description provided for @removedFromFavorites.
  ///
  /// In ru, this message translates to:
  /// **'Удалено из избранного'**
  String get removedFromFavorites;

  /// No description provided for @noFavorites.
  ///
  /// In ru, this message translates to:
  /// **'Список избранного пуст'**
  String get noFavorites;

  /// No description provided for @map.
  ///
  /// In ru, this message translates to:
  /// **'Карта'**
  String get map;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ru':
      return AppLocalizationsRu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
