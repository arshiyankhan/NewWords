import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_words/models/add_new_word.dart';
import 'package:new_words/widgets/textfield_with_title_cupertino.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<AddNewWord> _words = [];

  TextEditingController addWordController = TextEditingController();
  TextEditingController addMeaningController = TextEditingController();
  TextEditingController addSentenceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => fabButtonHandler(),
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // to implement 
      // bottomNavigationBar: curved_navigation_bar,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _words.length,
                itemBuilder: (context, index) => _card(_words[index])
              ),
            ),
          ],
        )
      ),
    );
  }

  Widget _card(AddNewWord word){
    return Container(
      margin: const EdgeInsets.only(
        left: 19,
        right: 19,
        bottom: 8,
        top: 10,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(54, 0, 0, 0),
            blurRadius: 4,
            offset: Offset(0, 0),
            spreadRadius: 4 // Shadow position
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              word.word,
              style: const TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Meaning - ${word.meaning}",
              style: const TextStyle(
                color: Colors.grey
              ),
            ),
            if(word.sentence?.isNotEmpty??false) Text(
              "Sentence - ${word.sentence}",
              style: const TextStyle(
                color: Colors.grey
              ),
            )
          ],
        ),
      ),
    );
  }

  Future fabButtonHandler(
  ) {
    return showDialog(
      context: context, 
      builder: (context) {
        return Center(
          child: CupertinoAlertDialog(
            title: const Text("Add A New Word"),
            content: Column(
              children: [
                const SizedBox(height: 15),
                textFieldWithTitle(
                  titleText: const Text(
                    "What's the word?",
                    style: TextStyle(
                      fontSize: 14
                    ),
                  ),
                  controller: addWordController,
                ),
                const SizedBox(height: 15),
                textFieldWithTitle(
                  titleText: const Text(
                    "What's the meaning?",
                    style: TextStyle(
                      fontSize: 14
                    ),
                  ),
                  controller: addMeaningController,
                ),
                const SizedBox(height: 15),
                textFieldWithTitle(
                  titleText: const Text(
                    "Any example Sentence?",
                    style: TextStyle(
                      fontSize: 14
                    ),
                  ),
                  controller: addSentenceController,
                ),
              ],
            ),
            actions: [
              _cupertinoDialogAction(
                const Text("Add"),
                () => setState(() {
                  _words.add(
                    AddNewWord(
                      word: addWordController.text, 
                      meaning: addMeaningController.text,
                      sentence: addSentenceController.text
                    ),
                  );
                  Navigator.pop(context);
                })
              ),
              _cupertinoDialogAction(
                const Text(
                  "Cancel",
                  style: TextStyle(
                    color: Colors.red
                  ),
                ),
                () => Navigator.pop(context),
              ),
            ],
          ),
        );
      }
    );
  }

  Widget _cupertinoDialogAction(
    Widget child, 
    void Function() onPressed
  ){
    return CupertinoDialogAction(
      onPressed: onPressed,
      child: child
    );
  }
}