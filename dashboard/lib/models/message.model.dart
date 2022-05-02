import 'base.model.dart';

class Message extends BaseModel {
  String? message;

  Message({
    message,
  });

  Message.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    return data;
  }
}