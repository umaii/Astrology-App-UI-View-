class ReportsM {
  String httpStatus;
  int httpStatusCode;
  bool success;
  String message;
  String apiName;
  Data data;

  ReportsM(
      {this.httpStatus,
      this.httpStatusCode,
      this.success,
      this.message,
      this.apiName,
      this.data});

  ReportsM.fromJson(Map<String, dynamic> json) {
    httpStatus = json['httpStatus'];
    httpStatusCode = json['httpStatusCode'];
    success = json['success'];
    message = json['message'];
    apiName = json['apiName'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['httpStatus'] = this.httpStatus;
    data['httpStatusCode'] = this.httpStatusCode;
    data['success'] = this.success;
    data['message'] = this.message;
    data['apiName'] = this.apiName;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  List<Services> services;

  Data({this.services});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['services'] != null) {
      // ignore: deprecated_member_use
      services = new List<Services>();
      json['services'].forEach((v) {
        services.add(new Services.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.services != null) {
      data['services'] = this.services.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Services {
  String name;
  String productCode;
  String imageUrl;
  String description;
  List<String> availableLanguages;
  List<String> indepthPoints;
  String price;
  String offerPrice;

  Services(
      {this.name,
      this.productCode,
      this.imageUrl,
      this.description,
      this.availableLanguages,
      this.indepthPoints,
      this.price,
      this.offerPrice});

  Services.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    productCode = json['productCode'];
    imageUrl = json['imageUrl'];
    description = json['description'];
    availableLanguages = json['availableLanguages'].cast<String>();
    indepthPoints = json['indepthPoints'].cast<String>();

    price = json['price'];
    offerPrice = json['offerPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['productCode'] = this.productCode;
    data['imageUrl'] = this.imageUrl;
    data['description'] = this.description;
    data['availableLanguages'] = this.availableLanguages;
    data['indepthPoints'] = this.indepthPoints;

    data['price'] = this.price;
    data['offerPrice'] = this.offerPrice;
    return data;
  }
}
