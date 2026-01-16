import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'tl'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? tlText = '',
  }) =>
      [enText, tlText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'uxk1ix3o': {
      'en': 'Deliver to',
      'tl': '',
    },
    'op73m1vb': {
      'en': 'What do you want to eat?',
      'tl': '',
    },
    'vuiwqdkq': {
      'en': 'Burger',
      'tl': '',
    },
    '7p7qntgk': {
      'en': 'Pizza',
      'tl': '',
    },
    'fw471dmr': {
      'en': 'Cake',
      'tl': '',
    },
    'ppbusj0r': {
      'en': 'Fries',
      'tl': '',
    },
    '4g9p0iwh': {
      'en': 'Bread',
      'tl': '',
    },
    'bve2dmxe': {
      'en': 'Nearby brands',
      'tl': '',
    },
    'l2of344r': {
      'en': 'Jollibee',
      'tl': '',
    },
    'h2h818ww': {
      'en': '10-20 min',
      'tl': '',
    },
    'zudpyik7': {
      'en': 'Mcdonald\'s',
      'tl': '',
    },
    '2e4whqw3': {
      'en': '15-30 min',
      'tl': '',
    },
    '8tclwyf4': {
      'en': 'KFC',
      'tl': '',
    },
    '52ucav1l': {
      'en': '15-30 min',
      'tl': '',
    },
    '8c0cd96h': {
      'en': 'Starbucks',
      'tl': '',
    },
    'jyoj0rye': {
      'en': '15-30 min',
      'tl': '',
    },
    'pyofskkm': {
      'en': 'Dunkin',
      'tl': '',
    },
    'ai9926nr': {
      'en': '15-30 min',
      'tl': '',
    },
    '0pc9apf2': {
      'en': 'Greenwich',
      'tl': '',
    },
    '0xcb1bo5': {
      'en': '15-30 min',
      'tl': '',
    },
    'srrsdil6': {
      'en': 'Popular',
      'tl': '',
    },
    'h0i6d9zi': {
      'en': 'Pepperoni Overload',
      'tl': '',
    },
    'mfnkotpv': {
      'en': 'Greenwich',
      'tl': '',
    },
    'dw7jev33': {
      'en': 'Chickenjoy',
      'tl': '',
    },
    'ibl5f475': {
      'en': 'Jollibee',
      'tl': '',
    },
    '0fjo9enx': {
      'en': 'Whopper',
      'tl': '',
    },
    'pi4tf73i': {
      'en': 'Burger King',
      'tl': '',
    },
    'j4yt438r': {
      'en': 'Chocolate Glazed Donut',
      'tl': '',
    },
    '0zscuu8u': {
      'en': 'Dunkin\'',
      'tl': '',
    },
    'mr329s15': {
      'en': 'Explore restaurants',
      'tl': '',
    },
    'db749gl8': {
      'en': 'McDonald\'s',
      'tl': '',
    },
    'qe664pg5': {
      'en': '4.9',
      'tl': '',
    },
    '0ms9atny': {
      'en': '(4000+)',
      'tl': '',
    },
    '3yl3p1uv': {
      'en': '35-55 min',
      'tl': '',
    },
    'io9ge45x': {
      'en': '•',
      'tl': '',
    },
    'rnebdyly': {
      'en': '₱',
      'tl': '',
    },
    'vh96l6dw': {
      'en': '•',
      'tl': '',
    },
    '2o5uofj2': {
      'en': 'Fast Food',
      'tl': '',
    },
    'eyyxqg3p': {
      'en': '₱39',
      'tl': '',
    },
    '67gz6n2c': {
      'en': 'Burger King',
      'tl': '',
    },
    '2m7247sj': {
      'en': '5.0',
      'tl': '',
    },
    'aowp83f7': {
      'en': '(1000+)',
      'tl': '',
    },
    '1kx0uxe1': {
      'en': '35-55 min',
      'tl': '',
    },
    'lawcfwu5': {
      'en': '•',
      'tl': '',
    },
    'mjmobqfv': {
      'en': '₱',
      'tl': '',
    },
    '4y8zvlix': {
      'en': '•',
      'tl': '',
    },
    '7ykfj0a6': {
      'en': 'Burger',
      'tl': '',
    },
    'qgo3tz9d': {
      'en': '₱39',
      'tl': '',
    },
    'h7i301hf': {
      'en': 'Dunkin\'',
      'tl': '',
    },
    '77ii0vg0': {
      'en': '4.9',
      'tl': '',
    },
    'bnzirrpr': {
      'en': '(2000+)',
      'tl': '',
    },
    'kecexcpf': {
      'en': '35-55 min',
      'tl': '',
    },
    'd6fdhwhq': {
      'en': '•',
      'tl': '',
    },
    '2hz7doy1': {
      'en': '₱',
      'tl': '',
    },
    '2hota48v': {
      'en': '•',
      'tl': '',
    },
    '4y0cgf52': {
      'en': 'Donut',
      'tl': '',
    },
    'yksuwolb': {
      'en': '₱39',
      'tl': '',
    },
    '3f3wlzd4': {
      'en': 'Greenwich',
      'tl': '',
    },
    'yhtktaf8': {
      'en': '4.9',
      'tl': '',
    },
    '18l4be6a': {
      'en': '(4000+)',
      'tl': '',
    },
    'iyjwc619': {
      'en': '35-55 min',
      'tl': '',
    },
    '080tdjl2': {
      'en': '•',
      'tl': '',
    },
    '7nl2a5fk': {
      'en': '₱',
      'tl': '',
    },
    'fkyep7af': {
      'en': '•',
      'tl': '',
    },
    'vlbilitf': {
      'en': 'Pizza',
      'tl': '',
    },
    'tjl2th1a': {
      'en': '₱39',
      'tl': '',
    },
    'l14o7d0n': {
      'en': 'My Orders',
      'tl': '',
    },
    'qzv82tu4': {
      'en': 'My Profile',
      'tl': '',
    },
    'j9dsnsmg': {
      'en': 'Delivery Address',
      'tl': '',
    },
    'xglm9vh1': {
      'en': 'Payment Methods',
      'tl': '',
    },
    'nhmh13yb': {
      'en': 'Contact Us',
      'tl': '',
    },
    'rr1lufmi': {
      'en': 'Settings',
      'tl': '',
    },
    'q1p5r30w': {
      'en': 'Helps & FAQs',
      'tl': '',
    },
    'kcd6jblm': {
      'en': 'Log out',
      'tl': '',
    },
    'dnszxsxk': {
      'en': 'Home',
      'tl': '',
    },
  },
  // SignIn
  {
    '872xxqj8': {
      'en': 'Welcome Back',
      'tl': '',
    },
    '2jai55tc': {
      'en': 'Sign in to your account to continue',
      'tl': '',
    },
    'k51j8rrb': {
      'en': 'Forgot password?',
      'tl': '',
    },
    'ajzsadg1': {
      'en': 'Sign In',
      'tl': '',
    },
    'ss66aj72': {
      'en': 'or',
      'tl': '',
    },
    '4catnt91': {
      'en': 'Continue with Google',
      'tl': '',
    },
    'n001hf4z': {
      'en': 'Don\'t have an account? ',
      'tl': '',
    },
    '3trm8zny': {
      'en': 'Sign up',
      'tl': '',
    },
  },
  // CompleteAccount
  {
    'voa8fxol': {
      'en': 'Complete your account',
      'tl': '',
    },
    'dj7xbw07': {
      'en': 'We need to verify that it\'s you',
      'tl': '',
    },
    'ef9o227t': {
      'en': 'Full Name',
      'tl': '',
    },
    '4nfoaf20': {
      'en': 'Email Address',
      'tl': '',
    },
    'k3ok0ma9': {
      'en': 'Password',
      'tl': '',
    },
    'x3w8505r': {
      'en': 'Confirm Password',
      'tl': '',
    },
    '2gw5998e': {
      'en': 'I agree to the Terms of Service and Privacy Policy',
      'tl': '',
    },
    'aw17ywhw': {
      'en': 'Submit',
      'tl': '',
    },
  },
  // Splash
  {
    'raf91zrb': {
      'en': 'Home',
      'tl': '',
    },
  },
  // EnableLocation
  {
    'l4viz2zf': {
      'en': 'Enable Location Access',
      'tl': '',
    },
    'cuso201y': {
      'en':
          'We need access to your location to provide personalized recommendations and help you discover nearby places and services.',
      'tl': '',
    },
    'sztp0qwu': {
      'en': 'Find Nearby Places',
      'tl': '',
    },
    't1qlv8yx': {
      'en': 'Discover restaurants, shops, and services around you',
      'tl': '',
    },
    'j0ebadrs': {
      'en': 'Get Directions',
      'tl': '',
    },
    'w9y2slfe': {
      'en': 'Navigate to your destinations with turn-by-turn directions',
      'tl': '',
    },
    'y9zib3ic': {
      'en': 'Personalized Offers',
      'tl': '',
    },
    '7e22q9xd': {
      'en': 'Receive location-based deals and recommendations',
      'tl': '',
    },
    'wuanapb5': {
      'en': 'Allow Location Access',
      'tl': '',
    },
    'z4f6mr0h': {
      'en': 'Not Now',
      'tl': '',
    },
    '2nv28jy3': {
      'en': 'You can change this setting anytime in your device settings',
      'tl': '',
    },
  },
  // profile
  {
    'l29n9nai': {
      'en': 'Account',
      'tl': '',
    },
    'x6fp2ztf': {
      'en': 'Payment Options',
      'tl': '',
    },
    'mg3kxwip': {
      'en': 'Country',
      'tl': '',
    },
    'f9zfc9wa': {
      'en': 'Notification Settings',
      'tl': '',
    },
    'reajy4n1': {
      'en': 'Edit Profile',
      'tl': '',
    },
    '4eh16hr1': {
      'en': 'General',
      'tl': '',
    },
    'eb9gdtz1': {
      'en': 'Support',
      'tl': '',
    },
    '5se6063b': {
      'en': 'Terms of Service',
      'tl': '',
    },
    'i002klmk': {
      'en': 'Invite Friends',
      'tl': '',
    },
    'zvlbsunw': {
      'en': 'Profile',
      'tl': '',
    },
  },
  // favorites
  {
    'w55emymc': {
      'en': 'Tony\'s Pizza Palace',
      'tl': '',
    },
    'mzee1pml': {
      'en': 'Italian • Pizza • Pasta',
      'tl': '',
    },
    'm3jsg5hs': {
      'en': '4.8',
      'tl': '',
    },
    'fr0fw6se': {
      'en': '(120 reviews)',
      'tl': '',
    },
    'k57tcfyn': {
      'en': '25-35 min',
      'tl': '',
    },
    'mzl233if': {
      'en': 'Burger Junction',
      'tl': '',
    },
    'ntmp9hop': {
      'en': 'American • Burgers • Fries',
      'tl': '',
    },
    '25mnvgs0': {
      'en': '4.6',
      'tl': '',
    },
    '59znnoem': {
      'en': '(89 reviews)',
      'tl': '',
    },
    'raf34d7a': {
      'en': '20-30 min',
      'tl': '',
    },
    'aqqoqvgy': {
      'en': 'Sakura Sushi Bar',
      'tl': '',
    },
    '9kqqtvgo': {
      'en': 'Japanese • Sushi • Asian',
      'tl': '',
    },
    'hkeuxrc3': {
      'en': '4.9',
      'tl': '',
    },
    'daqzyyey': {
      'en': '(156 reviews)',
      'tl': '',
    },
    '6c6wbi3u': {
      'en': '30-40 min',
      'tl': '',
    },
    'ggwilw5n': {
      'en': 'El Mariachi Cantina',
      'tl': '',
    },
    'y9mepjmf': {
      'en': 'Mexican • Tacos • Burritos',
      'tl': '',
    },
    'gm4eoozv': {
      'en': '4.7',
      'tl': '',
    },
    'izqb4v3k': {
      'en': '(203 reviews)',
      'tl': '',
    },
    'xvvl8mgx': {
      'en': '15-25 min',
      'tl': '',
    },
    'lfpk4zam': {
      'en': 'Green Garden Cafe',
      'tl': '',
    },
    'dz5b1vuo': {
      'en': 'Healthy • Salads • Smoothies',
      'tl': '',
    },
    '1m4yhjoj': {
      'en': '4.5',
      'tl': '',
    },
    'itzlfiej': {
      'en': '(74 reviews)',
      'tl': '',
    },
    '9cog4emr': {
      'en': '10-20 min',
      'tl': '',
    },
    '7o8bs4wa': {
      'en': 'Crispy Chicken Co.',
      'tl': '',
    },
    '07k3ftka': {
      'en': 'American • Fried Chicken • Wings',
      'tl': '',
    },
    'suhyv36r': {
      'en': '4.4',
      'tl': '',
    },
    'ij8tj38j': {
      'en': '(95 reviews)',
      'tl': '',
    },
    '5rg6k82d': {
      'en': '20-30 min',
      'tl': '',
    },
    'd9tzjbnk': {
      'en': 'Favorites',
      'tl': '',
    },
    'em9shy14': {
      'en': 'Favorite',
      'tl': '',
    },
  },
  // Cart
  {
    'dnwvcmah': {
      'en': 'Classic Beef Burger',
      'tl': '',
    },
    'act74b3v': {
      'en': 'Juicy beef patty with lettuce, tomato, and special sauce',
      'tl': '',
    },
    'rzb9ce71': {
      'en': '₱ 12.99',
      'tl': '',
    },
    'hlqz2fy4': {
      'en': '2',
      'tl': '',
    },
    'axa60eja': {
      'en': 'Margherita Pizza',
      'tl': '',
    },
    'j6kanely': {
      'en': 'Fresh mozzarella, basil, and tomato sauce on crispy crust',
      'tl': '',
    },
    'r0kbicjp': {
      'en': '₱ 18.50',
      'tl': '',
    },
    '9i3mxgkk': {
      'en': '1',
      'tl': '',
    },
    'wowmvew1': {
      'en': 'Crispy French Fries',
      'tl': '',
    },
    'fsitg7zw': {
      'en': 'Golden crispy fries with sea salt',
      'tl': '',
    },
    'eoh0v42t': {
      'en': '₱ 5.99',
      'tl': '',
    },
    '15q50dwa': {
      'en': '1',
      'tl': '',
    },
    's6eyk6fl': {
      'en': 'Total',
      'tl': '',
    },
    'lz6oyab4': {
      'en': '(incl. fees and tax)',
      'tl': '',
    },
    'j94frsi9': {
      'en': 'See summary',
      'tl': '',
    },
    'q1sket66': {
      'en': '₱ 43.71',
      'tl': '',
    },
    'uigdeoq0': {
      'en': '₱ 50.71',
      'tl': '',
    },
    'pgimip50': {
      'en': 'Review payment and address',
      'tl': '',
    },
    'qqmk8pfh': {
      'en': 'Your Cart',
      'tl': '',
    },
  },
  // inbox
  {
    'a4hduabn': {
      'en': 'Messages',
      'tl': '',
    },
    'sb34syaa': {
      'en': 'Search conversations',
      'tl': '',
    },
    'yvg74vur': {
      'en': 'Active Orders',
      'tl': '',
    },
    '0vayi2io': {
      'en': 'See all',
      'tl': '',
    },
    'z00tlg72': {
      'en': 'Marcus Rodriguez',
      'tl': '',
    },
    'un4wln5n': {
      'en': '2 min',
      'tl': '',
    },
    'io229mcr': {
      'en': '🍕 Your pizza order is on the way! ETA: 15 minutes',
      'tl': '',
    },
    'b56eec39': {
      'en': 'Order #1247',
      'tl': '',
    },
    's1psorkw': {
      'en': 'En Route',
      'tl': '',
    },
    'us513ma8': {
      'en': 'Sarah Chen',
      'tl': '',
    },
    'eamnovp5': {
      'en': '5 min',
      'tl': '',
    },
    'idnlfwsq': {
      'en': '🍜 I\'m at your building entrance. Could you come down?',
      'tl': '',
    },
    'dgxrmqd5': {
      'en': 'Order #1245',
      'tl': '',
    },
    'vn5fv1jy': {
      'en': 'Arrived',
      'tl': '',
    },
    'r7a5s913': {
      'en': 'Recent Chats',
      'tl': '',
    },
    'xyynp2is': {
      'en': 'Clear all',
      'tl': '',
    },
    'm3xj3ugh': {
      'en': 'Alex Thompson',
      'tl': '',
    },
    '4e64iqsq': {
      'en': 'Yesterday',
      'tl': '',
    },
    'zq2vmz9b': {
      'en': 'Thanks for the quick delivery! Food was still hot 🔥',
      'tl': '',
    },
    'vc66p5bf': {
      'en': 'Maria Garcia',
      'tl': '',
    },
    'jto7rzki': {
      'en': '2 days ago',
      'tl': '',
    },
    'ag7z0xh9': {
      'en': 'Perfect delivery as always! See you next time',
      'tl': '',
    },
    'nzplbjbg': {
      'en': 'David Kim',
      'tl': '',
    },
    'a60ecpxe': {
      'en': '3 days ago',
      'tl': '',
    },
    'qs5qkfq3': {
      'en': 'Great service! The sushi was fresh and delicious',
      'tl': '',
    },
    '59c10431': {
      'en': 'Emma Wilson',
      'tl': '',
    },
    'buidqibu': {
      'en': '1 week ago',
      'tl': '',
    },
    'y3zdx6gf': {
      'en': 'Thank you for waiting! Really appreciate your patience',
      'tl': '',
    },
    'gjkn4ajk': {
      'en': 'James Brown',
      'tl': '',
    },
    'f481nbmy': {
      'en': '1 week ago',
      'tl': '',
    },
    'nztj4sbh': {
      'en': 'Amazing delivery speed! Food arrived in 10 minutes',
      'tl': '',
    },
    'k6qio6g9': {
      'en': 'Messages',
      'tl': '',
    },
  },
  // PhoneSignUp
  {
    'zk3u15a0': {
      'en': 'Welcome',
      'tl': '',
    },
    '205cj8ss': {
      'en': 'Sign up to create a new account',
      'tl': '',
    },
    'gmaak58u': {
      'en': 'Continue',
      'tl': '',
    },
    'ozf8f6oy': {
      'en': 'Phone number is required',
      'tl': '',
    },
    '0p8mad1s': {
      'en': 'Please choose an option from the dropdown',
      'tl': '',
    },
    '1pypdkpi': {
      'en':
          'By continuing, you agree to our Terms of Service and Privacy Policy',
      'tl': '',
    },
    'zpakdyip': {
      'en': 'Already have an account?',
      'tl': '',
    },
    '09bdq6po': {
      'en': ' Sign In',
      'tl': '',
    },
    'l212y6ah': {
      'en': 'Sign up with',
      'tl': '',
    },
    'lvzfouj1': {
      'en': 'Continue with Google',
      'tl': '',
    },
    's5ji59g8': {
      'en': 'Home',
      'tl': '',
    },
  },
  // PhoneVerification
  {
    'r2pvj63l': {
      'en': 'Enter verification code',
      'tl': '',
    },
    'n7jz446x': {
      'en':
          'We\'ve sent a 6-digit code to your phone number. Please enter it below.',
      'tl': '',
    },
    'ljhnjc6w': {
      'en': 'Verify',
      'tl': '',
    },
    'feg013k8': {
      'en': 'Didn\'t receive the code?',
      'tl': '',
    },
    'gt8woent': {
      'en': 'Resend Code',
      'tl': '',
    },
    '8e66z9pu': {
      'en': 'Phone Verification',
      'tl': '',
    },
    'xarxr5zj': {
      'en': 'Home',
      'tl': '',
    },
  },
  // ForgotPassword
  {
    '4ar6qqao': {
      'en': 'Type your email, we will send you verification code via email',
      'tl': '',
    },
    '9wgsiu8g': {
      'en': 'Email address',
      'tl': '',
    },
    'vtew5sc4': {
      'en': 'Email address',
      'tl': '',
    },
    'w5hop8ni': {
      'en': 'Please enter your valid email address.',
      'tl': '',
    },
    '097xqqz3': {
      'en': 'Please enter your  valid email address.',
      'tl': '',
    },
    'm5osepbb': {
      'en': 'Please choose an option from the dropdown',
      'tl': '',
    },
    'nqgng91i': {
      'en': 'Continue',
      'tl': '',
    },
    'o2jpobd0': {
      'en': 'Forgot password',
      'tl': '',
    },
    'zoxyvj4n': {
      'en': 'Home',
      'tl': '',
    },
  },
  // paymentmethod
  {
    'aiy8rgjh': {
      'en': 'Payment Methods',
      'tl': '',
    },
    'pxkxox4v': {
      'en': 'Choose your preferred payment method',
      'tl': '',
    },
    'l6jg5cts': {
      'en': 'Credit Card',
      'tl': '',
    },
    'zeit2fy5': {
      'en': 'Visa, Mastercard, American Express',
      'tl': '',
    },
    'wzuqu7yp': {
      'en': 'Digital Wallet',
      'tl': '',
    },
    'hfnmtk5w': {
      'en': 'Apple Pay, Google Pay, PayPal',
      'tl': '',
    },
    'g69tzhoa': {
      'en': 'Bank Transfer',
      'tl': '',
    },
    '8km8fs0h': {
      'en': 'Direct bank account transfer',
      'tl': '',
    },
    '8zpn80w3': {
      'en': 'QR Code Payment',
      'tl': '',
    },
    'jr2a6gqy': {
      'en': 'Scan to pay with mobile apps',
      'tl': '',
    },
    '0ezaydsh': {
      'en': 'Saved Payment Methods',
      'tl': '',
    },
    'r1bgdm5c': {
      'en': 'VISA',
      'tl': '',
    },
    'p05w1zyl': {
      'en': '•••• •••• •••• 4532',
      'tl': '',
    },
    'txym8lne': {
      'en': 'Expires 12/26',
      'tl': '',
    },
    'y4u8s1dw': {
      'en': 'MC',
      'tl': '',
    },
    'gcm194ti': {
      'en': '•••• •••• •••• 8901',
      'tl': '',
    },
    'z3qoyjwb': {
      'en': 'Expires 08/27',
      'tl': '',
    },
    'r3nxgec5': {
      'en': 'Add New Payment Method',
      'tl': '',
    },
    '0fl83sef': {
      'en': 'Continue',
      'tl': '',
    },
    '0sumiibq': {
      'en': 'Payment',
      'tl': '',
    },
  },
  // addresses
  {
    '1uwekeov': {
      'en': 'Home',
      'tl': '',
    },
    'nhynb2gs': {
      'en': 'Default',
      'tl': '',
    },
    '2d55acif': {
      'en': 'John Smith',
      'tl': '',
    },
    'uqgors52': {
      'en': '123 Main Street, Apt 4B',
      'tl': '',
    },
    '8kupbmsu': {
      'en': 'New York, NY 10001',
      'tl': '',
    },
    '0hlkn2w8': {
      'en': '+1 (555) 123-4567',
      'tl': '',
    },
    'g3elg2el': {
      'en': 'Office',
      'tl': '',
    },
    'a11182tn': {
      'en': 'John Smith',
      'tl': '',
    },
    '3fv523a3': {
      'en': '456 Business Ave, Suite 200',
      'tl': '',
    },
    'cf341kfa': {
      'en': 'New York, NY 10005',
      'tl': '',
    },
    'gdek3z2j': {
      'en': '+1 (555) 987-6543',
      'tl': '',
    },
    'w5vtncvk': {
      'en': 'Mom\'s House',
      'tl': '',
    },
    'b4jeh0lu': {
      'en': 'Sarah Johnson',
      'tl': '',
    },
    'h793359m': {
      'en': '789 Oak Street',
      'tl': '',
    },
    'rhxmsy9t': {
      'en': 'Brooklyn, NY 11201',
      'tl': '',
    },
    '4uxngvom': {
      'en': '+1 (555) 456-7890',
      'tl': '',
    },
    'q0q92d1o': {
      'en': 'Add New Address',
      'tl': '',
    },
    'q0w5wuwq': {
      'en': 'My Addresses',
      'tl': '',
    },
  },
  // EditAddress
  {
    'flnnwkiu': {
      'en': 'Full name',
      'tl': '',
    },
    'u3oaim3g': {
      'en': 'Phone number',
      'tl': '',
    },
    'mq2jwmfo': {
      'en': 'Region, Province, City, Barangay',
      'tl': '',
    },
    'crw7v7st': {
      'en': 'Postal code',
      'tl': '',
    },
    'e6j82b1h': {
      'en': 'Street name, Building, House Number',
      'tl': '',
    },
    'abdzycgr': {
      'en': 'Set as default address',
      'tl': '',
    },
    '8e0mpbs5': {
      'en': 'Address Type',
      'tl': '',
    },
    'bba9giae': {
      'en': 'Home',
      'tl': '',
    },
    'tsgojari': {
      'en': 'Work',
      'tl': '',
    },
    '3pv9z8fc': {
      'en': 'Save Address',
      'tl': '',
    },
    '2uxlcldr': {
      'en': 'Edit Address',
      'tl': '',
    },
  },
  // AddressSelectorRPCB
  {
    '7r35lj2v': {
      'en': 'Select Address',
      'tl': '',
    },
    '812mdu7e': {
      'en': 'Step 1 of 4',
      'tl': '',
    },
    'qsovsjcl': {
      'en': 'Select Region',
      'tl': '',
    },
    'smzvnwgo': {
      'en': 'Choose your region to continue',
      'tl': '',
    },
    '2zb0s4a1': {
      'en': 'Search your city',
      'tl': '',
    },
    'pkl7dyx7': {
      'en': 'Metro Manila',
      'tl': '',
    },
    '6oxy9qal': {
      'en': 'National Capital Region',
      'tl': '',
    },
    'jp38bpt7': {
      'en': 'North Luzon',
      'tl': '',
    },
    'v2m3z3bq': {
      'en': 'Northern Philippines',
      'tl': '',
    },
    'qxmf75sj': {
      'en': 'South Luzon',
      'tl': '',
    },
    '5oyoc35w': {
      'en': 'Southern Philippines',
      'tl': '',
    },
    'hum2nfu2': {
      'en': 'Visayas',
      'tl': '',
    },
    '0u1yi0ok': {
      'en': 'Central Philippines',
      'tl': '',
    },
    'a1e4ni7r': {
      'en': 'Mindanao',
      'tl': '',
    },
    'jgkpxzdr': {
      'en': 'Southern Philippines',
      'tl': '',
    },
    '2j7x0jsr': {
      'en': 'Metro Manila',
      'tl': '',
    },
    'qdfw4297': {
      'en': 'National Capital Region',
      'tl': '',
    },
    '4chsn3rh': {
      'en': 'North Luzon',
      'tl': '',
    },
    'ltnf8u2j': {
      'en': 'Northern Philippines',
      'tl': '',
    },
    'xh210z5r': {
      'en': 'South Luzon',
      'tl': '',
    },
    'fwhmtfzw': {
      'en': 'Southern Philippines',
      'tl': '',
    },
    '8mhtcccs': {
      'en': 'Visayas',
      'tl': '',
    },
    'kusk1arq': {
      'en': 'Central Philippines',
      'tl': '',
    },
    '1hhn8z8a': {
      'en': 'Mindanao',
      'tl': '',
    },
    '5bu305ok': {
      'en': 'Southern Philippines',
      'tl': '',
    },
    '7q2xwoln': {
      'en': 'Continue',
      'tl': '',
    },
  },
  // searchbar
  {
    'la70suk0': {
      'en': 'Find food or restaurant...',
      'tl': '',
    },
  },
  // cards
  {
    'ieuvbjlr': {
      'en': 'Fitness',
      'tl': '',
    },
    'xwm9vat1': {
      'en': 'The Running Ragamuffins',
      'tl': '',
    },
    'h1q8ssii': {
      'en': '216 Members',
      'tl': '',
    },
    'snz5w2gu': {
      'en': 'Health',
      'tl': '',
    },
    '8b7em0q8': {
      'en': 'Dads for Gas-free Groceries',
      'tl': '',
    },
    'xdl656qf': {
      'en': '352 Members',
      'tl': '',
    },
  },
  // restaurantCard
  {
    'whw8mqu3': {
      'en': 'McDonald\'s',
      'tl': '',
    },
    'fpa6s5qb': {
      'en': '4.9',
      'tl': '',
    },
    '3413mrv1': {
      'en': '(4000+)',
      'tl': '',
    },
    'k0ld69um': {
      'en': '35-55 min',
      'tl': '',
    },
    'vplpk2ec': {
      'en': '•',
      'tl': '',
    },
    '2hoovrja': {
      'en': '₱',
      'tl': '',
    },
    'h3lfqkkg': {
      'en': '•',
      'tl': '',
    },
    'airmu58z': {
      'en': 'Fast Food',
      'tl': '',
    },
    'df23n08h': {
      'en': '₱39',
      'tl': '',
    },
  },
  // ordercancel
  {
    '9kaneinu': {
      'en': 'Are you sure?',
      'tl': '',
    },
    'arw0g60p': {
      'en':
          'Are you sure you would like to delete this item from the shoping cart?',
      'tl': '',
    },
    'slto5k1k': {
      'en': 'No',
      'tl': '',
    },
    'm15sob97': {
      'en': 'Yes',
      'tl': '',
    },
  },
  // fooditem
  {
    'wf430nz2': {
      'en': 'Fried Tofu and Garden Fresh Buddha Bowl',
      'tl': '',
    },
    'aqidk1zx': {
      'en': 'Medium',
      'tl': '',
    },
    '3fwwbeq6': {
      'en': '₱100',
      'tl': '',
    },
  },
  // Miscellaneous
  {
    'gabhfck2': {
      'en': 'Allow Lalafang to access your device\'s location?',
      'tl': '',
    },
    'y1p1914l': {
      'en': 'Enable your location',
      'tl': '',
    },
    'iv0lksii': {
      'en': 'Allow Lalafang to notify you?',
      'tl': '',
    },
    'ukenk2ql': {
      'en': '',
      'tl': '',
    },
    '7rfgg7qy': {
      'en': '',
      'tl': '',
    },
    'yebkvf7k': {
      'en': '',
      'tl': '',
    },
    '2b6uvfbu': {
      'en': '',
      'tl': '',
    },
    '6o3xt9mj': {
      'en': '',
      'tl': '',
    },
    'j6wsdjt0': {
      'en': '',
      'tl': '',
    },
    'tgjgqcwf': {
      'en': '',
      'tl': '',
    },
    'etlyqzk2': {
      'en': '',
      'tl': '',
    },
    'uvc5u8rb': {
      'en': '',
      'tl': '',
    },
    'fnnf6p7o': {
      'en': '',
      'tl': '',
    },
    '109vok06': {
      'en': '',
      'tl': '',
    },
    'ovt3xeuj': {
      'en': '',
      'tl': '',
    },
    'd8nj2r0q': {
      'en': '',
      'tl': '',
    },
    'w6mcgr2g': {
      'en': '',
      'tl': '',
    },
    '2t31notj': {
      'en': '',
      'tl': '',
    },
    'vkyxlz7s': {
      'en': '',
      'tl': '',
    },
    '7hzqb3ff': {
      'en': '',
      'tl': '',
    },
    'hcv64dmm': {
      'en': '',
      'tl': '',
    },
    's6vq1wmo': {
      'en': '',
      'tl': '',
    },
    'qnqndf01': {
      'en': '',
      'tl': '',
    },
    'ez4rkyjm': {
      'en': '',
      'tl': '',
    },
    'aut6s3mj': {
      'en': '',
      'tl': '',
    },
    '1xhml4ra': {
      'en': '',
      'tl': '',
    },
    '8mynsnld': {
      'en': '',
      'tl': '',
    },
    'msslpqq5': {
      'en': '',
      'tl': '',
    },
  },
].reduce((a, b) => a..addAll(b));
