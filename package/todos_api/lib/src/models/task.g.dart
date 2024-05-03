// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Task _$TaskFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Task',
      json,
      ($checkedConvert) {
        final val = Task(
          projectId: $checkedConvert('project_id', (v) => v as String),
          id: $checkedConvert('id', (v) => v as String?),
          title: $checkedConvert('title', (v) => v as String),
          description: $checkedConvert('description', (v) => v as String),
          status: $checkedConvert(
              'status',
              (v) =>
                  $enumDecodeNullable(_$TaskStatusEnumMap, v) ??
                  TaskStatus.todo),
        );
        return val;
      },
      fieldKeyMap: const {'projectId': 'project_id'},
    );

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
      'id': instance.id,
      'project_id': instance.projectId,
      'title': instance.title,
      'description': instance.description,
      'status': _$TaskStatusEnumMap[instance.status]!,
    };

const _$TaskStatusEnumMap = {
  TaskStatus.todo: 'todo',
  TaskStatus.done: 'done',
  TaskStatus.inProgress: 'inProgress',
};
