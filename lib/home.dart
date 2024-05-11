import 'package:flutter/material.dart';
import 'folder_screen.dart';
import 'list_public_folder.dart';
import 'learning_screen.dart';

// ignore: camel_case_types
class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

// ignore: camel_case_types
class _homeState extends State<home> {
  void _moveToFolderScreen(String folderName) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) => FolderScreen(folderName: folderName),
        ));
  }

  void _moveToListPublicFolder() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) => const ListPublicFolder(),
        ));
  }

  void _moveToLearningScreen(String topicName) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) => LearningScreen(topicName: topicName),
        ));
  }

  List<Map<String, dynamic>> topicList = List<Map<String, dynamic>>.generate(
    10,
    (index) => {
      'topicName': 'Ielts Vocabulary $index',
      'authorName': 'Phat',
      'authorAvatarUrl': 'https://randomuser.me/api/portraits/men/1.jpg',
    },
  );

  List<Map<String, dynamic>> folderList = List<Map<String, dynamic>>.generate(
    10,
    (index) => {
      'folderName': 'Ielts Folder $index',
    },
  );

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Quizlet App'),
            foregroundColor: Colors.lightBlue,
          ),
          body: Container(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        const SizedBox(width: 8),
                        const Text("Public Folder",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.lightBlue)),
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                            _moveToListPublicFolder();
                          },
                          child: const Text("Explore More",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.lightBlue)),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        itemCount: folderList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            _moveToFolderScreen(
                                folderList[index]['folderName']!);
                          },
                          child: Container(
                            margin: EdgeInsets.all(5),
                            width: 200,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                              border: Border.all(color: Colors.lightBlue),
                            ),
                            child: Center(
                                child: Column(
                              children: [
                                const Icon(Icons.folder,
                                    color: Colors.lightBlue),
                                Text(folderList[index]['folderName']!,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.lightBlue,
                                    )),
                              ],
                            )),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text("Public Topic",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.lightBlue)),
                    Flexible(
                      child: ListView.builder(
                        itemCount: topicList.length,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15.0)),
                              border: Border.all(color: Colors.lightBlue),
                            ),
                            child: ListTile(
                              onTap: () {
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
                                    backgroundImage: NetworkImage(
                                        topicList[index]['authorAvatarUrl']!),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(topicList[index]['authorName']!,
                                      style: const TextStyle(
                                          fontStyle: FontStyle.italic,
                                          fontSize: 20)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
