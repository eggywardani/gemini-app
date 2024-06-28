import 'package:gemini_app/model/message.dart';

class HomeState {
  List<Message> messages;
  bool loading;

  HomeState({
    List<Message>? messages,
    bool? loading,
  })  : messages = messages ?? [],
        loading = loading ?? false;

  HomeState copyWith({
    List<Message>? messages,
    bool? loading,
  }) =>
      HomeState(
        loading: loading ?? this.loading,
        messages: messages ?? this.messages,
      );
}
