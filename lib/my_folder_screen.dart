import 'package:flutter/material.dart';
import 'list_topic_on_my_folder.dart';
// chứa danh sách các topic trong folder
class MyFolderScreen extends StatefulWidget {
  const MyFolderScreen({super.key});

  @override
  State<MyFolderScreen> createState() => _MyFolderScreenState();
}

class _MyFolderScreenState extends State<MyFolderScreen> {
  List<Map<String, dynamic>> ownFolderList =
      List<Map<String, dynamic>>.generate(
    10,
    (index) => {
      'folderName': 'Toeic Folder $index',
    },
  );

  void _moveToListTopicOnMyFolder(String folderName) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (ctx) => ListTopicOnMyFolder(folderName: folderName)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Folder'),
        foregroundColor: Colors.lightBlue,
      ),
      body: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ListView.separated(
                  itemCount: ownFolderList.length,
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
                          _moveToListTopicOnMyFolder(ownFolderList[index]['folderName']!);
                        },
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.folder),
                                const SizedBox(width: 8),
                                Text(ownFolderList[index]['folderName']!,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
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
    );
  }
}
