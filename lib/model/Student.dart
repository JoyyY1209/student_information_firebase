class Student{
  String? id;
  String? name;
  String? nickName;
  int? clas;
  int? age;
  String? phnNumber;
  String? email;
  String? location;
  String? gender;

  Student({
    this.id,
    this.name,
    this.nickName,
    this.clas,
    this.age,
    this.phnNumber,
    this.email,
    this.location,
    this.gender
});

  Map<String,dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'nickName': nickName,
      'clas': clas,
      'age': age,
      'phnNumber': phnNumber,
      'email': email,
      'location': location,
      'gender': gender,
    };
  }

    static Student fromJson(Map<String,dynamic> json){
      return Student(
        id : json['id'],
        name:json['name'],
        nickName: json['nickName'],
        clas: json['clas'],
        age: json['age'],
        phnNumber: json['phnNumber'],
        email: json['email'],
        location: json['location'],
        gender: json['gender'],
      );
    }

}