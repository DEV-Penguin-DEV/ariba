import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  Color _green = Color(4283416882);
  Color get green => _green;
  set green(Color _value) {
    _green = _value;
  }

  Color _defaultColor = Color(4289572287);
  Color get defaultColor => _defaultColor;
  set defaultColor(Color _value) {
    _defaultColor = _value;
  }

  Color _TextBlack = Color(4280887593);
  Color get TextBlack => _TextBlack;
  set TextBlack(Color _value) {
    _TextBlack = _value;
  }

  Color _grayLight = Color(4293125091);
  Color get grayLight => _grayLight;
  set grayLight(Color _value) {
    _grayLight = _value;
  }

  Color _whiteText = Color(4294967295);
  Color get whiteText => _whiteText;
  set whiteText(Color _value) {
    _whiteText = _value;
  }

  Color _grayDark = Color(4289242276);
  Color get grayDark => _grayDark;
  set grayDark(Color _value) {
    _grayDark = _value;
  }

  Color _primaryBtn = Color(4294967295);
  Color get primaryBtn => _primaryBtn;
  set primaryBtn(Color _value) {
    _primaryBtn = _value;
  }

  Color _lineColor = Color(4292928487);
  Color get lineColor => _lineColor;
  set lineColor(Color _value) {
    _lineColor = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

Color? _colorFromIntValue(int? val) {
  if (val == null) {
    return null;
  }
  return Color(val);
}
