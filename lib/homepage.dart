import 'package:flutter/material.dart';
import 'package:mad_lab5/addcontact.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  int factory = 0;
  final List<String> _titles = ['Factory1', 'Factory2', 'Factory3'];

  @override
  Widget build(BuildContext context) {
    int calculateCrossAxisCount(BuildContext context) {
      double screenWidth = MediaQuery.of(context).size.width;
      return screenWidth > 1000 ? 4 : 2;
    }

    int crossAxisCount = calculateCrossAxisCount(context);

    return Theme(
        data: ThemeData(useMaterial3: false),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: Text(_titles[factory],
                style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Colors.black,
                )),
            iconTheme: IconThemeData(
              color: Colors.grey[700],
            ),
            centerTitle: true,
            automaticallyImplyLeading: false,
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {
                  setState(() {
                    factory = (factory + 1) % 3;
                  });
                },
              ),
            ],
          ),
          backgroundColor: Colors.grey[350],
          body: currentIndex == 0
              ? SingleChildScrollView(
                  child: Column(
                  children: [
                    Card(
                      color: Colors.grey[50],
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      margin: const EdgeInsets.all(10),
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: factory == 0
                                ? Column(
                                    children: [
                                      const ContactCard(
                                          name: 'Ben',
                                          phoneNumber: '+60109219938'),
                                      const SizedBox(height: 10),
                                      const ContactCard(
                                          name: 'Testing 1',
                                          phoneNumber: '+601234567891'),
                                      const SizedBox(height: 10),
                                      const ContactCard(
                                          name: 'Hello',
                                          phoneNumber: '+60123456789'),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.3,
                                      ),
                                    ],
                                  )
                                : SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.6,
                                    width: MediaQuery.of(context).size.width),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 16, bottom: 16),
                            child: FloatingActionButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              foregroundColor: Colors.black,
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        AddContactPage(factoryIndex: factory),
                                  ),
                                );
                              },
                              backgroundColor:
                                  const Color.fromARGB(255, 231, 209, 255),
                              child: const Icon(Icons.add),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          factoryButton(0, 'Factory 1', Icons.factory),
                          const SizedBox(
                            width: 20,
                          ),
                          factoryButton(1, 'Factory 2', Icons.factory),
                          const SizedBox(
                            width: 20,
                          ),
                          factoryButton(2, 'Factory 3', Icons.factory),
                        ],
                      ),
                    )
                  ],
                ))
              : currentIndex == 1
                  ? SingleChildScrollView(
                      child: Column(
                        children: [
                          Card(
                            color: Colors.grey[200],
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            margin: const EdgeInsets.all(25),
                            child: Column(
                              children: [
                                const SizedBox(height: 10),
                                factory == 1
                                    ? const Text("1549.7kW",
                                        style: TextStyle(
                                            fontSize: 29,
                                            fontWeight: FontWeight.w800))
                                    : const Row(
                                        children: [
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Icon(
                                            Icons.warning,
                                            color: Colors.orangeAccent,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text("ABD1234 IS UNREACHABLE !",
                                              style: TextStyle(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.w800))
                                        ],
                                      ),
                                factory == 1
                                    ? SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.45,
                                        child: GridView.count(
                                          crossAxisCount: crossAxisCount,
                                          childAspectRatio: 1,
                                          children: <Widget>[
                                            _buildCard(
                                                "Steam Pressure",
                                                "images/F2.1.png",
                                                "34.19",
                                                "bar"),
                                            _buildCard(
                                                "Steam Flow",
                                                "images/F2.2.png",
                                                "22.82",
                                                "T/H"),
                                            _buildCard(
                                                "Water Level",
                                                "images/F2.3.png",
                                                "55.41",
                                                "%"),
                                            _buildCard(
                                                "Power Frequency",
                                                "images/F2.4.png",
                                                "50.08",
                                                "Hz"),
                                          ],
                                        ),
                                      )
                                    : SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.45,
                                        child: GridView.count(
                                          crossAxisCount: crossAxisCount,
                                          childAspectRatio: 1,
                                          children: <Widget>[
                                            _buildCard(
                                                "Steam Pressure",
                                                "images/F1.1.png",
                                                "0.0",
                                                "bar"),
                                            _buildCard(
                                                "Steam Flow",
                                                "images/F1.2.png",
                                                "0.0",
                                                "T/H"),
                                            _buildCard("Water Level",
                                                "images/F1.3.png", "0.0%", "%"),
                                            _buildCard(
                                                "Power Frequency",
                                                "images/F1.4.png",
                                                "0.0Hz",
                                                "Hz"),
                                          ],
                                        ),
                                      ),
                                const SizedBox(
                                  height: 10,
                                ),
                                factory == 1
                                    ? const Text(
                                        "2024-04-26 13:45:25",
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      )
                                    : const Text(
                                        "--:--",
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                factoryButton(0, 'Factory 1', Icons.factory),
                                const SizedBox(
                                  width: 20,
                                ),
                                factoryButton(1, 'Factory 2', Icons.factory),
                                const SizedBox(
                                  width: 20,
                                ),
                                factoryButton(2, 'Factory 3', Icons.factory),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            margin: const EdgeInsets.all(20),
                            color: Colors.grey[200],
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Minimum Threshold",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Icon(Icons.info_outline,
                                              color: Colors.black),
                                          const SizedBox(
                                            width: 11,
                                          ),
                                          Ink(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            child: InkWell(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              onTap: () {},
                                              child: const Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Icon(Icons.edit,
                                                    color: Colors.purple),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      _buildParameter(
                                          "Steam Pressure", "29", "bar"),
                                      _buildParameter(
                                          "Steam Flow", "22", "T/H"),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      _buildParameter("Water Level", "53", "%"),
                                      _buildParameter(
                                          "Power Frequency", "48", "Hz"),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 200,
                                  )
                                ],
                              ),
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                factoryButton(0, 'Factory 1', Icons.factory),
                                const SizedBox(
                                  width: 20,
                                ),
                                factoryButton(1, 'Factory 2', Icons.factory),
                                const SizedBox(
                                  width: 20,
                                ),
                                factoryButton(2, 'Factory 3', Icons.factory),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
          bottomNavigationBar: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
            currentIndex: currentIndex,
            selectedItemColor: Colors.purple,
            unselectedItemColor: Colors.grey,
            onTap: (int index) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ));
  }

  Widget factoryButton(int idx, String text, IconData icon) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          factory = idx;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        elevation: 8,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        fixedSize: const Size(150, 120),
        side: BorderSide(
          width: factory == idx ? 1.5 : 0,
          color: factory == idx ? Colors.blue : Colors.transparent,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(icon, size: 30),
          Text(
            text,
            style: const TextStyle(
              fontSize: 21,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(String title, String path, String value, String unit) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0,
      margin: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(
            height: 10,
          ),
          Text(title,
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.normal)),
          const SizedBox(
            height: 10,
          ),
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.asset(path, fit: BoxFit.cover),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(value,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              Text(unit,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold)),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildParameter(String title, String value, String unit) {
    TextEditingController controller = TextEditingController(text: value);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 50,
                    child: TextField(
                      controller: controller,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                  ),
                  Text(unit,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class ContactCard extends StatelessWidget {
  final String name;
  final String phoneNumber;

  const ContactCard({
    Key? key,
    required this.name,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Row(
          children: <Widget>[
            Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
                Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 180, 174, 174),
                    shape: BoxShape.circle,
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                ),
              ],
            ),
            Expanded(
              child: ListTile(
                title: Text(name, style: const TextStyle(fontSize: 20)),
                subtitle:
                    Text(phoneNumber, style: const TextStyle(fontSize: 20)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
