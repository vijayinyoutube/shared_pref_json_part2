// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class HomePageModel {
  final String name;
  final int? age;

  HomePageModel(
    this.name,
    this.age,
  );

  

  HomePageModel copyWith({
    String? name,
    int? age,
  }) {
    return HomePageModel(
      name ?? this.name,
      age ?? this.age,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'age': age,
    };
  }

  factory HomePageModel.fromMap(Map<String, dynamic> map) {
    return HomePageModel(
      map['name'] as String,
      map['age'] != null ? map['age'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory HomePageModel.fromJson(String source) => HomePageModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'HomePageModel(name: $name, age: $age)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is HomePageModel &&
      other.name == name &&
      other.age == age;
  }

  @override
  int get hashCode => name.hashCode ^ age.hashCode;
}
