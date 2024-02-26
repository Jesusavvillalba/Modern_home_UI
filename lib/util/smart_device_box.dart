import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SmartDeviceBox extends StatelessWidget {
  SmartDeviceBox(
      {super.key,
      required this.smartDeviceName,
      required this.iconPath,
      required this.powerOn,
      required this.onChaged});

  final String smartDeviceName;
  final String iconPath;
  final bool powerOn;
  void Function(bool)? onChaged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          color: powerOn ? Colors.grey.shade900 : Colors.grey.shade400,
          borderRadius: BorderRadius.circular(24),
        ),
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                iconPath,
                height: 65,
                color: powerOn ? Colors.white : Colors.black,
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Text(
                        smartDeviceName,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: powerOn ? Colors.white : Colors.black),
                      ),
                    ),
                  ),
                  Transform.rotate(
                    angle: pi / 2,
                    child: CupertinoSwitch(
                      value: powerOn,
                      onChanged: onChaged,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
