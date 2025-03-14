import 'package:diamond_cart/src/home/domain/entities/diamond_data.dart';

import '../../domain/models/hive_registrar.dart';

class DiamondMapper {
  /// Convert Hive `Diamond` → Domain `DiamondModel`
  static Diamonds fromHive(Diamond diamond) {
    return Diamonds(
      qty: diamond.qty,
      lotID: diamond.lotID,
      size: diamond.size,
      carat: diamond.carat,
      lab: diamond.lab,
      shape: diamond.shape,
      color: diamond.color,
      clarity: diamond.clarity,
      cut: diamond.cut,
      polish: diamond.polish,
      symmetry: diamond.symmetry,
      fluorescence: diamond.fluorescence,
      discount: diamond.discount,
      perCaratRate: diamond.perCaratRate,
      finalAmount: diamond.finalAmount,
      keyToSymbol: diamond.keyToSymbol,
      labComment: diamond.labComment,
      addedToCart: diamond.addedToCart,
    );
  }

  static Diamond toHive(Diamonds diamond) {
    return Diamond(
      qty: diamond.qty ?? 0,
      lotID: diamond.lotID ?? '',
      size: diamond.size ?? '',
      carat: diamond.carat ?? 0,
      lab: diamond.lab ?? '',
      shape: diamond.shape ?? '',
      color: diamond.color ?? '',
      clarity: diamond.clarity ?? '',
      cut: diamond.cut ?? '',
      polish: diamond.polish ?? '',
      symmetry: diamond.symmetry ?? '',
      fluorescence: diamond.fluorescence ?? '',
      discount: diamond.discount ?? 0,
      perCaratRate: diamond.perCaratRate ?? 0,
      finalAmount: diamond.finalAmount ?? 0,
      keyToSymbol: diamond.keyToSymbol ?? '',
      labComment: diamond.labComment ?? '',
      addedToCart: diamond.addedToCart ?? false,
    );
  }
}
