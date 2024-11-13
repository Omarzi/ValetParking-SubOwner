class SubOwnerProfileDataModel {
  String? adminId;
  String? email;
  String? password;
  double? lat;
  double? lng;
  int? salary;
  String? role;
  List<String>? garage;
  String? createdAt;
  String? updatedAt;

  SubOwnerProfileDataModel(
      {this.adminId,
        this.email,
        this.password,
        this.lat,
        this.lng,
        this.salary,
        this.role,
        this.garage,
        this.createdAt,
        this.updatedAt});

  SubOwnerProfileDataModel.fromJson(Map<String, dynamic> json) {
    adminId = json['adminId'];
    email = json['email'];
    password = json['password'];
    lat = json['lat'];
    lng = json['lng'];
    salary = json['salary'];
    role = json['role'];
    garage = json['garage'].cast<String>();
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adminId'] = this.adminId;
    data['email'] = this.email;
    data['password'] = this.password;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['salary'] = this.salary;
    data['role'] = this.role;
    data['garage'] = this.garage;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
