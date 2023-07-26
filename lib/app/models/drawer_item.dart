import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class DrawerItemModel extends Equatable {
  final IconData icon;
  final String text;

  const DrawerItemModel({
    required this.icon,
    required this.text,
  });

  @override
  List<Object?> get props => [
    text,
  ];
}
