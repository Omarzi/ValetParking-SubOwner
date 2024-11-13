class SubOwnerDataModel {
  String? message;
  AdminData? adminData;
  String? token;

  SubOwnerDataModel({this.message, this.adminData, this.token});

  SubOwnerDataModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    adminData = json['adminData'] != null
        ? new AdminData.fromJson(json['adminData'])
        : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.adminData != null) {
      data['adminData'] = this.adminData!.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class AdminData {
  String? adminId;
  String? email;
  double? lat;
  double? lng;
  int? salary;
  String? role;
  List<Garage>? garage;
  String? createdAt;
  String? updatedAt;

  AdminData(
      {this.adminId,
        this.email,
        this.lat,
        this.lng,
        this.salary,
        this.role,
        this.garage,
        this.createdAt,
        this.updatedAt});

  AdminData.fromJson(Map<String, dynamic> json) {
    adminId = json['adminId'];
    email = json['email'];
    lat = json['lat'];
    lng = json['lng'];
    salary = json['salary'];
    role = json['role'];
    if (json['garage'] != null) {
      garage = <Garage>[];
      json['garage'].forEach((v) {
        garage!.add(new Garage.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adminId'] = this.adminId;
    data['email'] = this.email;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['salary'] = this.salary;
    data['role'] = this.role;
    if (this.garage != null) {
      data['garage'] = this.garage!.map((v) => v.toJson()).toList();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class Garage {
  String? garageId;
  List<String>? garageImages;
  String? createdAt;
  String? updatedAt;

  Garage({this.garageId, this.garageImages, this.createdAt, this.updatedAt});

  Garage.fromJson(Map<String, dynamic> json) {
    garageId = json['garageId'];
    garageImages = json['garageImages'].cast<String>();
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['garageId'] = this.garageId;
    data['garageImages'] = this.garageImages;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
