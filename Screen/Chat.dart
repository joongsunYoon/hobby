import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  late ScrollController scrollcontroller;
  late TextEditingController chatController;
  List<String> chat = [];

  @override
  void initState() {
    scrollcontroller = ScrollController();
    chatController = TextEditingController(text: '');
  }

  @override
  void dispose() {
    scrollcontroller.dispose();
    super.dispose();
  }

  void sendMessage() {
    chat.add(chatController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade100,
        title: const Text('Chat'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: ListView.builder(
                controller: scrollcontroller,
                itemCount: chat.length,
                itemBuilder: (context, index) {
                  return Bubble(
                    alignment: Alignment.topRight,
                    margin: const BubbleEdges.symmetric(vertical: 5),
                    nip: BubbleNip.rightTop,
                    color: Colors.white,
                    child: Text(
                      chat[index],
                      textAlign: TextAlign.end,
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            color: Colors.pink.shade100,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: TextField(
                    controller: chatController,
                    onTap: () {
                      scrollcontroller
                          .jumpTo(scrollcontroller.position.maxScrollExtent);
                    },
                    decoration: const InputDecoration(
                      hintText: 'chat...',
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (chatController.text.isNotEmpty) {
                        chat.add(chatController.text);
                      }
                      chatController.clear();
                      scrollcontroller.jumpTo(
                          scrollcontroller.position.maxScrollExtent + 40);
                    });
                  },
                  icon: const Icon(
                    Icons.send,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
