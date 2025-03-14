import 'package:equatable/equatable.dart';
import 'package:hive_ce/hive.dart';

part 'hive_registrar.g.dart'; // Ensure this part is present

@HiveType(typeId: 0) // Unique ID for Hive Adapter
class Diamond extends HiveObject with EquatableMixin {
  @HiveField(0)
  final num qty;

  @HiveField(1)
  final String lotID;

  @HiveField(2)
  final String size;

  @HiveField(3)
  final num carat;

  @HiveField(4)
  final String lab;

  @HiveField(5)
  final String shape;

  @HiveField(6)
  final String color;

  @HiveField(7)
  final String clarity;

  @HiveField(8)
  final String cut;

  @HiveField(9)
  final String polish;

  @HiveField(10)
  final String symmetry;

  @HiveField(11)
  final String fluorescence;

  @HiveField(12)
  final num discount;

  @HiveField(13)
  final num perCaratRate;

  @HiveField(14)
  final num finalAmount;

  @HiveField(15)
  final String keyToSymbol;

  @HiveField(16)
  final String labComment;
  @HiveField(17)
  final bool addedToCart;

  Diamond({
    required this.qty,
    required this.lotID,
    required this.size,
    required this.carat,
    required this.lab,
    required this.shape,
    required this.color,
    required this.clarity,
    required this.cut,
    required this.polish,
    required this.symmetry,
    required this.fluorescence,
    required this.discount,
    required this.perCaratRate,
    required this.finalAmount,
    required this.keyToSymbol,
    required this.labComment,
    required this.addedToCart,
  });

  factory Diamond.fromJson(Map<String, dynamic> json) {
    return Diamond(
      qty: json['Qty'],
      lotID: json['Lot ID'],
      size: json['Size'],
      carat: json['Carat'],
      lab: json['Lab'],
      shape: json['Shape'],
      color: json['Color'],
      clarity: json['Clarity'],
      cut: json['Cut'],
      polish: json['Polish'],
      symmetry: json['Symmetry'],
      fluorescence: json['Fluorescence'],
      discount: json['Discount'],
      perCaratRate: json['Per Carat Rate'],
      finalAmount: json['Final Amount'],
      keyToSymbol: json['Key To Symbol'],
      labComment: json['Lab Comment'],
      addedToCart: json['addedToCart'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Qty': qty,
      'Lot ID': lotID,
      'Size': size,
      'Carat': carat,
      'Lab': lab,
      'Shape': shape,
      'Color': color,
      'Clarity': clarity,
      'Cut': cut,
      'Polish': polish,
      'Symmetry': symmetry,
      'Fluorescence': fluorescence,
      'Discount': discount,
      'Per Carat Rate': perCaratRate,
      'Final Amount': finalAmount,
      'Key To Symbol': keyToSymbol,
      'Lab Comment': labComment,
      'addedToCart': addedToCart,
    };
  }

  @override
  List<Object?> get props => [lotID, carat, color, clarity, shape, finalAmount];
}
