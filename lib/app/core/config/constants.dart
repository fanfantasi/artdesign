import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class Constants {
  final _getStorage = GetStorage();
  String get token => _getStorage.read('token');
  String get uid => _getStorage.read('uid');

  static const appName =
      'ArtDesign - Architectural, Interior Products and Design Inspiration Platform';
  static Color appThemeColor = const Color(0xFF004e89);
  static const supportEmail = 'fan.fantasi@gmail.com';
  static const baseurl = '';
}

enum ViewState { initial, busy, error, data }
enum ViewSection { filter, sort, gridorlist }
enum ViewProject { detail, contact }
enum ViewType { products, professional, projects, event, articles, inspiration }
