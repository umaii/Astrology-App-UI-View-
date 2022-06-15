class BannerM {
  String httpStatus;
  int httpStatusCode;
  bool success;
  String message;
  String apiName;
  List<Data> data;

  BannerM(
      {this.httpStatus,
      this.httpStatusCode,
      this.success,
      this.message,
      this.apiName,
      this.data});

  BannerM.fromJson(Map<String, dynamic> json) {
    httpStatus = json['httpStatus'];
    httpStatusCode = json['httpStatusCode'];
    success = json['success'];
    message = json['message'];
    apiName = json['apiName'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['httpStatus'] = this.httpStatus;
    data['httpStatusCode'] = this.httpStatusCode;
    data['success'] = this.success;
    data['message'] = this.message;
    data['apiName'] = this.apiName;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int id;
  String name;
  String landingUrl;
  String orderType;
  MetaData metaData;
  Images images;

  Data(
      {this.id,
      this.name,
      this.landingUrl,
      this.orderType,
      this.metaData,
      this.images});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    landingUrl = json['landingUrl'];
    orderType = json['orderType'];
    metaData = json['metaData'] != null
        ? new MetaData.fromJson(json['metaData'])
        : null;
    images =
        json['images'] != null ? new Images.fromJson(json['images']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['landingUrl'] = this.landingUrl;
    data['orderType'] = this.orderType;
    if (this.metaData != null) {
      data['metaData'] = this.metaData.toJson();
    }
    if (this.images != null) {
      data['images'] = this.images.toJson();
    }
    return data;
  }
}

class MetaData {
  String productCode;
  String productName;
  String professionalSlug;

  MetaData({this.productCode, this.productName, this.professionalSlug});

  MetaData.fromJson(Map<String, dynamic> json) {
    productCode = json['productCode'];
    productName = json['productName'];
    professionalSlug = json['professionalSlug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productCode'] = this.productCode;
    data['productName'] = this.productName;
    data['professionalSlug'] = this.professionalSlug;
    return data;
  }
}

class Images {
  Medium medium;

  Images({this.medium});

  Images.fromJson(Map<String, dynamic> json) {
    medium =
        json['medium'] != null ? new Medium.fromJson(json['medium']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.medium != null) {
      data['medium'] = this.medium.toJson();
    }
    return data;
  }
}

class Medium {
  String imageUrl;
  int id;

  Medium({this.imageUrl, this.id});

  Medium.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageUrl'] = this.imageUrl;
    data['id'] = this.id;
    return data;
  }
}
