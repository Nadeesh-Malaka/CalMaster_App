import 'package:flutter/material.dart';
import 'custom_drawer.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  final TextEditingController _noteController = TextEditingController();
  final List<String> _savedNotes = []; // List to store saved notes

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF07139E),
              Color(0xFF040C63),
              Color(0xFF020738),
            ],
            stops: [0.24, 0.64, 0.86],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Builder(
            builder: (context) => Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Menu Icon
                  IconButton(
                    icon: const Icon(Icons.menu, color: Colors.white),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  ),
                  const SizedBox(height: 30),

                  // Title
                  const Text(
                    "Notes",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Notes Input Field
                  TextField(
                    controller: _noteController,
                    maxLines: null,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Write your notes here...",
                      hintStyle: const TextStyle(color: Colors.white54),
                      filled: true,
                      fillColor: Colors.white12,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Save Button
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        final note = _noteController.text;
                        if (note.isNotEmpty) {
                          setState(() {
                            _savedNotes.add(note); // Add the note to the list
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text("Note Saved"),
                              backgroundColor: Colors.green,
                            ),
                          );
                          _noteController.clear(); // Clear the input field
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      child: const Text("Save Note"),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Display Saved Notes
                  Expanded(
                    child: _savedNotes.isEmpty
                        ? const Center(
                            child: Text(
                              "No notes saved yet.",
                              style: TextStyle(color: Colors.white70),
                            ),
                          )
                        : ListView.builder(
                            itemCount: _savedNotes.length,
                            itemBuilder: (context, index) {
                              return Card(
                                color: Colors.white12,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: ListTile(
                                  title: Text(
                                    _savedNotes[index],
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  trailing: IconButton(
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _savedNotes
                                            .removeAt(index); // Delete note
                                      });
                                    },
                                  ),
                                ),
                              );
                            },
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
}
