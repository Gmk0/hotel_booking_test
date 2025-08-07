import 'package:flutter/material.dart';

class ChatDetailScreen extends StatefulWidget {
  @override
  _ChatDetailScreenState createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  final TextEditingController _messageController = TextEditingController();

  /**
   * Donnée teste simulation.
   */
  final List<Map<String, dynamic>> messages = [
    {
      "sender": "Ruben",
      "time": "14:08",
      "text": "bonjour\nvous êtes dans quelle commune précisément ?\nquartier ?",
      "isMe": false,
    },
    {
      "sender": "Ruben",
      "time": "15:27",
      "text": "Un téléphone ?",
      "isMe": false,
    },
    {
      "sender": "Moi",
      "time": "19:12",
      "text":
      "Nous sommes dans la commune de Kasa-Vubu croisement des avenue Oshwe et Ethiopie",
      "isMe": true,
      "day": "dimanche",
    },
  ];

  void _sendMessage() {
    final text = _messageController.text.trim();
    if (text.isEmpty) return;

    setState(() {
      messages.add({
        "sender": "Moi",
        "time": TimeOfDay.now().format(context),
        "text": text,
        "isMe": true,
      });
      _messageController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 0,
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.black,
              child: Text("R", style: TextStyle(color: Colors.white)),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Ruben", style: TextStyle(color: Colors.black)),
                  Text("01–06 aout. · chambre moderne avec ascen…",
                      style: TextStyle(color: Colors.grey, fontSize: 12)),
                ],
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text("Détails", style: TextStyle(color: Colors.black)),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("01 aout.",
                    style: TextStyle(color: Colors.grey, fontSize: 12)),
                SizedBox(height: 4),
                Text("Demande d'information envoyée · 2 voyageurs, 01–05 aout.",
                    style: TextStyle(fontSize: 13)),
              ],
            ),
          ),
          Divider(height: 1),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final msg = messages[index];
                return Column(
                  crossAxisAlignment: msg['isMe']
                      ? CrossAxisAlignment.end
                      : CrossAxisAlignment.start,
                  children: [
                    if (msg.containsKey('day'))
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          child: Text(
                            msg['day'],
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    if (!msg['isMe'])
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.black,
                              radius: 12,
                              child: Text("R",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12)),
                            ),
                            SizedBox(width: 8),
                            Text("Ruben · Responsable de la réservation",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey)),
                          ],
                        ),
                      ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 6),
                      padding:
                      EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                      constraints: BoxConstraints(maxWidth: 280),
                      decoration: BoxDecoration(
                        color: msg['isMe']
                            ? Colors.black87
                            : Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        msg['text'],
                        style: TextStyle(
                          color: msg['isMe'] ? Colors.white : Colors.black87,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(msg['time'],
                          style: TextStyle(color: Colors.grey, fontSize: 10)),
                    ),
                  ],
                );
              },
            ),
          ),
          Divider(height: 1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Row(
              children: [
                Icon(Icons.add_circle_outline, size: 28),
                SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: "Écrire un message...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    ),
                    onSubmitted: (_) => _sendMessage(),
                  ),
                ),
                SizedBox(width: 8),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black, // WhatsApp-style color
                  ),
                  child: IconButton(
                    icon: Icon(Icons.send, color: Colors.white),
                    onPressed: _sendMessage,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
