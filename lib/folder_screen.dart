import 'package:flutter/material.dart';
import 'learning_screen.dart';

class FolderScreen extends StatefulWidget {
  final String folderName;
  const FolderScreen({super.key, required this.folderName});

  @override
  State<FolderScreen> createState() => _FolderScreenState();
}

class _FolderScreenState extends State<FolderScreen> {
  List<Map<String, dynamic>> topicList = List<Map<String, dynamic>>.generate(10,
    (index) => {
      'topicName': 'Ielts Vocabulary $index',
      'authorName': 'Phat',
      'authorAvatarUrl': 'https://randomuser.me/api/portraits/men/1.jpg',
    },
  );

  void _moveToLearningScreen(String topicName) {
    Navigator.push(context, 
      MaterialPageRoute(builder: (ctx) => LearningScreen(topicName: topicName)));
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("List Topic In Folder"),
        foregroundColor: Colors.lightBlue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
          Text(widget.folderName, 
            style: const TextStyle(
              fontSize: 20, 
              fontWeight: FontWeight.bold),),
          Expanded(child: ListView.separated(
                  itemCount: topicList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15.0)),
                        border: Border.all(color: Colors.lightBlue),
                      ),
                      child: ListTile(
                        onTap: () {
                          // change to learning screen
                          _moveToLearningScreen(topicList[index]['topicName']!);
                        },
                        title: Text(topicList[index]['topicName']!,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                fontStyle: FontStyle.normal)),
                        subtitle: Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(topicList[index]['authorAvatarUrl']!),
                            ),
                            const SizedBox(width: 8),
                            Text(topicList[index]['authorName']!,
                                style: const TextStyle(
                                    fontStyle: FontStyle.italic, fontSize: 20)),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 15),
                ),)
        ],)),
    );
  }
}