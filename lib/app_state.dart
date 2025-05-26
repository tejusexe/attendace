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
      _TimeAppState = await secureStorage.read(key: 'ff_TimeAppState') != null
          ? DateTime.fromMillisecondsSinceEpoch(
              (await secureStorage.getInt('ff_TimeAppState'))!)
          : _TimeAppState;
    });
    await _safeInitAsync(() async {
      _isMarkedOut =
          await secureStorage.getBool('ff_isMarkedOut') ?? _isMarkedOut;
    });
    await _safeInitAsync(() async {
      _reqCheckinTime =
          await secureStorage.read(key: 'ff_reqCheckinTime') != null
              ? DateTime.fromMillisecondsSinceEpoch(
                  (await secureStorage.getInt('ff_reqCheckinTime'))!)
              : _reqCheckinTime;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  String _markinpic = '';
  String get markinpic => _markinpic;
  set markinpic(String value) {
    _markinpic = value;
  }

  DateTime? _TimeAppState = DateTime.fromMillisecondsSinceEpoch(1736360700000);
  DateTime? get TimeAppState => _TimeAppState;
  set TimeAppState(DateTime? value) {
    _TimeAppState = value;
    value != null
        ? secureStorage.setInt('ff_TimeAppState', value.millisecondsSinceEpoch)
        : secureStorage.remove('ff_TimeAppState');
  }

  void deleteTimeAppState() {
    secureStorage.delete(key: 'ff_TimeAppState');
  }

  bool _isMarkedOut = false;
  bool get isMarkedOut => _isMarkedOut;
  set isMarkedOut(bool value) {
    _isMarkedOut = value;
    secureStorage.setBool('ff_isMarkedOut', value);
  }

  void deleteIsMarkedOut() {
    secureStorage.delete(key: 'ff_isMarkedOut');
  }

  DateTime? _reqCheckinTime =
      DateTime.fromMillisecondsSinceEpoch(1745897400000);
  DateTime? get reqCheckinTime => _reqCheckinTime;
  set reqCheckinTime(DateTime? value) {
    _reqCheckinTime = value;
    value != null
        ? secureStorage.setInt(
            'ff_reqCheckinTime', value.millisecondsSinceEpoch)
        : secureStorage.remove('ff_reqCheckinTime');
  }

  void deleteReqCheckinTime() {
    secureStorage.delete(key: 'ff_reqCheckinTime');
  }

  DateTime? _reqCheckoutTime =
      DateTime.fromMillisecondsSinceEpoch(1745937000000);
  DateTime? get reqCheckoutTime => _reqCheckoutTime;
  set reqCheckoutTime(DateTime? value) {
    _reqCheckoutTime = value;
  }

  DateTime? _debg = DateTime.fromMillisecondsSinceEpoch(1737624000000);
  DateTime? get debg => _debg;
  set debg(DateTime? value) {
    _debg = value;
  }

  List<DateTime> _holidayList = [
    DateTime.fromMillisecondsSinceEpoch(1738580412429)
  ];
  List<DateTime> get holidayList => _holidayList;
  set holidayList(List<DateTime> value) {
    _holidayList = value;
  }

  void addToHolidayList(DateTime value) {
    holidayList.add(value);
  }

  void removeFromHolidayList(DateTime value) {
    holidayList.remove(value);
  }

  void removeAtIndexFromHolidayList(int index) {
    holidayList.removeAt(index);
  }

  void updateHolidayListAtIndex(
    int index,
    DateTime Function(DateTime) updateFn,
  ) {
    holidayList[index] = updateFn(_holidayList[index]);
  }

  void insertAtIndexInHolidayList(int index, DateTime value) {
    holidayList.insert(index, value);
  }

  String _userId = '';
  String get userId => _userId;
  set userId(String value) {
    _userId = value;
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
