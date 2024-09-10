class Product {
  int? id;
  int? categoryId;
  String? productName;
  String? quantityPerUnit;
  double? unitPrince;
  int? unitsInStock;

  Product(this.id, this.categoryId, this.productName, this.quantityPerUnit,
      this.unitPrince, this.unitsInStock);

  Product.fromJson(Map<String, dynamic> json) {
    id = json["id"] is String ? int.tryParse(json["id"]) : json["id"];

    categoryId = json["categoryId"] is String
        ? int.tryParse(json["categoryId"])
        : json["categoryId"];

    productName = json["productName"];
    quantityPerUnit = json["quantityPerUnit"];

    if (json["unitPrice"] is String) {
      unitPrince = double.tryParse(json["unitPrice"]) ?? 0.0;
    } else {
      unitPrince = json["unitPrice"]?.toDouble();
    }

    unitsInStock = json["unitsInStock"] is String
        ? int.tryParse(json["unitsInStock"])
        : json["unitsInStock"];
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "categoryId": categoryId,
      "productName": productName,
      "quantityPerUnit": quantityPerUnit,
      "unitPrince": unitPrince,
      "unitsInStock": unitsInStock
    };
  }
}
