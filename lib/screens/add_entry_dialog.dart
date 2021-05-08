import 'package:flutter/material.dart';
import 'package:weight_monitor_app/models/weight_save.dart';
import 'package:weight_monitor_app/components/date_time_item.dart';
import 'package:numberpicker/numberpicker.dart';

class AddEntryDialog extends StatefulWidget {
  @override
  AddEntryDialogState createState() => AddEntryDialogState();
}

class AddEntryDialogState extends State<AddEntryDialog> {
  TextEditingController _textEditingController = TextEditingController();
  double _weight = 1.0;
  DateTime _dateTime = DateTime.now();
  String _note;

  void _saveButtonClk() {
    Navigator.of(context).pop(WeightSave(_dateTime, _weight, _note));
  }

  void _showWeightPicker(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return DecimalNumberPicker(
              minValue: 1,
              maxValue: 150,
              value: _weight,
              onChanged: (value) {
                if (value != null) {
                  setState(() => _weight = value);
                }
              });
        });
  }

  @override
  void initState() {
    _textEditingController = new TextEditingController(text: _note);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('New Entry'), actions: [
        TextButton(
          onPressed: _saveButtonClk,
          child: Text('Save',
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .copyWith(color: Colors.white)),
        ),
      ]),
      body: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.today, color: Colors.grey[500]),
            title: DateTimeItem(
              dateTime: _dateTime,
              onChanged: (dateTime) => setState(() => _dateTime = dateTime),
            ),
          ),
          ListTile(
            leading: Icon(Icons.airplay),
            title: Text(
              "$_weight kg",
            ),
            onTap: () => _showWeightPicker(context),
          ),
          ListTile(
            leading: Icon(Icons.speaker_notes, color:Colors.grey[500]),
            title: TextField(
              decoration: InputDecoration(
                hintText: 'Optional note',
              ),
              controller: _textEditingController,
              onChanged: (value) => _note = value,
            ),
          )
        ],
      ),
    );
  }
}
