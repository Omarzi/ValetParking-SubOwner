class GetOrdersInAllGaragesModel {
  List<OrderDetails>? orderDetails;

  GetOrdersInAllGaragesModel({this.orderDetails});

  GetOrdersInAllGaragesModel.fromJson(Map<String, dynamic> json) {
    if (json['order Details'] != null) {
      orderDetails = <OrderDetails>[];
      json['order Details'].forEach((v) {
        orderDetails!.add(new OrderDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.orderDetails != null) {
      data['order Details'] =
          this.orderDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderDetails {
  String? orderId;
  User? user;
  Garage? garage;
  String? typeOfCar;
  String? date;
  TimeRange? timeRange;
  dynamic? totalPrice;
  dynamic? duration;
  String? paymentMethod;
  String? status;
  bool? startNow;
  String? qrCode;
  String? createdAt;
  String? updatedAt;
  bool? isPaid;

  OrderDetails(
      {this.orderId,
        this.user,
        this.garage,
        this.typeOfCar,
        this.date,
        this.timeRange,
        this.totalPrice,
        this.duration,
        this.paymentMethod,
        this.status,
        this.startNow,
        this.qrCode,
        this.createdAt,
        this.updatedAt,
        this.isPaid});

  OrderDetails.fromJson(Map<String, dynamic> json) {
    orderId = json['orderId'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    garage =
    json['garage'] != null ? new Garage.fromJson(json['garage']) : null;
    typeOfCar = json['typeOfCar'];
    date = json['date'];
    timeRange = json['timeRange'] != null
        ? new TimeRange.fromJson(json['timeRange'])
        : null;
    totalPrice = json['totalPrice'];
    duration = json['duration'];
    paymentMethod = json['paymentMethod'];
    status = json['status'];
    startNow = json['startNow'];
    qrCode = json['qrCode'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    isPaid = json['isPaid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderId'] = this.orderId;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.garage != null) {
      data['garage'] = this.garage!.toJson();
    }
    data['typeOfCar'] = this.typeOfCar;
    data['date'] = this.date;
    if (this.timeRange != null) {
      data['timeRange'] = this.timeRange!.toJson();
    }
    data['totalPrice'] = this.totalPrice;
    data['duration'] = this.duration;
    data['paymentMethod'] = this.paymentMethod;
    data['status'] = this.status;
    data['startNow'] = this.startNow;
    data['qrCode'] = this.qrCode;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['isPaid'] = this.isPaid;
    return data;
  }
}

class User {
  String? userId;
  String? name;
  String? email;
  String? phone;
  String? carName;
  String? carNumber;
  String? createdAt;
  String? updatedAt;

  User(
      {this.userId,
        this.name,
        this.email,
        this.phone,
        this.carName,
        this.carNumber,
        this.createdAt,
        this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    carName = json['carName'];
    carNumber = json['carNumber'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['carName'] = this.carName;
    data['carNumber'] = this.carNumber;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class Garage {
  String? garageId;
  List<String>? garageImages;
  String? garageName;
  String? garageDescription;
  dynamic? garagePricePerHour;
  dynamic? lat;
  dynamic? lng;
  String? openDate;
  String? endDate;
  bool? active;
  String? createdAt;
  String? updatedAt;

  Garage(
      {this.garageId,
        this.garageImages,
        this.garageName,
        this.garageDescription,
        this.garagePricePerHour,
        this.lat,
        this.lng,
        this.openDate,
        this.endDate,
        this.active,
        this.createdAt,
        this.updatedAt});

  Garage.fromJson(Map<String, dynamic> json) {
    garageId = json['garageId'];
    garageImages = json['garageImages'].cast<String>();
    garageName = json['garageName'];
    garageDescription = json['garageDescription'];
    garagePricePerHour = json['garagePricePerHour'];
    lat = json['lat'];
    lng = json['lng'];
    openDate = json['openDate'];
    endDate = json['endDate'];
    active = json['active'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['garageId'] = this.garageId;
    data['garageImages'] = this.garageImages;
    data['garageName'] = this.garageName;
    data['garageDescription'] = this.garageDescription;
    data['garagePricePerHour'] = this.garagePricePerHour;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['openDate'] = this.openDate;
    data['endDate'] = this.endDate;
    data['active'] = this.active;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class TimeRange {
  String? start;
  String? end;

  TimeRange({this.start, this.end});

  TimeRange.fromJson(Map<String, dynamic> json) {
    start = json['start'];
    end = json['end'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['start'] = this.start;
    data['end'] = this.end;
    return data;
  }
}

// class GetOrdersInAllGaragesModel {
//   List<OrderDetails>? orderDetails;
//
//   GetOrdersInAllGaragesModel({this.orderDetails});
//
//   GetOrdersInAllGaragesModel.fromJson(Map<String, dynamic> json) {
//     if (json['order Details'] != null) {
//       orderDetails = <OrderDetails>[];
//       json['order Details'].forEach((v) {
//         orderDetails!.add(new OrderDetails.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.orderDetails != null) {
//       data['order Details'] =
//           this.orderDetails!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class OrderDetails {
//   String? orderId;
//   User? user;
//   Garage? garage;
//   String? typeOfCar;
//   String? date;
//   TimeRange? timeRange;
//   dynamic? totalPrice;
//   dynamic? duration;
//   String? paymentMethod;
//   bool? isPaid;
//   String? status;
//   bool? startNow;
//   String? qrCode;
//   String? createdAt;
//   String? updatedAt;
//   String? timeLeft;
//
//   OrderDetails(
//       {this.orderId,
//         this.user,
//         this.garage,
//         this.typeOfCar,
//         this.date,
//         this.timeRange,
//         this.totalPrice,
//         this.duration,
//         this.paymentMethod,
//         this.isPaid,
//         this.status,
//         this.startNow,
//         this.qrCode,
//         this.createdAt,
//         this.updatedAt,
//         this.timeLeft});
//
//   OrderDetails.fromJson(Map<String, dynamic> json) {
//     orderId = json['orderId'];
//     user = json['user'] != null ? new User.fromJson(json['user']) : null;
//     garage =
//     json['garage'] != null ? new Garage.fromJson(json['garage']) : null;
//     typeOfCar = json['typeOfCar'];
//     date = json['date'];
//     timeRange = json['timeRange'] != null
//         ? new TimeRange.fromJson(json['timeRange'])
//         : null;
//     totalPrice = json['totalPrice'];
//     duration = json['duration'];
//     paymentMethod = json['paymentMethod'];
//     isPaid = json['isPaid'];
//     status = json['status'];
//     startNow = json['startNow'];
//     qrCode = json['qrCode'];
//     createdAt = json['createdAt'];
//     updatedAt = json['updatedAt'];
//     timeLeft = json['timeLeft'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['orderId'] = this.orderId;
//     if (this.user != null) {
//       data['user'] = this.user!.toJson();
//     }
//     if (this.garage != null) {
//       data['garage'] = this.garage!.toJson();
//     }
//     data['typeOfCar'] = this.typeOfCar;
//     data['date'] = this.date;
//     if (this.timeRange != null) {
//       data['timeRange'] = this.timeRange!.toJson();
//     }
//     data['totalPrice'] = this.totalPrice;
//     data['duration'] = this.duration;
//     data['paymentMethod'] = this.paymentMethod;
//     data['isPaid'] = this.isPaid;
//     data['status'] = this.status;
//     data['startNow'] = this.startNow;
//     data['qrCode'] = this.qrCode;
//     data['createdAt'] = this.createdAt;
//     data['updatedAt'] = this.updatedAt;
//     data['timeLeft'] = this.timeLeft;
//     return data;
//   }
// }
//
// class User {
//   String? userId;
//   String? username;
//   String? email;
//   String? password;
//   String? phone;
//   String? carName;
//   String? carNumber;
//   List<String>? saved;
//   String? role;
//   String? createdAt;
//   String? updatedAt;
//   bool? passwordResetVerified;
//   String? profileImage;
//   String? carImage;
//
//   User(
//       {this.userId,
//         this.username,
//         this.email,
//         this.password,
//         this.phone,
//         this.carName,
//         this.carNumber,
//         this.saved,
//         this.role,
//         this.createdAt,
//         this.updatedAt,
//         this.passwordResetVerified,
//         this.profileImage,
//         this.carImage});
//
//   User.fromJson(Map<String, dynamic> json) {
//     userId = json['userId'];
//     username = json['username'];
//     email = json['email'];
//     password = json['password'];
//     phone = json['phone'];
//     carName = json['carName'];
//     carNumber = json['carNumber'];
//     saved = json['saved'].cast<String>();
//     role = json['role'];
//     createdAt = json['createdAt'];
//     updatedAt = json['updatedAt'];
//     passwordResetVerified = json['passwordResetVerified'];
//     profileImage = json['profileImage'];
//     carImage = json['carImage'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['userId'] = this.userId;
//     data['username'] = this.username;
//     data['email'] = this.email;
//     data['password'] = this.password;
//     data['phone'] = this.phone;
//     data['carName'] = this.carName;
//     data['carNumber'] = this.carNumber;
//     data['saved'] = this.saved;
//     data['role'] = this.role;
//     data['createdAt'] = this.createdAt;
//     data['updatedAt'] = this.updatedAt;
//     data['passwordResetVerified'] = this.passwordResetVerified;
//     data['profileImage'] = this.profileImage;
//     data['carImage'] = this.carImage;
//     return data;
//   }
// }
//
// class Garage {
//   String? garageId;
//   String? gragename;
//   String? grageDescription;
//   List<String>? garageImages;
//   dynamic? gragePricePerHoure;
//   dynamic? lat;
//   dynamic? lng;
//   String? openDate;
//   String? endDate;
//   bool? active;
//   List<String>? driver;
//   List<String>? subOwner;
//   String? createdAt;
//   String? updatedAt;
//   String? grageImages;
//
//   Garage(
//       {this.garageId,
//         this.gragename,
//         this.grageDescription,
//         this.garageImages,
//         this.gragePricePerHoure,
//         this.lat,
//         this.lng,
//         this.openDate,
//         this.endDate,
//         this.active,
//         this.driver,
//         this.subOwner,
//         this.createdAt,
//         this.updatedAt,
//         this.grageImages});
//
//   Garage.fromJson(Map<String, dynamic> json) {
//     garageId = json['garageId'];
//     gragename = json['gragename'];
//     grageDescription = json['grageDescription'];
//     garageImages = json['garageImages'].cast<String>();
//     gragePricePerHoure = json['gragePricePerHoure'];
//     lat = json['lat'];
//     lng = json['lng'];
//     openDate = json['openDate'];
//     endDate = json['endDate'];
//     active = json['active'];
//     driver = json['driver'].cast<String>();
//     subOwner = json['subOwner'].cast<String>();
//     createdAt = json['createdAt'];
//     updatedAt = json['updatedAt'];
//     grageImages = json['grageImages'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['garageId'] = this.garageId;
//     data['gragename'] = this.gragename;
//     data['grageDescription'] = this.grageDescription;
//     data['garageImages'] = this.garageImages;
//     data['gragePricePerHoure'] = this.gragePricePerHoure;
//     data['lat'] = this.lat;
//     data['lng'] = this.lng;
//     data['openDate'] = this.openDate;
//     data['endDate'] = this.endDate;
//     data['active'] = this.active;
//     data['driver'] = this.driver;
//     data['subOwner'] = this.subOwner;
//     data['createdAt'] = this.createdAt;
//     data['updatedAt'] = this.updatedAt;
//     data['grageImages'] = this.grageImages;
//     return data;
//   }
// }
//
// class TimeRange {
//   String? start;
//   String? end;
//
//   TimeRange({this.start, this.end});
//
//   TimeRange.fromJson(Map<String, dynamic> json) {
//     start = json['start'];
//     end = json['end'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['start'] = this.start;
//     data['end'] = this.end;
//     return data;
//   }
// }
