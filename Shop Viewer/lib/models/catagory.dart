class Catagory {
  int? id;
  String? categoryName;
  String? seoUrl;

  Catagory(this.id, this.categoryName, this.seoUrl);

  Catagory.fromJson(Map json) {
    id = json["id"] is String ? int.tryParse(json["id"]) : json["id"];
    categoryName = json["categoryName"];
    seoUrl = json["seoUrl"];
  }
  Map toJson() {
    return {"id": id, "categoryName": categoryName, "seoUrl": seoUrl};
  }
}
