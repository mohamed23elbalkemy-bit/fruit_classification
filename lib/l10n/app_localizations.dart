import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
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
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @aboutAppTitle.
  ///
  /// In en, this message translates to:
  /// **'Fruit Classifier'**
  String get aboutAppTitle;

  /// No description provided for @aboutAppSubtitle.
  ///
  /// In en, this message translates to:
  /// **'AI-Powered Quality Detection'**
  String get aboutAppSubtitle;

  /// No description provided for @aboutAppDescription.
  ///
  /// In en, this message translates to:
  /// **'Our advanced AI technology helps you classify fruits and assess their quality with high accuracy. Simply scan any fruit to get instant results and maintain a complete history of your classifications.'**
  String get aboutAppDescription;

  /// No description provided for @versionText.
  ///
  /// In en, this message translates to:
  /// **'Version 1.0.0'**
  String get versionText;

  /// No description provided for @copyrightText.
  ///
  /// In en, this message translates to:
  /// **'© 2025 Fruit Classifier Inc.'**
  String get copyrightText;

  /// No description provided for @contactUs.
  ///
  /// In en, this message translates to:
  /// **'Contact Us'**
  String get contactUs;

  /// No description provided for @accuracy.
  ///
  /// In en, this message translates to:
  /// **'Accuracy'**
  String get accuracy;

  /// No description provided for @users.
  ///
  /// In en, this message translates to:
  /// **'Users'**
  String get users;

  /// No description provided for @fruits.
  ///
  /// In en, this message translates to:
  /// **'Fruits'**
  String get fruits;

  /// No description provided for @welcomeBack.
  ///
  /// In en, this message translates to:
  /// **'Welcome Back'**
  String get welcomeBack;

  /// No description provided for @loginSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Sign in to continue classifying fruits'**
  String get loginSubtitle;

  /// No description provided for @enterEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get enterEmail;

  /// No description provided for @enterPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get enterPassword;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get forgotPassword;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @loggingIn.
  ///
  /// In en, this message translates to:
  /// **'Logging in...'**
  String get loggingIn;

  /// No description provided for @invalidLogin.
  ///
  /// In en, this message translates to:
  /// **'Invalid email or password'**
  String get invalidLogin;

  /// No description provided for @or.
  ///
  /// In en, this message translates to:
  /// **'or'**
  String get or;

  /// No description provided for @noAccount.
  ///
  /// In en, this message translates to:
  /// **'Don’t have an account? '**
  String get noAccount;

  /// No description provided for @createAccount.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get createAccount;

  /// No description provided for @termsPrivacy.
  ///
  /// In en, this message translates to:
  /// **'By continuing, you agree to our Terms & Privacy Policy'**
  String get termsPrivacy;

  /// No description provided for @joinUsToStartClassifyingFruits.
  ///
  /// In en, this message translates to:
  /// **'Join us to start classifying fruits'**
  String get joinUsToStartClassifyingFruits;

  /// No description provided for @chooseUsername.
  ///
  /// In en, this message translates to:
  /// **'Choose a username'**
  String get chooseUsername;

  /// No description provided for @enterYourEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get enterYourEmail;

  /// No description provided for @createPassword.
  ///
  /// In en, this message translates to:
  /// **'Create a password'**
  String get createPassword;

  /// No description provided for @creating.
  ///
  /// In en, this message translates to:
  /// **'Creating...'**
  String get creating;

  /// No description provided for @alreadyHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account? '**
  String get alreadyHaveAccount;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get signIn;

  /// No description provided for @termsAndPrivacy.
  ///
  /// In en, this message translates to:
  /// **'By creating an account, you agree to our Terms & Privacy Policy'**
  String get termsAndPrivacy;

  /// No description provided for @classificationHistory.
  ///
  /// In en, this message translates to:
  /// **'Classification History'**
  String get classificationHistory;

  /// No description provided for @deleteAllHistory.
  ///
  /// In en, this message translates to:
  /// **'Delete all history?'**
  String get deleteAllHistory;

  /// No description provided for @deleteHistoryConfirm.
  ///
  /// In en, this message translates to:
  /// **'Delete History Confirm'**
  String get deleteHistoryConfirm;

  /// No description provided for @deleteHistoryWarning.
  ///
  /// In en, this message translates to:
  /// **'This action cannot be undone. Are you sure you want to delete all classifications?'**
  String get deleteHistoryWarning;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @noHistoryYet.
  ///
  /// In en, this message translates to:
  /// **'No history yet'**
  String get noHistoryYet;

  /// No description provided for @takeFrontPhoto.
  ///
  /// In en, this message translates to:
  /// **'Take Front Photo'**
  String get takeFrontPhoto;

  /// No description provided for @takeBackPhoto.
  ///
  /// In en, this message translates to:
  /// **'Take Back Photo'**
  String get takeBackPhoto;

  /// No description provided for @takeLeftPhoto.
  ///
  /// In en, this message translates to:
  /// **'Take Left Photo'**
  String get takeLeftPhoto;

  /// No description provided for @takeRightPhoto.
  ///
  /// In en, this message translates to:
  /// **'Take Right Photo'**
  String get takeRightPhoto;

  /// No description provided for @selectFourImages.
  ///
  /// In en, this message translates to:
  /// **'Select 4 Images'**
  String get selectFourImages;

  /// No description provided for @classifyYourFruit.
  ///
  /// In en, this message translates to:
  /// **'Classify Your Fruit'**
  String get classifyYourFruit;

  /// No description provided for @takePhotoOrUpload.
  ///
  /// In en, this message translates to:
  /// **'Take a photo or upload an image to identify any fruit'**
  String get takePhotoOrUpload;

  /// No description provided for @openCamera.
  ///
  /// In en, this message translates to:
  /// **'Open Camera'**
  String get openCamera;

  /// No description provided for @takePhoto.
  ///
  /// In en, this message translates to:
  /// **'Take Photo'**
  String get takePhoto;

  /// No description provided for @uploadImage.
  ///
  /// In en, this message translates to:
  /// **'Upload Image'**
  String get uploadImage;

  /// No description provided for @fromGallery.
  ///
  /// In en, this message translates to:
  /// **'From gallery'**
  String get fromGallery;

  /// No description provided for @recentClassifications.
  ///
  /// In en, this message translates to:
  /// **'Recent Classifications'**
  String get recentClassifications;

  /// No description provided for @viewAll.
  ///
  /// In en, this message translates to:
  /// **'View All'**
  String get viewAll;

  /// No description provided for @noRecentClassifications.
  ///
  /// In en, this message translates to:
  /// **'No recent classifications yet'**
  String get noRecentClassifications;

  /// No description provided for @identifyFruitInstantly.
  ///
  /// In en, this message translates to:
  /// **'Identify Fruit Instantly'**
  String get identifyFruitInstantly;

  /// No description provided for @scanOrUploadFruit.
  ///
  /// In en, this message translates to:
  /// **'Scan or upload a fruit image and get instant classification.'**
  String get scanOrUploadFruit;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @accuracy99.
  ///
  /// In en, this message translates to:
  /// **'99% Accuracy'**
  String get accuracy99;

  /// No description provided for @highAccuracyClassification.
  ///
  /// In en, this message translates to:
  /// **'High Accuracy Classification'**
  String get highAccuracyClassification;

  /// No description provided for @aiDetectsFruit.
  ///
  /// In en, this message translates to:
  /// **'Our AI model detects fruit type and quality.'**
  String get aiDetectsFruit;

  /// No description provided for @startYourJourney.
  ///
  /// In en, this message translates to:
  /// **'Start Your Journey'**
  String get startYourJourney;

  /// No description provided for @letsClassifyFruit.
  ///
  /// In en, this message translates to:
  /// **'Let\'s classify your fruit now!'**
  String get letsClassifyFruit;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStarted;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @editProfile.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get editProfile;

  /// No description provided for @history.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get history;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Log Out'**
  String get logout;

  /// No description provided for @confirmLogout.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to log out?'**
  String get confirmLogout;

  /// No description provided for @chooseFromGallery.
  ///
  /// In en, this message translates to:
  /// **'Choose from Gallery'**
  String get chooseFromGallery;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @saveChanges.
  ///
  /// In en, this message translates to:
  /// **'Save Changes'**
  String get saveChanges;

  /// No description provided for @result.
  ///
  /// In en, this message translates to:
  /// **'Result'**
  String get result;

  /// No description provided for @quality.
  ///
  /// In en, this message translates to:
  /// **'Quality'**
  String get quality;

  /// No description provided for @scanAgain.
  ///
  /// In en, this message translates to:
  /// **'Scan Again'**
  String get scanAgain;

  /// No description provided for @saveToHistory.
  ///
  /// In en, this message translates to:
  /// **'Save to History'**
  String get saveToHistory;

  /// No description provided for @manageAppPreferences.
  ///
  /// In en, this message translates to:
  /// **'Manage your app preferences'**
  String get manageAppPreferences;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @receiveAlertsAndUpdates.
  ///
  /// In en, this message translates to:
  /// **'Receive alerts and updates'**
  String get receiveAlertsAndUpdates;

  /// No description provided for @notificationsEnabledSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Notifications Enabled Successfully'**
  String get notificationsEnabledSuccessfully;

  /// No description provided for @darkMode.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get darkMode;

  /// No description provided for @switchToDarkTheme.
  ///
  /// In en, this message translates to:
  /// **'Switch to dark theme'**
  String get switchToDarkTheme;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @arabic.
  ///
  /// In en, this message translates to:
  /// **'العربية'**
  String get arabic;

  /// No description provided for @aboutApp.
  ///
  /// In en, this message translates to:
  /// **'About App'**
  String get aboutApp;

  /// No description provided for @appInformationAndDetails.
  ///
  /// In en, this message translates to:
  /// **'App information & details'**
  String get appInformationAndDetails;

  /// No description provided for @version.
  ///
  /// In en, this message translates to:
  /// **'Version 1.0.0'**
  String get version;

  /// No description provided for @selectLanguage.
  ///
  /// In en, this message translates to:
  /// **'Select Language'**
  String get selectLanguage;

  /// No description provided for @fruitClassification.
  ///
  /// In en, this message translates to:
  /// **'Fruit Classification'**
  String get fruitClassification;

  /// No description provided for @aiPoweredFruitRecognition.
  ///
  /// In en, this message translates to:
  /// **'AI-Powered Fruit Recognition'**
  String get aiPoweredFruitRecognition;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// No description provided for @pleaseSelectAtLeast4Images.
  ///
  /// In en, this message translates to:
  /// **'Please select at least 4 images'**
  String get pleaseSelectAtLeast4Images;

  /// No description provided for @uploadFruitImages.
  ///
  /// In en, this message translates to:
  /// **'Upload Fruit Images'**
  String get uploadFruitImages;

  /// No description provided for @upload4ImagesOfTheFruit.
  ///
  /// In en, this message translates to:
  /// **'Upload 4 images of the fruit'**
  String get upload4ImagesOfTheFruit;

  /// No description provided for @chooseFourImagesShowingDifferentSides.
  ///
  /// In en, this message translates to:
  /// **'Choose four images showing different sides'**
  String get chooseFourImagesShowingDifferentSides;

  /// No description provided for @chooseImages.
  ///
  /// In en, this message translates to:
  /// **'Choose Images'**
  String get chooseImages;

  /// No description provided for @supportsJpgPngWebp.
  ///
  /// In en, this message translates to:
  /// **'Supports: JPG, PNG, WEBP'**
  String get supportsJpgPngWebp;

  /// No description provided for @tipsForBestResults.
  ///
  /// In en, this message translates to:
  /// **'Tips for best results'**
  String get tipsForBestResults;

  /// No description provided for @tipTakeImagesFrom4DifferentAngles.
  ///
  /// In en, this message translates to:
  /// **'Take images from 4 different angles'**
  String get tipTakeImagesFrom4DifferentAngles;

  /// No description provided for @tipUseClearWellLitPhotos.
  ///
  /// In en, this message translates to:
  /// **'Use clear, well-lit photos'**
  String get tipUseClearWellLitPhotos;

  /// No description provided for @tipCenterTheFruitInTheFrame.
  ///
  /// In en, this message translates to:
  /// **'Center the fruit in the frame'**
  String get tipCenterTheFruitInTheFrame;

  /// No description provided for @tipAvoidBlurryOrDarkImages.
  ///
  /// In en, this message translates to:
  /// **'Avoid blurry or dark images'**
  String get tipAvoidBlurryOrDarkImages;

  /// No description provided for @confidence.
  ///
  /// In en, this message translates to:
  /// **'Confidence'**
  String get confidence;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
