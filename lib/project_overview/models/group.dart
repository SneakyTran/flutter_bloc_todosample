import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:todolistapp/constants.dart';

enum GroupStyleEnum {
  work("Work", Icons.work, kColorPink),
  personal("Personal", Icons.account_circle, kColorPurple),
  study("Study", Icons.menu_book, kColorOrange);

  const GroupStyleEnum(this.name, this.icon, this.color);
  final String name;
  final IconData icon;
  final Color color;

  static GroupStyleEnum? getGroupStyleEnum(String groupName) =>
      GroupStyleEnum.values
          .firstWhereOrNull((group) => group.name == groupName);
}

class Group extends Equatable {
  Group({required this.name, required this.groupStyleEnum});

  final String name;
  final GroupStyleEnum groupStyleEnum;

  @override
  // TODO: implement props
  List<Object?> get props => [name, groupStyleEnum];
}

extension ListExtension<T> on List<T> {
  T? firstWhereOrNull(bool Function(T element) condition) {
    for (final element in this) {
      if (condition(element)) return element;
    }
    return null;
  }
}
