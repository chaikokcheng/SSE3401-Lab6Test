import "package:flutter/material.dart";

class AddContactPage extends StatefulWidget {
  final int factoryIndex;

  const AddContactPage({super.key, this.factoryIndex = 0});

  @override
  State<AddContactPage> createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> {
  @override
  Widget build(BuildContext context) {
    List<String> titles = ['Factory1', 'Factory2', 'Factory3'];
    String factoryTitle = titles[widget.factoryIndex];
    return Scaffold(
      backgroundColor: Colors.grey[350],
      appBar: AppBar(
        title: Text(
          factoryTitle,
          style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Title(
                title: "Invitation",
                color: Colors.black,
                child: const Text("Invitation",
                    style:
                        TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
              ),
            ),
            const Center(
              child: Text("Invite User", style: TextStyle(fontSize: 20)),
            ),
            const SizedBox(height: 20),
            const Text("Owner's Name", style: TextStyle(fontSize: 20)),
            const SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Type here',
                border: OutlineInputBorder(),
                fillColor: Colors.white,
                filled: true,
              ),
            ),
            const SizedBox(height: 20),
            const Text("Owner's Phone Number", style: TextStyle(fontSize: 20)),
            const SizedBox(height: 10),
            Container(
                constraints: const BoxConstraints(maxHeight: 70),
                child: Row(
                  children: [
                    Image.asset(
                      "images/MYflag.png",
                      height: 30,
                      width: 30,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text("+60"),
                    const SizedBox(
                      width: 30,
                    ),
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Enter your phone number',
                          border: OutlineInputBorder(),
                          fillColor: Colors.white,
                          filled: true,
                        ),
                      ),
                    ),
                  ],
                )),
            const SizedBox(height: 20),
            Row(children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Success'),
                          content: const Text('You had done invited'),
                          actions: [
                            TextButton(
                              child: const Text('Done',
                                  selectionColor: Colors.blue),
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: const Text('Submit'),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
