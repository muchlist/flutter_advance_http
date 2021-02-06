import 'package:flutter/material.dart';
import 'package:flutter_advanced_http/api/http_client.dart';
import 'package:flutter_advanced_http/api/json_models/todo.dart';
import 'package:flutter_advanced_http/api/json_parsers/json_parsers.dart';

class FetchDataPage extends StatefulWidget {
  const FetchDataPage();

  @override
  _FetchDataPageState createState() => _FetchDataPageState();
}

class _FetchDataPageState extends State<FetchDataPage> {
  late final Future<List<Todo>> todos;  //example if implement nullable

  @override
  void initState(){
    super.initState();
    todos = RequestREST(endpoint: "/todos")
    .executeGet<List<Todo>>(const TodoParser());
  }

  // final Future<List<Todo>> todos = RequestREST(endpoint: "/todos")
  //     .executeGet<List<Todo>>(
  //         const TodoParser()); //prefer to use above example (commented code)

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: todos,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // remember that 'snapshot.data' returns a nullable
            final data = snapshot.data ?? [];

            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {}
                );
          }

          if (snapshot.hasError) {
            return const ErrorWidget();
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
