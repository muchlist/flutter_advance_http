library json_parser;

export "object_decoder.dart";
export "post_parser.dart";
export "todo_parser.dart";

abstract class JsonParser<T> {
  const JsonParser();

  Future<T> parseFromJson(String json);
}
