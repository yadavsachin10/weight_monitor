import 'package:flutter/material.dart';
import 'package:weight_monitor_app/models/weight_save.dart';
import 'package:weight_monitor_app/components/weight_list_item.dart';
import 'package:weight_monitor_app/screens/add_entry_dialog.dart';
import 'dart:async';
import 'package:weight_monitor_app/screens/input_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<WeightSave> _weightSaves = [];

  Future _addWeight() async {
    WeightSave newEntry = await Navigator.of(context).push(
      MaterialPageRoute<WeightSave>(
          builder: (BuildContext context) {
            return AddEntryDialog();
          },
          fullscreenDialog: true),
    );
    if (newEntry != null) {
      setState(() {
        _weightSaves.add(newEntry);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text(
                'Weight \n   Monitor',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              decoration: BoxDecoration(
                color: Color(0xFFEB1555),
              ),
            ),
            ListTile(
              title: Text(
                'BMI Calc',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InputPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Weight Monitor'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: _weightSaves.length,
          itemBuilder: (context, indice) {
            bool isFirstWeight = indice == 0;
            WeightSave weightSave = _weightSaves[indice];
            double difference = isFirstWeight
                ? 0.0
                : weightSave.weight - _weightSaves[indice - 1].weight;
            return WeightListItem(weightSave, difference);
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFEB1555),
        onPressed: _addWeight,
        child: Icon(Icons.add),
      ),
    );
  }
}
