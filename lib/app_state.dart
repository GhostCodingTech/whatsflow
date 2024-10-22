import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _recentlyCalledUsers = prefs
              .getStringList('ff_recentlyCalledUsers')
              ?.map((path) => path.ref)
              .toList() ??
          _recentlyCalledUsers;
    });
    _safeInit(() {
      _appId = prefs.getString('ff_appId') ?? _appId;
    });
    _safeInit(() {
      _appCertificate = prefs.getString('ff_appCertificate') ?? _appCertificate;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _croppedImage = '';
  String get croppedImage => _croppedImage;
  set croppedImage(String value) {
    _croppedImage = value;
  }

  List<DocumentReference> _recentlyCalledUsers = [];
  List<DocumentReference> get recentlyCalledUsers => _recentlyCalledUsers;
  set recentlyCalledUsers(List<DocumentReference> value) {
    _recentlyCalledUsers = value;
    prefs.setStringList(
        'ff_recentlyCalledUsers', value.map((x) => x.path).toList());
  }

  void addToRecentlyCalledUsers(DocumentReference value) {
    recentlyCalledUsers.add(value);
    prefs.setStringList('ff_recentlyCalledUsers',
        _recentlyCalledUsers.map((x) => x.path).toList());
  }

  void removeFromRecentlyCalledUsers(DocumentReference value) {
    recentlyCalledUsers.remove(value);
    prefs.setStringList('ff_recentlyCalledUsers',
        _recentlyCalledUsers.map((x) => x.path).toList());
  }

  void removeAtIndexFromRecentlyCalledUsers(int index) {
    recentlyCalledUsers.removeAt(index);
    prefs.setStringList('ff_recentlyCalledUsers',
        _recentlyCalledUsers.map((x) => x.path).toList());
  }

  void updateRecentlyCalledUsersAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    recentlyCalledUsers[index] = updateFn(_recentlyCalledUsers[index]);
    prefs.setStringList('ff_recentlyCalledUsers',
        _recentlyCalledUsers.map((x) => x.path).toList());
  }

  void insertAtIndexInRecentlyCalledUsers(int index, DocumentReference value) {
    recentlyCalledUsers.insert(index, value);
    prefs.setStringList('ff_recentlyCalledUsers',
        _recentlyCalledUsers.map((x) => x.path).toList());
  }

  String _appId = '5cf49d1548f44913a13f253de0927f89';
  String get appId => _appId;
  set appId(String value) {
    _appId = value;
    prefs.setString('ff_appId', value);
  }

  String _appCertificate = '0954921618884424b1e1911f056fa524';
  String get appCertificate => _appCertificate;
  set appCertificate(String value) {
    _appCertificate = value;
    prefs.setString('ff_appCertificate', value);
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
