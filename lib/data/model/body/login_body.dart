class LoginBody {
  String? user_name;
  String? password;
  String? mobile_no;
  String? studentId;

  LoginBody({this.user_name, this.password,this.studentId,this.mobile_no});

  LoginBody.fromJson(Map<String, dynamic> json) {
    user_name = json['email'];
    password = json['password'];
    studentId = json['student_id'];
    mobile_no = json['mobile'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if(this.user_name!=null){
      data['email'] = this.user_name;
    }
    if(this.password!=null){
      data['password'] = this.password;
    }
    if(this.studentId!=null){
      data['student_id'] = this.studentId;
    }
    if(this.mobile_no!=null){
      data['mobile'] = this.mobile_no;
    }

    return data;
  }

  @override
  String toString() {
    return '{email: $user_name, password: $password}';
  }
}