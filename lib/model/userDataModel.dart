class UserDataModel {
  String? email;
  String? phone;
  String? username;
  String? avatar;

  UserDataModel({this.email, this.phone, this.username, this.avatar});

  UserDataModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    phone = json['phone'];
    username = json['username'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['username'] = this.username;
    data['avatar'] = this.avatar;
    return data;
  }
}
