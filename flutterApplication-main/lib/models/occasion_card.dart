//lib\models\occasion_card.dart

import 'dart:convert';

OccasionCardModels occasionCardModelsFromJson(String str) =>
    OccasionCardModels.fromJson(json.decode(str));

String occasionCardModelsToJson(OccasionCardModels data) =>
    json.encode(data.toJson());

class OccasionCardModels {
  final int status;
  final String message;
  final int totalProducts;
  final List<OccasionCard> products;
  final dynamic productDetail;

  OccasionCardModels({
    required this.status,
    required this.message,
    required this.totalProducts,
    required this.products,
    required this.productDetail,
  });

  factory OccasionCardModels.fromJson(Map<String, dynamic> json) =>
      OccasionCardModels(
        status: json["status"],
        message: json["message"],
        totalProducts: json["totalProducts"],
        products: List<OccasionCard>.from(
            json["products"].map((x) => OccasionCard.fromJson(x))),
        productDetail: json["productDetail"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "totalProducts": totalProducts,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "productDetail": productDetail,
      };
}

class OccasionCard {
  final int productId;
  final String productName;
  final CategoryName categoryName;
  final String subCategoryName;
  final dynamic price;
  final int categoryCode;
  final int subCategoryCode;
  final String description;
  final dynamic gender;
  final String weight;
  final Karat karat;
  final String wastage;
  final Soulmate soulmateName;
  final Gifting giftingName;
  final String occasion;
  final Soulmate soulmate;
  final Gifting gifting;
  final int? genderCode; // Nullable int
  final int? tagNumber; // Nullable int
  final int? size; // Nullable int
  final int? length; // Nullable int
  final Wholeseller wholeseller;
  final List<String> imageUrls;

  OccasionCard({
    required this.productId,
    required this.productName,
    required this.categoryName,
    required this.subCategoryName,
    required this.price,
    required this.categoryCode,
    required this.subCategoryCode,
    required this.description,
    required this.gender,
    required this.weight,
    required this.karat,
    required this.wastage,
    required this.soulmateName,
    required this.giftingName,
    required this.occasion,
    required this.soulmate,
    required this.gifting,
    required this.genderCode,
    required this.tagNumber,
    required this.size,
    required this.length,
    required this.wholeseller,
    required this.imageUrls,
  });

  factory OccasionCard.fromJson(Map<String, dynamic> json) => OccasionCard(
        productId: json["productId"],
        productName: json["productName"] ?? "",
        categoryName: categoryNameValues.map[json["categoryName"]]!,
        subCategoryName: json["subCategoryName"] ?? "",
        price: json["price"],
        categoryCode: json["categoryCode"],
        subCategoryCode: json["subCategoryCode"],
        description: json["description"] ?? "",
        gender: json["gender"] ?? "",
        weight: json["weight"] ?? "",
        karat: karatValues.map[json["karat"]]!,
        wastage: json["wastage"] ?? "",
        soulmateName: soulmateValues.map[json["soulmateName"]]!,
        giftingName: giftingValues.map[json["giftingName"]]!,
        occasion: json["occasion"] ?? "",
        soulmate: soulmateValues.map[json["soulmate"]]!,
        gifting: giftingValues.map[json["gifting"]]!,
        genderCode: json["genderCode"], // Now nullable
        tagNumber: json["tagNumber"], // Now nullable
        size: json["size"], // Now nullable
        length: json["length"], // Now nullable
        wholeseller: wholesellerValues.map[json["wholeseller"]]!,
        imageUrls: List<String>.from(json["imageUrls"].map((x) => x ?? "")),
      );

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "productName": productName,
        "categoryName": categoryNameValues.reverse[categoryName],
        "subCategoryName": subCategoryName,
        "price": price,
        "categoryCode": categoryCode,
        "subCategoryCode": subCategoryCode,
        "description": description,
        "gender": gender,
        "weight": weight,
        "karat": karat,
        "wastage": wastage,
        "soulmateName": soulmateValues.reverse[soulmateName],
        "giftingName": giftingValues.reverse[giftingName],
        "occasion": occasion,
        "soulmate": soulmateValues.reverse[soulmate],
        "gifting": giftingValues.reverse[gifting],
        "genderCode": genderCode, // Nullable
        "tagNumber": tagNumber, // Nullable
        "size": size, // Nullable
        "length": length, // Nullable
        "wholeseller": wholesellerValues.reverse[wholeseller],
        "imageUrls": List<dynamic>.from(imageUrls.map((x) => x)),
      };
}

enum CategoryName { ANTIQUE, DIAMOND, GOLD }

final categoryNameValues = EnumValues({
  "Antique": CategoryName.ANTIQUE,
  "Diamond": CategoryName.DIAMOND,
  "Gold": CategoryName.GOLD
});

enum Gifting { BIRTHDAY, SISTER }

final giftingValues =
    EnumValues({"Birthday": Gifting.BIRTHDAY, "Sister": Gifting.SISTER});

enum Karat { THE_14_K, THE_18_K, THE_22_K, THE_24_K }

final karatValues = EnumValues({
  "14K": Karat.THE_14_K,
  "18K": Karat.THE_18_K,
  "22K": Karat.THE_22_K,
  "24K": Karat.THE_24_K
});

extension KaratExtension on Karat {
  String get displayString {
    switch (this) {
      case Karat.THE_14_K:
        return "14K";
      case Karat.THE_18_K:
        return "18K";
      case Karat.THE_22_K:
        return "22K";
      case Karat.THE_24_K:
        return "24K";
      default:
        return "";
    }
  }
}

enum Soulmate { FRIEND, HIM }

final soulmateValues =
    EnumValues({"Friend": Soulmate.FRIEND, "Him": Soulmate.HIM});

enum Wholeseller { BANSAL }

final wholesellerValues = EnumValues({"BANSAL": Wholeseller.BANSAL});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
