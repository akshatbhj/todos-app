// import 'dart:js_util';

import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:crud/main.dart';
import 'package:crud/services/firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirestoreServices firestoreServices = FirestoreServices();
  final TextEditingController textController = TextEditingController();

  void openNoteBox({String? docID}) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: TextField(
                controller: textController,
              ),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      if (docID == null) {
                        firestoreServices.addNote(textController.text);
                      } else {
                        firestoreServices.updateNote(
                            docID, textController.text);
                      }

                      // Clearing the dialog box
                      textController.clear();

                      Navigator.pop(context);
                    },
                    child: const Text("Add"))
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: openNoteBox,
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: firestoreServices.getNotesStream(),
        builder: (context, snapshot) {
          // if we have data, get all docs
          if (snapshot.hasData) {
            List notesList = snapshot.data!.docs;
            // Display as a List
            return ListView.builder(
                itemCount: notesList.length,
                itemBuilder: (context, index) {
                  // get each individual doc
                  DocumentSnapshot document = notesList[index];
                  String docID = document.id;

                  // get note from each note
                  Map<String, dynamic> data =
                      document.data() as Map<String, dynamic>;
                  String noteText = data['note'];

                  // display as a list tile
                  return ListTile(
                      title: Text(noteText),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // update button
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () => openNoteBox(docID: docID),
                          ),

                          // delete button
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () =>
                                firestoreServices.deleteNote(docID),
                          ),
                        ],
                      ));
                });
          } else {
            return const Text('No notes...');
          }
        },
      ),
    );
  }
}
