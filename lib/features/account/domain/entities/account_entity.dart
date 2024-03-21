import 'package:equatable/equatable.dart';

class AccountEntity extends Equatable {
  final String name;
  final List<int> image;
  final double balance;

  const AccountEntity({
    required this.name,
    required this.image,
    required this.balance,
  });

  @override
  List<Object?> get props => [name, image, balance];
}
