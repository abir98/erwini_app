

class login_request_model {
 String? phone;
 String? password;

 login_request_model({required this.phone, required this.password});

 login_request_model.fromJson(Map<String, dynamic> json) {
  phone = json['phone'];
  password = json['password'];
 }

 Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['phone'] = this.phone;
  data['password'] = this.password;
  return data;
 }
}
