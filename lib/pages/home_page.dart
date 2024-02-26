import "package:flutter/material.dart";
import "package:modern_home_ui/util/smart_device_box.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List mySmartDevice = [
    ['Smart Ligth', 'assets/lightbulb.png', true],
    ['Smart Fan', 'assets/fan.png', false],
    ['Smart Air', 'assets/air-condition.png', false],
    ['Smart TV', 'assets/television.png', false],
  ];

  void powerSwitchCharged(bool value, int index) {
    setState(() {
      mySmartDevice[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/more.png',
                    height: 45,
                    color: Colors.grey.shade800,
                  ),
                  Icon(Icons.person, size: 45, color: Colors.grey.shade800),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      'Welcome My Home.',
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Divider(
                  color: Colors.grey.shade300,
                  thickness: 1,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  'Smart Devices',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                      color: Colors.grey.shade800),
                ),
              ),
              Expanded(
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  //    padding: const EdgeInsets.all(20),
                  itemCount: mySmartDevice.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.3,
                  ),
                  itemBuilder: ((context, index) {
                    return SmartDeviceBox(
                      smartDeviceName: mySmartDevice[index][0],
                      iconPath: mySmartDevice[index][1],
                      powerOn: mySmartDevice[index][2],
                      onChaged: (value) => powerSwitchCharged(value, index),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
