import 'package:flutter/material.dart';
import 'learning_screen.dart';
import 'create_new_folder_screen.dart';
import 'create_new_topic_screen.dart';
import 'folder_screen.dart';
import 'my_topic_screen.dart';
import 'my_folder_screen.dart';
import 'list_topic_on_my_folder.dart';

// ignore: camel_case_types
class library_screen extends StatefulWidget {
  const library_screen({Key? key}) : super(key: key);

  @override
  State<library_screen> createState() => _library_screenState();
}

// ignore: camel_case_types
class _library_screenState extends State<library_screen> {
  void _moveToLearningScreen(String topicName) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (ctx) => LearningScreen(topicName: topicName)));
  }

  void _moveToCreateNewTopicScreen() {
    Navigator.push(context,
        MaterialPageRoute(builder: (ctx) => const CreateNewTopicScreen()));
  }

  void _moveToCreateNewFolderScreen() {
    Navigator.push(context,
        MaterialPageRoute(builder: (ctx) => const CreateNewFolderScreen()));
  }

  void _moveToFolderScreen(String folderName) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (ctx) => FolderScreen(folderName: folderName)));
  }

  void _moveToMyTopicScreen() {
    Navigator.push(
        context, MaterialPageRoute(builder: (ctx) => const MyTopicScreen()));
  }

  void _moveToMyFolderScreen() {
    Navigator.push(
        context, MaterialPageRoute(builder: (ctx) => const MyFolderScreen()));
  }

  void _moveToListTopicOnMyFolder(String folderName) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (ctx) => ListTopicOnMyFolder(folderName: folderName)));
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

  List<Map<String, dynamic>> ownTopicList = List<Map<String, dynamic>>.generate(
    10,
    (index) => {
      'topicName': 'Toeic Vocabulary $index',
      'authorName': 'Nam',
      'authorAvatarUrl': 'https://randomuser.me/api/portraits/men/2.jpg',
    },
  );

  List<Map<String, dynamic>> ownFolderList =
      List<Map<String, dynamic>>.generate(
    10,
    (index) => {
      'folderName': 'Toeic Folder $index',
    },
  );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            foregroundColor: Colors.lightBlue,
            bottom: const TabBar(
              tabs: [
                Tab(
                  text: "Topic",
                ),
                Tab(
                  text: "Folder",
                ),
                Tab(
                  text: "Own",
                ),
              ],
              labelColor: Colors.lightBlue,
              unselectedLabelColor: Colors.lightBlue,
              indicatorColor: Colors.lightBlue,
              dividerColor: Colors.lightBlue,
            ),
            title: const Text(
              'Library',
            ),
            actions: [
              PopupMenuButton(
                  itemBuilder: (context) => [
                        PopupMenuItem(
                            child: ListTile(
                          title: const Text('Create new topic',
                              style: TextStyle(color: Colors.lightBlue)),
                          leading: const Icon(
                            Icons.topic,
                            color: Colors.lightBlue,
                          ),
                          onTap: () {
                            _moveToCreateNewTopicScreen();
                          },
                        )),
                        PopupMenuItem(
                          child: ListTile(
                            title: const Text('Create new folder',
                                style: TextStyle(color: Colors.lightBlue)),
                            leading: const Icon(
                              Icons.folder,
                              color: Colors.lightBlue,
                            ),
                            onTap: () {
                              _moveToCreateNewFolderScreen();
                            },
                          ),
                        )
                      ],
                  color: Colors.white,
                  icon: const Icon(Icons.add))
            ],
          ),
          body: TabBarView(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: ListView.separated(
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
                          _moveToLearningScreen(topicList[index]['topicName']!);
                        },
                        title: Text(topicList[index]['topicName']!,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                fontStyle: FontStyle.normal)),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      topicList[index]['authorAvatarUrl']!),
                                ),
                                const SizedBox(width: 8),
                                Text(topicList[index]['authorName']!,
                                    style: const TextStyle(
                                        fontStyle: FontStyle.italic, fontSize: 20)),
                              ],
                            ),
                            IconButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                            title: const Text("Confirm"),
                                            content: const Text(
                                                "Are you sure about delete this topic?"),
                                            actions: [
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Text("Cancel")),
                                              TextButton(
                                                  onPressed: () {
                                                    // Delete this folder
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Text("Delete"))
                                            ],
                                          ));
                                },
                                icon: const Icon(Icons.delete))
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 15),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: ListView.separated(
                  itemCount: folderList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                        border: Border.all(color: Colors.lightBlue),
                      ),
                      child: ListTile(
                        onTap: () {
                          _moveToFolderScreen(folderList[index]['folderName']!);
                        },
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.folder),
                                const SizedBox(width: 8),
                                Text(folderList[index]['folderName']!,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        fontStyle: FontStyle.normal)),
                              ],
                            ),
                            IconButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                            title: const Text("Confirm"),
                                            content: const Text(
                                                "Are you sure about delete this folder"),
                                            actions: [
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Text("Cancel")),
                                              TextButton(
                                                  onPressed: () {
                                                    // Delete this folder
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Text("Delete"))
                                            ],
                                          ));
                                },
                                icon: const Icon(Icons.delete))
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const Divider(color: Colors.white),
                ),
              ),
              Container(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.folder_copy,
                              color: Colors.lightBlue),
                          const SizedBox(width: 8),
                          const Text("My Folder",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.lightBlue)),
                          const Spacer(),
                          TextButton(
                            onPressed: () {
                              _moveToMyFolderScreen();
                            },
                            child: const Text("See more",
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
                            itemCount: 10,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: GestureDetector(
                                  onTap: () {
                                    _moveToListTopicOnMyFolder(ownFolderList[index]['folderName']!);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(15.0)),
                                      border:
                                          Border.all(color: Colors.lightBlue),
                                    ),
                                    width: 200,
                                    child: Center(
                                        child: Column(
                                      children: [
                                        const Icon(Icons.folder,
                                            color: Colors.lightBlue),
                                        Text(
                                            ownFolderList[index]['folderName']!,
                                            style: const TextStyle(
                                              fontSize: 20,
                                              color: Colors.lightBlue,
                                            )),
                                      ],
                                    )),
                                  ),
                                ),
                              );
                            }),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          const Icon(Icons.list, color: Colors.lightBlue),
                          const SizedBox(width: 8),
                          const Text("My Topic",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.lightBlue)),
                          const Spacer(),
                          TextButton(
                            onPressed: () {
                              _moveToMyTopicScreen();
                            },
                            child: const Text("See more",
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
                            itemCount: 10,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: GestureDetector(
                                  onTap: () {
                                    _moveToLearningScreen(
                                        ownTopicList[index]['topicName']!);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(15.0)),
                                      border:
                                          Border.all(color: Colors.lightBlue),
                                    ),
                                    width: 200,
                                    child: Center(
                                        child: Column(
                                      children: [
                                        const Icon(Icons.topic,
                                            color: Colors.lightBlue),
                                        Text(ownTopicList[index]['topicName']!,
                                            style: const TextStyle(
                                              fontSize: 20,
                                              color: Colors.lightBlue,
                                            )),
                                      ],
                                    )),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ],
                  ))
            ],
          )),
    );
  }
}
