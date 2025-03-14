class DiamondData {
  List<Diamonds>? diamonds;

  DiamondData({this.diamonds});

  DiamondData.fromJson(Map<String, dynamic> json) {
    if (json['Diamonds'] != null) {
      diamonds = <Diamonds>[];
      json['Diamonds'].forEach((v) {
        diamonds!.add(Diamonds.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (diamonds != null) {
      data['Diamonds'] = diamonds!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Diamonds {
  num? qty;
  String? lotID;
  String? size;
  num? carat;
  String? lab;
  String? shape;
  String? color;
  String? clarity;
  String? cut;
  String? polish;
  String? symmetry;
  String? fluorescence;
  num? discount;
  num? perCaratRate;
  num? finalAmount;
  String? keyToSymbol;
  String? labComment;

  Diamonds({
    this.qty,
    this.lotID,
    this.size,
    this.carat,
    this.lab,
    this.shape,
    this.color,
    this.clarity,
    this.cut,
    this.polish,
    this.symmetry,
    this.fluorescence,
    this.discount,
    this.perCaratRate,
    this.finalAmount,
    this.keyToSymbol,
    this.labComment,
  });

  Diamonds.fromJson(Map<String, dynamic> json) {
    qty = json['Qty'];
    lotID = json['Lot ID'];
    size = json['Size'];
    carat = json['Carat'];
    lab = json['Lab'];
    shape = json['Shape'];
    color = json['Color'];
    clarity = json['Clarity'];
    cut = json['Cut'];
    polish = json['Polish'];
    symmetry = json['Symmetry'];
    fluorescence = json['Fluorescence'];
    discount = json['Discount'];
    perCaratRate = json['Per Carat Rate'];
    finalAmount = json['Final Amount'];
    keyToSymbol = json['Key To Symbol'];
    labComment = json['Lab Comment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Qty'] = qty;
    data['Lot ID'] = lotID;
    data['Size'] = size;
    data['Carat'] = carat;
    data['Lab'] = lab;
    data['Shape'] = shape;
    data['Color'] = color;
    data['Clarity'] = clarity;
    data['Cut'] = cut;
    data['Polish'] = polish;
    data['Symmetry'] = symmetry;
    data['Fluorescence'] = fluorescence;
    data['Discount'] = discount;
    data['Per Carat Rate'] = perCaratRate;
    data['Final Amount'] = finalAmount;
    data['Key To Symbol'] = keyToSymbol;
    data['Lab Comment'] = labComment;
    return data;
  }
}
