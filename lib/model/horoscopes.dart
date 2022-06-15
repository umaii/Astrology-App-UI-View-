class HoroscopesM {
  String httpStatus;
  int httpStatusCode;
  bool success;
  String message;
  String apiName;
  String title;
  List<Data> data;

  HoroscopesM(
      {this.httpStatus,
      this.httpStatusCode,
      this.success,
      this.message,
      this.apiName,
      this.title,
      this.data});

  HoroscopesM.fromJson(Map<String, dynamic> json) {
    httpStatus = json['httpStatus'];
    httpStatusCode = json['httpStatusCode'];
    success = json['success'];
    message = json['message'];
    apiName = json['apiName'];
    title = json['title'];
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
    data['title'] = this.title;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String name;
  String date;
  String img;
  Images images;
  String urlSlug;

  Data({this.name, this.date, this.img, this.images, this.urlSlug});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    date = json['date'];
    img = json['img'];
    images =
        json['images'] != null ? new Images.fromJson(json['images']) : null;
    urlSlug = json['urlSlug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['date'] = this.date;
    data['img'] = this.img;
    if (this.images != null) {
      data['images'] = this.images.toJson();
    }
    data['urlSlug'] = this.urlSlug;
    return data;
  }
}

class Images {
  Small small;
  Large large;
  Small medium;

  Images({this.small, this.large, this.medium});

  Images.fromJson(Map<String, dynamic> json) {
    small = json['small'] != null ? new Small.fromJson(json['small']) : null;
    large = json['large'] != null ? new Large.fromJson(json['large']) : null;
    medium = json['medium'] != null ? new Small.fromJson(json['medium']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.small != null) {
      data['small'] = this.small.toJson();
    }
    if (this.large != null) {
      data['large'] = this.large.toJson();
    }
    if (this.medium != null) {
      data['medium'] = this.medium.toJson();
    }
    return data;
  }
}

class Small {
  String imageUrl;
  int id;

  Small({this.imageUrl, this.id});

  Small.fromJson(Map<String, dynamic> json) {
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

class Large {
  String imageUrl;
  String id;

  Large({this.imageUrl, this.id});

  Large.fromJson(Map<String, dynamic> json) {
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
