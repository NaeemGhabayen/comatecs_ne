class ProductModel {
  ProductModel({
    this.id,
    this.name,
    this.details,
    this.features,
    this.productImages,
    this.productAttachments,
    this.deliveryPrice,
    this.deliveryDuration,
    this.price,
    this.discountValue,
    this.brand,
    this.subCategory,
  });

  final int? id;
  final String? name;
  final String? details;
  final String? features;
  final List<ProductImage>? productImages;
  final List<ProductAttachment>? productAttachments;
  final int? deliveryPrice;
  final String? deliveryDuration;
  final int? price;
  final int? discountValue;
  final Brand? brand;
  final SubCategory? subCategory;

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["id"],
      name: json["name"],
      details: json["details"],
      features: json["features"],
      productImages: json["productImages"] == null
          ? []
          : List<ProductImage>.from(
              json["productImages"].map((x) => ProductImage.fromJson(x))),
      productAttachments: json["productAttachments"] == null
          ? []
          : List<ProductAttachment>.from(json["productAttachments"]
              .map((x) => ProductAttachment.fromJson(x))),
      deliveryPrice: json["deliveryPrice"],
      deliveryDuration: json["deliveryDuration"],
      price: json["price"],
      discountValue: json["discountValue"],
      brand: json["brand"] == null ? null : Brand.fromJson(json["brand"]),
      subCategory: json["subCategory"] == null
          ? null
          : SubCategory.fromJson(json["subCategory"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "details": details,
        "features": features,
        "productImages": productImages!.map((x) => x.toJson()).toList(),
        "productAttachments":
            productAttachments!.map((x) => x.toJson()).toList(),
        "deliveryPrice": deliveryPrice,
        "deliveryDuration": deliveryDuration,
        "price": price,
        "discountValue": discountValue,
        "brand": brand!.toJson(),
        "subCategory": subCategory!.toJson(),
      };
}

class Brand {
  Brand({
    this.id,
    this.name,
  });

  final int? id;
  final String? name;

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      id: json["id"],
      name: json["name"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class ProductAttachment {
  ProductAttachment({
    this.id,
    this.title,
    this.attachmentUrl,
    this.productId,
  });

  final int? id;
  final String? title;
  final String? attachmentUrl;
  final int? productId;

  factory ProductAttachment.fromJson(Map<String, dynamic> json) {
    return ProductAttachment(
      id: json["id"],
      title: json["title"],
      attachmentUrl: json["attachmentUrl"],
      productId: json["productId"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "attachmentUrl": attachmentUrl,
        "productId": productId,
      };
}

class ProductImage {
  ProductImage({
    this.id,
    this.imageUrl,
    this.productId,
  });

  final int? id;
  final String? imageUrl;
  final int? productId;

  factory ProductImage.fromJson(Map<String, dynamic> json) {
    return ProductImage(
      id: json["id"],
      imageUrl: json["imageUrl"],
      productId: json["productId"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "imageUrl": imageUrl,
        "productId": productId,
      };
}

class SubCategory {
  SubCategory({
    this.id,
    this.name,
    this.category,
  });

  final int? id;
  final String? name;
  final Brand? category;

  factory SubCategory.fromJson(Map<String, dynamic> json) {
    return SubCategory(
      id: json["id"],
      name: json["name"],
      category:
          json["category"] == null ? null : Brand.fromJson(json["category"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "category": category!.toJson(),
      };
}
