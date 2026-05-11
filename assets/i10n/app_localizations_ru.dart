// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'UnaaGo';

  @override
  String get home => 'Главная';

  @override
  String get locations => 'Локации';

  @override
  String get favorites => 'Избранные';

  @override
  String get profile => 'Профиль';

  @override
  String get carBrand => 'Марка';

  @override
  String get carModel => 'Модель';

  @override
  String get pricePerDay => 'Цена в сутки';

  @override
  String get rentNow => 'Арендовать';

  @override
  String get login => 'Вход';

  @override
  String get register => 'Регистрация';

  @override
  String get email => 'Электронная почта';

  @override
  String get password => 'Пароль';

  @override
  String get name => 'Имя';

  @override
  String get selectRole => 'Выберите роль';

  @override
  String get roleRenter => 'Арендатор';

  @override
  String get roleOwner => 'Частный владелец';

  @override
  String get roleCompany => 'Компания';

  @override
  String get noAccount => 'Нет аккаунта? Зарегистрироваться';

  @override
  String get haveAccount => 'Уже есть аккаунт? Войти';
}
