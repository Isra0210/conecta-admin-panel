import 'package:equatable/equatable.dart';

class UserViewModel implements Equatable {
  const UserViewModel({required this.id, required this.name});

  final String id;
  final String name;

  factory UserViewModel.fromMap(Map<String, dynamic> map) {
    return UserViewModel(id: map['id'].toString(), name: map['name']);
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name};
  }

  @override
  List<Object?> get props => [id];

  @override
  bool? get stringify => true;
  
  @override
  String toString() {
    return "name: $name";
  }
}
