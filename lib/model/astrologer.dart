class AstrologerM {
  String httpStatus;
  int httpStatusCode;
  bool success;
  String message;
  String apiName;
  List<Data> data;

  AstrologerM(
      {this.httpStatus,
      this.httpStatusCode,
      this.success,
      this.message,
      this.apiName,
      this.data});

  AstrologerM.fromJson(Map<String, dynamic> json) {
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
  String urlSlug;
  Null namePrefix;
  String firstName;
  String lastName;
  String aboutMe;
  Null profliePicUrl;
  double experience;
  List<String> languages;
  int minimumCallDuration;
  double minimumCallDurationCharges;
  double additionalPerMinuteCharges;
  bool isAvailable;
  String rating;
  List<String> skills;
  bool isOnCall;
  Images images;
  Availability availability;

  Data(
      {this.id,
      this.urlSlug,
      this.namePrefix,
      this.firstName,
      this.lastName,
      this.aboutMe,
      this.profliePicUrl,
      this.experience,
      this.languages,
      this.minimumCallDuration,
      this.minimumCallDurationCharges,
      this.additionalPerMinuteCharges,
      this.isAvailable,
      this.rating,
      this.skills,
      this.isOnCall,
      this.images,
      this.availability});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    urlSlug = json['urlSlug'];
    namePrefix = json['namePrefix'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    aboutMe = json['aboutMe'];
    profliePicUrl = json['profliePicUrl'];
    experience = json['experience'];
    languages = json['languages'].cast<String>();
    minimumCallDuration = json['minimumCallDuration'];
    minimumCallDurationCharges = json['minimumCallDurationCharges'];
    additionalPerMinuteCharges = json['additionalPerMinuteCharges'];
    isAvailable = json['isAvailable'];
    rating = json['rating'];
    skills = json['skills'].cast<String>();
    isOnCall = json['isOnCall'];
    images =
        json['images'] != null ? new Images.fromJson(json['images']) : null;
    availability = json['availability'] != null
        ? new Availability.fromJson(json['availability'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['urlSlug'] = this.urlSlug;
    data['namePrefix'] = this.namePrefix;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['aboutMe'] = this.aboutMe;
    data['profliePicUrl'] = this.profliePicUrl;
    data['experience'] = this.experience;
    data['languages'] = this.languages;
    data['minimumCallDuration'] = this.minimumCallDuration;
    data['minimumCallDurationCharges'] = this.minimumCallDurationCharges;
    data['additionalPerMinuteCharges'] = this.additionalPerMinuteCharges;
    data['isAvailable'] = this.isAvailable;
    data['rating'] = this.rating;
    data['skills'] = this.skills;
    data['isOnCall'] = this.isOnCall;
    if (this.images != null) {
      data['images'] = this.images.toJson();
    }
    if (this.availability != null) {
      data['availability'] = this.availability.toJson();
    }
    return data;
  }
}

class Images {
  Large large;
  Large medium;

  Images({this.large, this.medium});

  Images.fromJson(Map<String, dynamic> json) {
    large = json['large'] != null ? new Large.fromJson(json['large']) : null;
    medium = json['medium'] != null ? new Large.fromJson(json['medium']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.large != null) {
      data['large'] = this.large.toJson();
    }
    if (this.medium != null) {
      data['medium'] = this.medium.toJson();
    }
    return data;
  }
}

class Large {
  String imageUrl;
  int id;

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

class Availability {
  List<String> days;
  Slot slot;

  Availability({this.days, this.slot});

  Availability.fromJson(Map<String, dynamic> json) {
    days = json['days'].cast<String>();
    slot = json['slot'] != null ? new Slot.fromJson(json['slot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['days'] = this.days;
    if (this.slot != null) {
      data['slot'] = this.slot.toJson();
    }
    return data;
  }
}

class Slot {
  String toFormat;
  String fromFormat;
  String from;
  String to;

  Slot({this.toFormat, this.fromFormat, this.from, this.to});

  Slot.fromJson(Map<String, dynamic> json) {
    toFormat = json['toFormat'];
    fromFormat = json['fromFormat'];
    from = json['from'];
    to = json['to'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['toFormat'] = this.toFormat;
    data['fromFormat'] = this.fromFormat;
    data['from'] = this.from;
    data['to'] = this.to;
    return data;
  }
}
