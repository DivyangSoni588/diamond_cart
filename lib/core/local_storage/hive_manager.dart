import 'dart:io';

import 'package:diamond_cart/src/home/domain/models/hive_registrar.dart';
import 'package:hive_ce/hive.dart';

class HiveManager {
  static const String boxName = 'diamondCartBox';

  static Future<void> init() async {
    Hive.init(Directory.current.path);
    Hive.registerAdapter(DiamondAdapter());
    await Hive.openBox<Diamond>(boxName);
  }

  static Box<Diamond> get box => Hive.box<Diamond>(boxName);

  static Future<void> addToCart(Diamond item) async {
    await box.put(item.lotID, item);
  }

  static List<Diamond> getCartItems() {
    return box.values.toList();
  }

  static Future<void> removeFromCart(String lotID) async {
    await box.delete(lotID);
  }
}
