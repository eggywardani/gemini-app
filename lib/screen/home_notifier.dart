import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gemini_app/model/message.dart';
import 'package:gemini_app/screen/home_state.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class HomeNotifier extends StateNotifier<HomeState> {
  HomeNotifier() : super(HomeState());

  final TextEditingController controller = TextEditingController();

  chatGPT() async {
    try {
      state = state.copyWith(loading: true);
      final prompt = controller.text.trim();

      if (controller.text.isNotEmpty) {
        addMessage(Message(text: controller.text, isUser: true));
        controller.clear();
      }
      final model = GenerativeModel(
          model: 'gemini-pro', apiKey: dotenv.env['GOOGLE_API_KEY'] ?? '');

      final content = [Content.text(prompt)];
      final response = await model.generateContent(content);

      addMessage(Message(text: response.text ?? '', isUser: false));
    } catch (e) {
      debugPrint('statement :$e');
    } finally {
      state = state.copyWith(loading: false);
    }
  }

  addMessage(Message value) {
    List<Message> result = state.messages;
    result.add(value);
    state = state.copyWith(messages: result);
  }
}

final homeProvider = StateNotifierProvider<HomeNotifier, HomeState>((ref) {
  return HomeNotifier();
});
