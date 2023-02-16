List<UserModel> userFromJson(dynamic str) =>
    List<UserModel>.from((str).map((x) => UserModel.fromJson(x)));

class UserModel {
  late int? id;
  late String? nombre;
  late String? email;
  late String? status;
  late String? Genero;
  late String userImage = "";

  UserModel({this.id, this.nombre, this.email, this.status, this.Genero});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nombre = json['name'];
    email = json['email'];
    status = json['status'];
    Genero = json['Genero'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = nombre;
    _data['email'] = email;
    _data['status'] = status;
    _data['Genero'] = Genero;
    return _data;
  }
  /*Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'edad': edad, 'email': email};
  }*/
}
