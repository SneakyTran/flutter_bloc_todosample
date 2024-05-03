// ignore_for_file: prefer_const_constructors
import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:local_storage_todos_api/src/local_storage_todos_api.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todos_api/todos_api.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  group('LocalStorageTodosApi', () {
    late SharedPreferences plugin;

    final projects = [
      Project(
        id: '1',
        name: 'title 1',
        description: 'description 1',
        startDate: DateTime.now(),
        endDate: DateTime.now(),
        logo: "logo",
        group: "work",
      ),
      Project(
        id: '2',
        name: 'title 2',
        description: 'description 2',
        startDate: DateTime.now(),
        endDate: DateTime.now(),
        logo: "shop",
        group: "work",
      ),
      Project(
        id: '3',
        name: 'title 3',
        description: 'description 3',
        startDate: DateTime.now(),
        endDate: DateTime.now(),
        logo: "shop",
        group: "work",
      ),
    ];

    setUp(() {
      plugin = MockSharedPreferences();
      when(() => plugin.getString(any())).thenReturn(json.encode(projects));
      when(() => plugin.setString(any(), any())).thenAnswer((_) async => true);
    });

    LocalStorageTodosApi createSubject() {
      return LocalStorageTodosApi(
        plugin: plugin,
      );
    }

    group('constructor', () {
      test('works properly', () {
        expect(
          createSubject,
          returnsNormally,
        );
      });

      group('initializes the todos stream', () {
        test('with existing todos if present', () {
          final subject = createSubject();

          expect(subject.getProjects(), emits(projects));
          verify(
            () => plugin.getString(
              LocalStorageTodosApi.kTodosCollectionKey,
            ),
          ).called(1);
        });

        test('with empty list if no todos present', () {
          when(() => plugin.getString(any())).thenReturn(null);

          final subject = createSubject();

          expect(subject.getProjects(), emits(const <Project>[]));
          verify(
            () => plugin.getString(
              LocalStorageTodosApi.kTodosCollectionKey,
            ),
          ).called(1);
        });
      });
    });

    test('getTodos returns stream of current list todos', () {
      expect(
        createSubject().getProjects(),
        emits(projects),
      );
    });

    group('saveTodo', () {
      test('saves new todos', () {
        final newTodo = Project(
          id: '5',
          name: 'title 5',
          description: 'description 5',
          startDate: DateTime.now(),
          endDate: DateTime.now(),
          logo: "shop",
          group: "work",
        );

        final newTodos = [...projects, newTodo];

        final subject = createSubject();

        expect(subject.saveProjects(newTodo), completes);
        expect(subject.getProjects(), emits(newTodos));

        verify(
          () => plugin.setString(
            LocalStorageTodosApi.kTodosCollectionKey,
            json.encode(newTodos),
          ),
        ).called(1);
      });

      test('updates existing todos', () {
        final updatedTodo = Project(
          id: '1',
          name: 'Project 1 Updated',
          description: 'description 1 Updated',
          startDate: DateTime.now(),
          endDate: DateTime.now(),
          logo: "shop",
          group: "work",
        );
        final newTodos = [updatedTodo, ...projects.sublist(1)];

        final subject = createSubject();

        expect(subject.saveProjects(updatedTodo), completes);
        expect(subject.getProjects(), emits(newTodos));

        verify(
          () => plugin.setString(
            LocalStorageTodosApi.kTodosCollectionKey,
            json.encode(newTodos),
          ),
        ).called(1);
      });
    });

    group('deleteTodo', () {
      test('deletes existing todos', () {
        final newTodos = projects.sublist(1);

        final subject = createSubject();

        expect(subject.deleteProjects(projects[0].id ?? "1"), completes);
        expect(subject.getProjects(), emits(newTodos));

        verify(
          () => plugin.setString(
            LocalStorageTodosApi.kTodosCollectionKey,
            json.encode(newTodos),
          ),
        ).called(1);
      });

      test(
        'throws TodoNotFoundException if todo '
        'with provided id is not found',
        () {
          final subject = createSubject();

          expect(
            () => subject.deleteProjects('non-existing-id'),
            throwsA(isA<ProjectsNotFoundException>()),
          );
        },
      );
    });
  });
}
