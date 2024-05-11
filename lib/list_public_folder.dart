import 'package:flutter/material.dart';
import 'folder_screen.dart';

class ListPublicFolder extends StatefulWidget {
  const ListPublicFolder({super.key});

  @override
  State<ListPublicFolder> createState() => _ListPublicFolderState();
}

class _ListPublicFolderState extends State<ListPublicFolder> {
  List<Map<String, dynamic>> folderList = List<Map<String, dynamic>>.generate(
    10,
    (index) => {
      'folderName': 'Ielts Folder $index',
    },
  );

  void _moveToFolderScreen(String folderName) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (ctx) => FolderScreen(folderName: folderName)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Public Folder'),
        foregroundColor: Colors.lightBlue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView.separated(
          itemCount: folderList.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(15)),
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
