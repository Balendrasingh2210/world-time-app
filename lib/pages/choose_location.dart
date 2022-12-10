import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class Chooselocation extends StatefulWidget {
  const Chooselocation({super.key});

  @override
  State<Chooselocation> createState() => _ChooselocationState();
}

class _ChooselocationState extends State<Chooselocation> {
  List<WorldTime> locations = [
    WorldTime(location: 'India', flag: 'India.png', url: 'Asia/Kolkata'),
    WorldTime(location: 'London', flag: 'uk.png', url: 'Europe/London'),
    WorldTime(location: 'Athens', flag: 'berlin.png', url: 'Europe/Berlin'),
    WorldTime(location: 'Cairo', flag: 'Cairo.png', url: 'Africa/Cairo'),
    WorldTime(location: 'Nairobi', flag: 'Nairobi.png', url: 'Africa/Nairobi'),
    WorldTime(location: 'Chicago', flag: 'Chicago.png', url: 'America/Chicago'),
    WorldTime(
        location: 'New York', flag: 'new_york.png', url: 'America/New_York'),
    WorldTime(location: 'Seoul', flag: 'Seoul.png', url: 'Asia/Seoul'),
    WorldTime(location: 'Jakarta', flag: 'jakarta.png', url: 'Asia/Jakarta'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    //navigate to homescreen
    // ignore: use_build_context_synchronously
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text('Choose Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () {
                updateTime(index);
              },
              title: Text(locations[index].location),
              leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/${locations[index].flag}')),
            ),
          );
        },
      ),
    );
  }
}
