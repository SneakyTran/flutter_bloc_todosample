import 'package:equatable/equatable.dart';

sealed class EditProjectEvent extends Equatable {
  const EditProjectEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class EditTitleChanged extends EditProjectEvent {
  const EditTitleChanged(this.title);
  final String title;

  @override
  // TODO: implement props
  List<Object?> get props => [title];
}

final class EditDescriptionChanged extends EditProjectEvent {
  const EditDescriptionChanged(this.description);
  final String description;

  @override
  // TODO: implement props
  List<Object?> get props => [description];
}

final class EditGroupChanged extends EditProjectEvent {
  const EditGroupChanged(this.group);
  final String group;

  @override
  // TODO: implement props
  List<Object?> get props => [group];
}

final class EditLogoChanged extends EditProjectEvent {
  const EditLogoChanged(this.logo);
  final String logo;

  @override
  // TODO: implement props
  List<Object?> get props => [logo];
}

final class EditStartDateChanged extends EditProjectEvent {
  const EditStartDateChanged(
    this.startDate,
  );
  final DateTime startDate;
  @override
  List<Object?> get props => [startDate];
}

final class EditEndDateChanged extends EditProjectEvent {
  const EditEndDateChanged(
    this.endDate,
  );
  final DateTime endDate;
  @override
  List<Object?> get props => [endDate];
}

final class EditProjectSubmitted extends EditProjectEvent {
  const EditProjectSubmitted();
}
