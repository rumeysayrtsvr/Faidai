import 'package:first_app/talimat.dart';
import 'package:flutter/material.dart';
import 'package:first_app/main.dart';
import 'package:camera/camera.dart';
import 'package:first_app/anasayfa.dart';

class MyApp extends StatelessWidget {
  final CameraDescription? camera;

  const MyApp(this.camera, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginPage(),
    );
  }
}

class CameraNotFoundScreen extends StatelessWidget {
  const CameraNotFoundScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kamera Bulunamadı'),
      ),
      body: const Center(
        child: Text('Cihazınızda kamera bulunamadı.'),
      ),
    );
  }
}

class CameraScreen extends StatefulWidget {
  final CameraDescription? camera;

  const CameraScreen(this.camera, {Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;

  @override
  void initState() {
    super.initState();
    if (widget.camera != null) {
      _controller = CameraController(widget.camera!, ResolutionPreset.medium);
      _controller.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.camera == null || !_controller.value.isInitialized) {
      return Container();
    }
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close_outlined),
          iconSize: 50,
          color: Colors.pink,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MyAppHomePage()));
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: CameraPreview(_controller),
          ),
          SizedBox(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: const Icon(Icons.camera),
                  iconSize: 70,
                  color: Colors.pink,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EducationPage()));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
