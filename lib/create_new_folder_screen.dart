import 'package:flutter/material.dart';

class CreateNewFolderScreen extends StatefulWidget {
  const CreateNewFolderScreen({Key? key}) : super(key: key);

  @override
  State<CreateNewFolderScreen> createState() => _CreateNewFolderScreenState();
}

class _CreateNewFolderScreenState extends State<CreateNewFolderScreen> {
  List<String> selectedTopics = [];
  final TextEditingController _folderNameController = TextEditingController();

  List<Map<String, dynamic>> topicList = List<Map<String, dynamic>>.generate(
    10,
    (index) => {
      'topicName': 'Ielts Vocabulary $index',
      'authorName': 'Nam',
      'authorAvatarUrl': 'https://randomuser.me/api/portraits/men/1.jpg',
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Your Folder'),
        foregroundColor: Colors.lightBlue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            TextField(
              controller: _folderNameController,
              cursorColor: Colors.lightBlue,
              decoration: const InputDecoration(
                labelText: 'Topic Name',
                labelStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.lightBlue),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.lightBlue)),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.lightBlue)),
                ),
                style: const TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold)
              ),
            const SizedBox(height: 15),
            Expanded(
              child: ListView.separated(
                itemCount: topicList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                      border: Border.all(color: Colors.lightBlue),
                    ),
                    child: ListTile(
                      onTap: () {
                        // select the topic
                      },
                      title: Text(topicList[index]['topicName']!,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              fontStyle: FontStyle.normal)),
                      subtitle: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage:
                                NetworkImage(topicList[index]['authorAvatarUrl']!),
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
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(height: 15);
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        backgroundColor: Colors.lightBlue,
        onPressed: () {
          // save the selected topics
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}
