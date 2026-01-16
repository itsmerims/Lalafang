import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _isLiked = await secureStorage.getBool('ff_isLiked') ?? _isLiked;
    });
    await _safeInitAsync(() async {
      _regionSelected =
          await secureStorage.getBool('ff_regionSelected') ?? _regionSelected;
    });
    await _safeInitAsync(() async {
      _provinceSelected = await secureStorage.getBool('ff_provinceSelected') ??
          _provinceSelected;
    });
    await _safeInitAsync(() async {
      _citySelected =
          await secureStorage.getBool('ff_citySelected') ?? _citySelected;
    });
    await _safeInitAsync(() async {
      _barangaySelected = await secureStorage.getBool('ff_barangaySelected') ??
          _barangaySelected;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  double _userLatitude = 0.0;
  double get userLatitude => _userLatitude;
  set userLatitude(double value) {
    _userLatitude = value;
  }

  double _userLongitude = 0.0;
  double get userLongitude => _userLongitude;
  set userLongitude(double value) {
    _userLongitude = value;
  }

  bool _isLiked = false;
  bool get isLiked => _isLiked;
  set isLiked(bool value) {
    _isLiked = value;
    secureStorage.setBool('ff_isLiked', value);
  }

  void deleteIsLiked() {
    secureStorage.delete(key: 'ff_isLiked');
  }

  String _phone = '';
  String get phone => _phone;
  set phone(String value) {
    _phone = value;
  }

  bool _toggleagree = false;
  bool get toggleagree => _toggleagree;
  set toggleagree(bool value) {
    _toggleagree = value;
  }

  bool _regionSelected = false;
  bool get regionSelected => _regionSelected;
  set regionSelected(bool value) {
    _regionSelected = value;
    secureStorage.setBool('ff_regionSelected', value);
  }

  void deleteRegionSelected() {
    secureStorage.delete(key: 'ff_regionSelected');
  }

  bool _provinceSelected = false;
  bool get provinceSelected => _provinceSelected;
  set provinceSelected(bool value) {
    _provinceSelected = value;
    secureStorage.setBool('ff_provinceSelected', value);
  }

  void deleteProvinceSelected() {
    secureStorage.delete(key: 'ff_provinceSelected');
  }

  bool _citySelected = false;
  bool get citySelected => _citySelected;
  set citySelected(bool value) {
    _citySelected = value;
    secureStorage.setBool('ff_citySelected', value);
  }

  void deleteCitySelected() {
    secureStorage.delete(key: 'ff_citySelected');
  }

  bool _barangaySelected = false;
  bool get barangaySelected => _barangaySelected;
  set barangaySelected(bool value) {
    _barangaySelected = value;
    secureStorage.setBool('ff_barangaySelected', value);
  }

  void deleteBarangaySelected() {
    secureStorage.delete(key: 'ff_barangaySelected');
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
