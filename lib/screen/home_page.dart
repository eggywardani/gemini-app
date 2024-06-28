import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gemini_app/screen/home_notifier.dart';
import 'package:gemini_app/screen/home_state.dart';
import 'package:gemini_app/theme/theme_notifier.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch<HomeState>(homeProvider);
    final provider = ref.read(homeProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(CupertinoIcons.rocket),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'Gemini GPT',
                  style: Theme.of(context).textTheme.titleLarge,
                )
              ],
            ),
            Row(
              children: [
                Icon(CupertinoIcons.volume_down, color: Colors.blue[800]),
                IconButton(
                    onPressed: () =>
                        ref.read(themeProvider.notifier).changeTheme(),
                    icon: Icon(
                        ref.watch<ThemeMode>(themeProvider) == ThemeMode.dark
                            ? Icons.light_mode
                            : Icons.dark_mode,
                        color: ref.watch<ThemeMode>(themeProvider) ==
                                ThemeMode.light
                            ? Colors.blue[800]
                            : Colors.yellow[800])),
              ],
            )
          ],
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: state.messages.isEmpty
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/logo.png'),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Start Conversation',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: Colors.grey[800]),
                        )
                      ],
                    )
                  : ListView.builder(
                      itemCount: state.messages.length,
                      reverse: true,
                      itemBuilder: (BuildContext context, int index) {
                        final message =
                            state.messages[state.messages.length - 1 - index];
                        return ListTile(
                          title: Align(
                            alignment: message.isUser ?? false
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: message.isUser ?? false
                                        ? Theme.of(context).colorScheme.primary
                                        : Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                    borderRadius: message.isUser ?? false
                                        ? const BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            bottomLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(20))
                                        : const BorderRadius.only(
                                            topRight: Radius.circular(20),
                                            bottomLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(20))),
                                child: Text(
                                  message.text ?? '',
                                  style: message.isUser ?? false
                                      ? Theme.of(context).textTheme.bodyMedium
                                      : Theme.of(context).textTheme.bodySmall,
                                )),
                          ),
                        );
                      },
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      )
                    ]),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: provider.controller,
                        style: Theme.of(context).textTheme.titleSmall,
                        onSubmitted:
                            state.loading ? null : (_) => provider.chatGPT(),
                        decoration: InputDecoration(
                            hintText: 'Type a message',
                            hintStyle: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(color: Colors.grey),
                            border: InputBorder.none,
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 20)),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: state.loading
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator())
                          : IconButton(
                              onPressed: () => provider.chatGPT(),
                              icon: Icon(
                                CupertinoIcons.paperplane,
                                color: Colors.blue[800],
                              )),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
