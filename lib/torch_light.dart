import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:torch_controller/torch_controller.dart';

class torchlight extends StatefulWidget {
  const torchlight({super.key});

  @override
  State<torchlight> createState() => _torchlightState();
}

class _torchlightState extends State<torchlight> {
  bool isactive = false;
  var controller = TorchController();
  var img = "assets/flashoff.png";
  @override
  Widget build(BuildContext context) {
    final img_size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 41, 48, 51),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 40, 43, 43),
        centerTitle: true,
        title: Text(
          "Torch light",
          style: TextStyle(
              color: Colors.white, fontSize: 23.0, fontWeight: FontWeight.w800),
        ),
      ),
      body: Stack(children: [
        Container(
          child: Column(
            children: [
              Image.asset(
                isactive ? "assets/flashon.png" : img,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(80),
                child: CircleAvatar(
                  backgroundColor: isactive ? Colors.green : Colors.blueGrey,
                  minRadius: 40,
                  maxRadius: 50,
                  child: Transform.scale(
                    scale: 2.7,
                    child: IconButton(
                      color: Colors.black,
                      onPressed: () {
                        controller.toggle();
                        setState(() {
                          isactive = !isactive;
                        });
                      },
                      icon: Icon(Icons.power_settings_new_rounded),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
      bottomNavigationBar: BottomAppBar(
          height: 50,
          color: Color.fromARGB(255, 41, 42, 42),
          child: Container(
            height: 10.0,
            child: Center(
              child: Text(
                'Developed by Hassan',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          )),
    );
  }
}
