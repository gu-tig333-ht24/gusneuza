import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;

import '../core/interfaces/todo_repository.dart';
import '../core/models/todo.dart';

class ApiTodoRepository implements TodoRepository {
  static const String _baseUrl = "https://todoapp-api.apps.k8s.gu.se";
  static const String _apiKey = "2a978424-1307-476e-b81e-3382f570813e";

  List<Todo> _parseTodosJson(String responseBody) {
    try {
      final List todosJson = json.decode(responseBody);
      return todosJson
          .map<Todo?>((json) {
            try {
              return Todo.fromJson(json);
            } catch (e) {
              if (kDebugMode) {
                print("⚠️ -> Error parsing Todo: ${e.toString()}");
              }
              return null;
            }
          })
          .whereType<Todo>() // Filter out any nulls
          .toList();
    } catch (e) {
      if (kDebugMode) {
        print("⚠️ -> Error decoding response: ${e.toString()}");
      }

      return [];
    }
  }

  @override
  Future<List<Todo>> fetchTodos() async {
    final Uri url = Uri.parse("$_baseUrl/todos?key=$_apiKey");
    final response = await http.get(url);

    if (response.statusCode == HttpStatus.ok) {
      return _parseTodosJson(response.body);
    }

    return [];
  }

  @override
  Future<List<Todo>> createTodo(String title) async {
    final Uri url = Uri.parse("$_baseUrl/todos?key=$_apiKey");
    final response = await http.post(
      url,
      headers: <String, String>{
        "Content-Type": "application/json; charset=UTF-8",
      },
      body: jsonEncode(<String, dynamic>{
        "title": title,
        "done": false,
      }),
    );

    if (response.statusCode == HttpStatus.ok) {
      return _parseTodosJson(response.body);
    }

    return [];
  }

  @override
  Future<bool> updateTodo(Todo todo) async {
    final Uri url = Uri.parse("$_baseUrl/todos/${todo.id}?key=$_apiKey");
    final response = await http.put(
      url,
      headers: <String, String>{
        "Content-Type": "application/json; charset=UTF-8",
      },
      body: jsonEncode(<String, dynamic>{
        "title": todo.title,
        "done": !todo.done,
      }),
    );

    return response.statusCode == HttpStatus.ok ? true : false;
  }

  @override
  Future<bool> removeTodo(Todo todo) async {
    final Uri url = Uri.parse("$_baseUrl/todos/${todo.id}?key=$_apiKey");
    final response = await http.delete(
      url,
      headers: <String, String>{
        "Content-Type": "application/json; charset=UTF-8",
      },
    );

    return response.statusCode == HttpStatus.ok ? true : false;
  }
}
