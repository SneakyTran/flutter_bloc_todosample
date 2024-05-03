// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Project _$ProjectFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Project',
      json,
      ($checkedConvert) {
        final val = Project(
          id: $checkedConvert('id', (v) => v as String?),
          name: $checkedConvert('name', (v) => v as String),
          description: $checkedConvert('description', (v) => v as String),
          startDate:
              $checkedConvert('start_date', (v) => DateTime.parse(v as String)),
          endDate:
              $checkedConvert('end_date', (v) => DateTime.parse(v as String)),
          group: $checkedConvert('group', (v) => v as String),
          logo: $checkedConvert('logo', (v) => v as String),
          tasks: $checkedConvert(
              'tasks',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => Task.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
      fieldKeyMap: const {'startDate': 'start_date', 'endDate': 'end_date'},
    );

Map<String, dynamic> _$ProjectToJson(Project instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'start_date': instance.startDate.toIso8601String(),
      'end_date': instance.endDate.toIso8601String(),
      'group': instance.group,
      'logo': instance.logo,
      'tasks': instance.tasks,
    };
