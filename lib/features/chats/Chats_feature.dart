import 'package:flutter/material.dart';
import 'package:hotel_booking/features/chats/chat_details.dart';


class ChatListScreen extends StatelessWidget
{
  final List<Map<String, String>> messages = [
    {
      "name": "Ruben",
      "message": "Nous sommes dans la c...",
      "date": "06/08/2025",
    },
    {
      "name": "Kabamba",
      "message": "C'est disponible",
      "date": "06/08/2025",
    },
    {
      "name": "Merveille",
      "message": "Oui",
      "date": "06/08/2025",
    },
    {
      "name": "Fidele",
      "message": "Oui",
      "date": "06/08/2025",
    },
    {
      "name": "Paulin",
      "message": "Oui",
      "date": "06/08/2025",
    },
    {
      "name": "Assistance Airbnb",
      "message": "Bonjour Airbnb Host...",
      "date": "06/08/2025",
    },
    {
      "name": "Assistance Airbnb",
      "message": "Bonjour gloire...",
      "date": "06/08/2025",
    },
  ];

  final List<String> filters = [
    "Tout",
    "Logements",
    "Services",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Messages", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black87),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.settings, color: Colors.black87),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 40,
            margin: EdgeInsets.only(left: 12, top: 5),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: filters.length,
              separatorBuilder: (_, __) => SizedBox(width: 8),
              itemBuilder: (context, index) {
                bool isSelected = index == 0;
                return FilterChip(
                  label: Text(filters[index]),
                  selected: isSelected,
                  onSelected: (_) {},
                  selectedColor: Colors.black,
                  labelStyle: TextStyle(
                      color: isSelected ? Colors.white : Colors.black87),
                  backgroundColor: Colors.grey.shade200,
                );
              },
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: messages.length,
              separatorBuilder: (_, __) => Divider(height: 1),
              itemBuilder: (context, index) {
                final msg = messages[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.black87,
                    child: Text(msg["name"]!.toString()[0],
                        style: TextStyle(color: Colors.white)),
                  ),
                  title: Text(msg["name"]!,
                      style: TextStyle(fontWeight: FontWeight.w600)),
                  subtitle: Text(msg["message"]!,
                      maxLines: 1, overflow: TextOverflow.ellipsis),
                  trailing: Text(msg["date"]!,
                      style: TextStyle(color: Colors.grey, fontSize: 12)),
                  onTap: (){
                    /**
                     * Naviguer vers  le screen de chat en detail.
                     */
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ChatDetailScreen()));
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
