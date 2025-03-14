import 'package:diamond_cart/src/home/domain/models/hive_registrar.dart';
import 'package:hive_ce/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveManager {
  static const String boxName = 'diamondCartBox';

  static Future<void> init() async {
    final String path = (await getApplicationDocumentsDirectory()).path;
    Hive.init(path);
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
