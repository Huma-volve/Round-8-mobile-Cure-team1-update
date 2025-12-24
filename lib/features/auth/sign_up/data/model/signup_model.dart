import 'package:cure_team_1_update/features/auth/sign_up/data/model/user_data_model.dart';

class SignupModel {
  bool? success;
  String? message;
  UserDataModel? data;

  SignupModel({this.success, this.message, this.data});

  SignupModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data =
        json['data'] != null ? new UserDataModel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}
