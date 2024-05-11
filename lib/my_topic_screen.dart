import 'package:flutter/material.dart';
import 'learning_screen.dart';

class MyTopicScreen extends StatefulWidget {
  const MyTopicScreen({super.key});

  @override
  State<MyTopicScreen> createState() => _MyTopicScreenState();
}

class _MyTopicScreenState extends State<MyTopicScreen> {

  void _moveToLearningScreen(String topicName) {
    Navigator.push(context, 
      MaterialPageRoute(builder: (ctx) => LearningScreen(topicName: topicName)));
  }

  List<Map<String, dynamic>> ownTopicList = List<Map<String, dynamic>>.generate(10,
    (index) => {
      'topicName': 'Toeic Vocabulary $index',
      'authorName': 'Nam',
      'authorAvatarUrl': 'https://randomuser.me/api/portraits/men/2.jpg',
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Topic'),
        foregroundColor: Colors.lightBlue,
      ),
      body: Padding(
                padding: const EdgeInsets.all(15),
                child: ListView.separated(
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
                ),
              ),
    );
  }
}