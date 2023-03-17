class UserModel{
   String? name;
   String? email;
   String? Uid;
   String? Phone;
  String? ProfilImg;

UserModel({
  this.name,
  this.email,
  this.Phone,
  this.Uid,
  this.ProfilImg
});

UserModel.fromJson(dynamic json){
  name = json['name'];
  email = json['email'];
  Phone = json['Phone'];
  Uid = json['Uid'];
  ProfilImg = json['ProfilImg'];
}

   Map<String, dynamic> ToMap(){
     final Map<String, dynamic> data = new Map<String, dynamic>();
     data['name'] = this.name;
     data['email'] = this.email;
     data['Phone'] = this.Phone;
     data['Uid'] = this.Uid;
     data['ProfilImg'] = this.ProfilImg;

     return data;
   }


}