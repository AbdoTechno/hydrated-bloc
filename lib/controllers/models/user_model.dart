import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String name;
  final int id;
  final String email;
  const UserModel({required this.name, required this.email, required this.id});

  @override
  List<Object?> get props => [name, email, id];
}

// immutable means that the object cannot be changed once it is created

// in the above code we are creating a UserModel class
// which has three properties name, email and id 
//and we are using equatable package to make the class immutable and to compare
// the objects of the class. 
// we are overriding the props getter to return the list of properties
// which will be used to compare the objects of the class.
// this is a good practice to make the model class immutable 
//and to use equatable package to compare the objects of the class.