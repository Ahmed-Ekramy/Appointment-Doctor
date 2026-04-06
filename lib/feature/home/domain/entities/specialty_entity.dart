import 'package:equatable/equatable.dart';

class SpecializationEntity extends Equatable {
  final int id;
  final String name;

  const SpecializationEntity({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [id, name];
}