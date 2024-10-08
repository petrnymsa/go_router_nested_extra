import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'main.g.dart';

void main() {
  runApp(const MainApp());
}

class Message {
  final String id;
  final String title;
  final String body;

  Message({required this.id, required this.title, required this.body});
}

class MessagesList {
  final List<Message> messages;

  MessagesList({required this.messages});
}

@TypedGoRoute<MainRoute>(path: '/', name: 'main')
class MainRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const _Main();
  }
}

@TypedGoRoute<MessageRoute>(path: '/messages', name: 'messages', routes: [
  TypedGoRoute<DetailMessageRoute>(path: 'detail', name: 'detail'),
])
class MessageRoute extends GoRouteData {
  final MessagesList $extra;

  MessageRoute({required this.$extra});

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return MessagesPage(messagesList: $extra);
  }
}

class DetailMessageRoute extends GoRouteData {
  final Message $extra;

  DetailMessageRoute({required this.$extra});

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return MessageDetailPage(message: $extra);
  }
}

final router = GoRouter(routes: $appRoutes, initialLocation: '/');

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}

class _Main extends StatelessWidget {
  const _Main({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Hello'),
            ElevatedButton(
              onPressed: () {
                context.go('/messages',
                    extra: MessagesList(messages: [
                      Message(id: '1', title: 'Message 1', body: 'body ...'),
                    ]));
              },
              child: const Text('messages'),
            ),
          ],
        ),
      ),
    );
  }
}

class MessagesPage extends StatelessWidget {
  final MessagesList messagesList;

  const MessagesPage({super.key, required this.messagesList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Messages'),
      ),
      body: ListView.builder(
        itemCount: messagesList.messages.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(messagesList.messages[index].title),
            subtitle: Text(messagesList.messages[index].body),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              context.push('/messages/detail', extra: messagesList.messages[index]);
            },
          );
        },
      ),
    );
  }
}

class MessageDetailPage extends StatelessWidget {
  final Message message;

  const MessageDetailPage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(message.title),
      ),
      body: Text(message.body),
    );
  }
}
