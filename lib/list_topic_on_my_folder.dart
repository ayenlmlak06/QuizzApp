import 'package:flutter/material.dart';
import 'learning_screen.dart';

class ListTopicOnMyFolder extends StatefulWidget {
  final String folderName;
  const ListTopicOnMyFolder({super.key, required this.folderName});

  @override
  State<ListTopicOnMyFolder> createState() => _ListTopicOnMyFolderState();
}

class _ListTopicOnMyFolderState extends State<ListTopicOnMyFolder> {
  List<Map<String, dynamic>> ownTopicList = List<Map<String, dynamic>>.generate(
    10,
    (index) => {
      'topicName': 'Toeic Vocabulary $index',
      'authorName': 'Nam',
      'authorAvatarUrl': 'https://randomuser.me/api/portraits/men/2.jpg',
    },
  );

  void _moveToLearningScreen(String topicName) {
    Navigator.push(context, 
      MaterialPageRoute(builder: (ctx) => LearningScreen(topicName: topicName)));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  itemCount: ownTopicList.length,
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
                          _moveToLearningScreen(ownTopicList[index]['topicName']!);
                        },
                        title: Text(ownTopicList[index]['topicName']!,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                fontStyle: FontStyle.normal)),
                        subtitle: Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(ownTopicList[index]['authorAvatarUrl']!),
                            ),
                            const SizedBox(width: 8),
                            Text(ownTopicList[index]['authorName']!,
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
