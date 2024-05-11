import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter_tts/flutter_tts.dart';

class LearningScreen extends StatefulWidget {
  final String topicName;
  const LearningScreen({super.key, required this.topicName});

  @override
  State<LearningScreen> createState() => _LearningScreenState();
}

class _LearningScreenState extends State<LearningScreen> {
  int currentIdx = 0;
  final List<String> frontCardList = ["One of the years that I really to remember that", "Two", "Three", "Four", "Five"];
  final List<String> backCardList = ["Số Một", "Số Hai", "Số Ba", "Số Bốn", "Số Năm"];

  FlutterTts flutterTts = FlutterTts();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Learning"),
        centerTitle: true,
        foregroundColor: Colors.lightBlue,
        actions: const [
          Divider(
            color: Colors.lightBlue,
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Divider(
            color: Colors.lightBlue,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                widget.topicName,
                style: const TextStyle(
                  fontSize: 30,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  color: Colors.lightBlue,
                ),
              ),
            ),
          ),
          Padding(padding:const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // ignore: sized_box_for_whitespace
                Container(
                  width: 150,
                  height: 50,
                  child: ElevatedButton(onPressed: (){
                    //move to single choice test screen
                  }, 
                    // ignore: sort_child_properties_last
                    child: const Text("Test"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.lightBlue,
                      side: const BorderSide(color: Colors.lightBlue),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
                    ),
                  ),
                ),
                // ignore: sized_box_for_whitespace
                Container(
                  width: 150,
                  height: 50,
                  child: ElevatedButton(onPressed: (){
                    //move to writing test screen
                  }, 
                    // ignore: sort_child_properties_last
                    child: const Text("Writing Test"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.lightBlue,
                      side: const BorderSide(color: Colors.lightBlue),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
                    ),
                  ),
                )
              ],
            ),),
          const SizedBox(height: 5,),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: FlipCard(
              direction: FlipDirection.VERTICAL,
              front: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.lightBlue),
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Center(
                      child: Text(
                        frontCardList[currentIdx],
                        style: const TextStyle(fontSize: 30),
                      ),
                    ),
                  ),
                  Positioned(
                    child: IconButton(
                      icon: const Icon(Icons.volume_up),
                      color: Colors.lightBlue,
                      onPressed:() async{
                        // Read the text inside the front card
                        String text = frontCardList[currentIdx];
                        flutterTts.setVoice({"name": "en-US-Standard-D", "locale": "en-US"});
                        flutterTts.setLanguage("en-US");
                        await flutterTts.speak(text);
                      },))
                ],
              ),
              back: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Center(
                        child: Text(
                      backCardList[currentIdx],
                      style: const TextStyle(color: Colors.white, fontSize: 30),
                    )),
                  ),
                ],
              ),
            ),
          )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: currentIdx > 0
                          ? () {
                              setState(() {
                                currentIdx--;
                              });
                            }
                          : null,
                      icon: const Icon(Icons.arrow_back)),
                  Text(
                    "${currentIdx + 1}/${frontCardList.length}",
                    style: const TextStyle(color: Colors.lightBlue),
                  ),
                  IconButton(
                      onPressed: currentIdx < frontCardList.length - 1
                          ? () {
                              setState(() {
                                currentIdx++;
                              });
                            }
                          : null,
                      icon: const Icon(Icons.arrow_forward))
                ]),
          ),
          const SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }
}
