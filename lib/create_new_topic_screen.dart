import 'package:flutter/material.dart';

class CreateNewTopicScreen extends StatefulWidget {
  const CreateNewTopicScreen({Key? key}) : super(key: key);

  @override
  State<CreateNewTopicScreen> createState() => _CreateNewTopicScreenState();
}

class _CreateNewTopicScreenState extends State<CreateNewTopicScreen> {
  final TextEditingController _topicNameController = TextEditingController();
  final TextEditingController _vocabularyEngController =
      TextEditingController();
  final TextEditingController _vocabularyVNController = TextEditingController();

  String topicName = '';
  List<String> vocabularyEng = [];
  List<String> vocabularyVN = [];

  List<Widget> addContainers = [];
  Widget _addContainer() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.lightBlue),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            TextField(
              controller: _vocabularyEngController,
              cursorColor: Colors.lightBlue,
              decoration: const InputDecoration(
                labelText: 'Vocabulary',
                labelStyle: TextStyle(color: Colors.lightBlue),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.lightBlue),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.lightBlue),
                ),
              ),
            ),
            TextField(
              controller: _vocabularyVNController,
              cursorColor: Colors.lightBlue,
              decoration: const InputDecoration(
                labelText: 'Meaning',
                labelStyle: TextStyle(color: Colors.lightBlue),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.lightBlue),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.lightBlue),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Your Topic'),
        foregroundColor: Colors.lightBlue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              TextField(
                  controller: _topicNameController,
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
                      fontSize: 20, fontWeight: FontWeight.bold)),
              ListTile(
                title: const Text(
                  'Add Vocabulary from csv file',
                  style: TextStyle(color: Colors.lightBlue),
                ),
                trailing: const Icon(
                  Icons.upload_file,
                  color: Colors.lightBlue,
                ),
                onTap: () {
                  //open file picker to up load csv file
                },
              ),
              _addContainer(),
              ...addContainers,
              const SizedBox(height: 15),
              IconButton(
                  onPressed: () {
                    setState(() {
                      addContainers.add(_addContainer());
                    });
                  },
                  icon: const Icon(Icons.add_circle_rounded,
                      color: Colors.lightBlue)),
              ElevatedButton(
                onPressed: () {
                  //save to database
                  if (_topicNameController.text.isEmpty) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Error'),
                        content: const Text('Please enter a topic name.'),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ),
                    );
                  } else {
                    // save to database
                    _topicNameController.clear();
                    _vocabularyEngController.clear();
                    _vocabularyVNController.clear();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('New topic create success'),
                      ),
                    );
                  }
                },
                child: const Text('Create Topic',
                    style: TextStyle(color: Colors.lightBlue)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
