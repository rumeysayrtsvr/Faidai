import 'package:first_app/egitim.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:first_app/camera.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyAppHomePage(),
    );
  }
}

class MyAppHomePage extends StatefulWidget {
  const MyAppHomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyAppHomePageState createState() => _MyAppHomePageState();
}

class _MyAppHomePageState extends State<MyAppHomePage> {
  int _selectedIndex = 0;
  late CameraDescription? selectedCamera;

  @override
  void initState() {
    super.initState();
    _loadCameras();
  }

  void _loadCameras() async {
    final cameras = await availableCameras();
    if (cameras.isNotEmpty) {
      setState(() {
        selectedCamera = cameras[0];
      });
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 1) {
        // Kamera ikonuna tıklandığında
        selectedCamera != null
            ? _pages[_selectedIndex] = CameraScreen(selectedCamera!)
            : _pages[_selectedIndex] =
                Container(); // Kamera mevcut değilse boş bir container göster
      }
    });
  }

  static final List<Widget> _pages = <Widget>[
    const ProfilePage(),
    Container(),
    const Egitim(),
  ];

  Widget _buildBottomNavigationBarItem(int index, IconData icon, String label) {
    return GestureDetector(
      onTap: () {
        _onItemTapped(index);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            height: _selectedIndex == index ? 36.0 : 24.0,
            width: _selectedIndex == index ? 36.0 : 24.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _selectedIndex == index ? Colors.pink : Colors.transparent,
            ),
            child: Icon(
              icon,
              color: _selectedIndex == index ? Colors.white : Colors.grey,
            ),
          ),
          const SizedBox(height: 4.0),
          Text(
            label,
            style: TextStyle(
              fontSize: _selectedIndex == index ? 9.0 : 11.0,
              color: _selectedIndex == index ? Colors.pink : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 8,
        child: Container(
          height: 56,
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.grey,
                width: 0.5,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _buildBottomNavigationBarItem(0, Icons.person, 'Profile'),
              _buildBottomNavigationBarItem(
                  1, Icons.camera_alt_rounded, 'Camera'),
              _buildBottomNavigationBarItem(
                  2, Icons.school_rounded, 'Education'),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: SizedBox(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 80),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 73,
                  backgroundColor: Colors.pink,
                  child: CircleAvatar(
                    radius: 70,
                    backgroundImage: AssetImage("lib/images/bracket1.png"),
                  ),
                )
              ],
            ),
            const SizedBox(height: 15),
            const Align(
              alignment: Alignment.center,
              child: Text(
                'GDSC Selçuk',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text(
                    'Scan History',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: const [
                  ListItem(
                    imagePath: 'lib/images/1dereceyanık.png',
                    title: '1st degree burns detected',
                    date: '22/10/2023 - 15:35',
                  ),
                  SizedBox(height: 15),
                  ListItem(
                    imagePath: 'lib/images/kene.png',
                    title: 'Tick bite detected',
                    date: '22/10/2023 - 15:35',
                  ),
                  SizedBox(height: 15),
                  ListItem(
                    imagePath: 'lib/images/kesik.png',
                    title: 'Cut detected',
                    date: '22/10/2023 - 15:35',
                  ),
                  SizedBox(height: 15),
                  ListItem(
                    imagePath: 'lib/images/2dereceyanık.png',
                    title: '2nd degree burns detected ',
                    date: '22/10/2023 - 15:35',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final String date;

  const ListItem({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const Padding(padding: EdgeInsets.only(left: 20.0)),
        Image(image: AssetImage(imagePath)),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              date,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.normal,
                color: Color.fromARGB(255, 74, 72, 72),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
