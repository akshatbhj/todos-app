import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServices {
  // Get collection of notes
  final CollectionReference notes =
      FirebaseFirestore.instance.collection('notes');

  //CREATE: Create a new note
  Future<void> addNote(String note) {
    return notes.add({
      'note': note,
      'timestamp': Timestamp.now(),
    });
  }

  //READ: Read a note from database.
  Stream<QuerySnapshot> getNotesStream() {
    final notesStream =
        notes.orderBy('timestamp', descending: true).snapshots();
    return notesStream;
  }

  //UPDATE: Update a existing note from database.
  Future<void> updateNote(String docID, String newNote) {
    return notes
        .doc(docID)
        .update({'note': newNote, 'timestamp': Timestamp.now()});
  }

  //DELETE: Delete a note from database.
  Future<void> deleteNote(String docID) {
    return notes.doc(docID).delete();
  }
}
