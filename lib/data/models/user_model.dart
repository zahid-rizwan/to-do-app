class UserModel {
  final  String email;

  UserModel({ required this.email});

  factory UserModel.fromJson(Map<String,dynamic> data){
    return UserModel(
      email: data["Email"],

    );
  }

  toJson(){
    return {"Email":email};
  }
}