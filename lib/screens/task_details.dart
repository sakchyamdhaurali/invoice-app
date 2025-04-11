// import 'package:flutter/material.dart';


// class TaskDetailsScreen extends StatefulWidget {
//   @override
//   _TaskDetailsScreenState createState() => _TaskDetailsScreenState();
// }

// class _TaskDetailsScreenState extends State<TaskDetailsScreen> {
//   final _formKey = GlobalKey<FormState>();
//   String? _selectedLocation;
//   TextEditingController _dateController = TextEditingController();
//   TextEditingController _startTimeController = TextEditingController();
//   TextEditingController _endTimeController = TextEditingController();
//   TextEditingController _rateController = TextEditingController();
  
//   List<String> sydneyLocations = [
//     'Sydney CBD', 'Parramatta', 'Bondi', 'Manly', 'Newtown', 'Chatswood'
//   ];

//   Future<void> _selectDate() async {
//     DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(1950),
//       lastDate: DateTime(2101),
//     );
//     if (picked != null) {
//       setState(() {
//         _dateController.text = "${picked.day}/${picked.month}/${picked.year}";
//       });
//     }
//   }

//   Future<void> _selectTime(TextEditingController controller) async {
//     TimeOfDay? picked = await showTimePicker(
//       context: context,
//       initialTime: TimeOfDay.now(),
//     );
//     if (picked != null) {
//       setState(() {
//         controller.text = picked.format(context);
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Task Details")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               TextFormField(
//                 controller: _dateController,
//                 decoration: InputDecoration(
//                   labelText: "Date",
//                   suffixIcon: IconButton(
//                     icon: Icon(Icons.calendar_today),
//                     onPressed: _selectDate,
//                   ),
//                 ),
//               ),
//               DropdownButtonFormField<String>(
//                 value: _selectedLocation,
//                 decoration: InputDecoration(labelText: "Location"),
//                 items: sydneyLocations.map((location) {
//                   return DropdownMenuItem(
//                     value: location,
//                     child: Text(location),
//                   );
//                 }).toList(),
//                 onChanged: (value) {
//                   setState(() {
//                     _selectedLocation = value;
//                   });
//                 },
//               ),
//               TextFormField(
//                 decoration: InputDecoration(labelText: "Business/Contractor"),
//               ),
//               TextFormField(
//                 decoration: InputDecoration(labelText: "Task Detail"),
//                 maxLines: 3,
//               ),
//               TextFormField(
//                 controller: _startTimeController,
//                 decoration: InputDecoration(
//                   labelText: "Start Time",
//                   suffixIcon: IconButton(
//                     icon: Icon(Icons.access_time),
//                     onPressed: () => _selectTime(_startTimeController),
//                   ),
//                 ),
//               ),
//               TextFormField(
//                 controller: _endTimeController,
//                 decoration: InputDecoration(
//                   labelText: "End Time",
//                   suffixIcon: IconButton(
//                     icon: Icon(Icons.access_time),
//                     onPressed: () => _selectTime(_endTimeController),
//                   ),
//                 ),
//               ),
//               TextFormField(
//                 controller: _rateController,
//                 decoration: InputDecoration(labelText: "Rate (/HR)"),
//                 keyboardType: TextInputType.number,
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {},
//                 child: Text("Submit"),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(TaskDetailsApp());
}

class TaskDetailsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TaskDetailsScreen(),
    );
  }
}

class TaskDetailsScreen extends StatefulWidget {
  @override
  _TaskDetailsScreenState createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedLocation;
  TextEditingController _dateController = TextEditingController();
  TextEditingController _startTimeController = TextEditingController();
  TextEditingController _endTimeController = TextEditingController();
  TextEditingController _rateController = TextEditingController();
  TextEditingController _businessController = TextEditingController();
  TextEditingController _taskDetailController = TextEditingController();
  double? _totalAmount;
  
  List<String> sydneyLocations = [
    'Sydney CBD', 'Parramatta', 'Bondi', 'Manly', 'Newtown', 'Chatswood'
  ];

  Future<void> _selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        _dateController.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  Future<void> _selectTime(TextEditingController controller) async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        controller.text = picked.format(context);
      });
    }
  }

  void _calculateTotalAmount() {
    if (_startTimeController.text.isNotEmpty && _endTimeController.text.isNotEmpty && _rateController.text.isNotEmpty) {
      try {
        TimeOfDay startTime = _parseTime(_startTimeController.text);
        TimeOfDay endTime = _parseTime(_endTimeController.text);
        double rate = double.parse(_rateController.text);

        int startMinutes = startTime.hour * 60 + startTime.minute;
        int endMinutes = endTime.hour * 60 + endTime.minute;
        
        double totalHours = (endMinutes - startMinutes) / 60.0;
        setState(() {
          _totalAmount = totalHours * rate;
        });
      } catch (e) {
        print("Error calculating total amount: $e");
      }
    }
  }


  TimeOfDay _parseTime(String time) {
    final format = DateFormat.jm();
    final dateTime = format.parse(time);
    return TimeOfDay.fromDateTime(dateTime);
  }

  void _showInvoiceDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Invoice"),
          content: Text("Do you want to create an invoice?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {},
              child: Text("Create Invoice"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Task Details")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _dateController,
                decoration: InputDecoration(
                  labelText: "Date",
                  suffixIcon: IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: _selectDate,
                  ),
                ),
                validator: (value) => value!.isEmpty ? "Please select a date" : null,
              ),
              DropdownButtonFormField<String>(
                value: _selectedLocation,
                decoration: InputDecoration(labelText: "Location"),
                items: sydneyLocations.map((location) {
                  return DropdownMenuItem(
                    value: location,
                    child: Text(location),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedLocation = value;
                  });
                },
                validator: (value) => value == null ? "Please select a location" : null,
              ),
              TextFormField(
                controller: _businessController,
                decoration: InputDecoration(labelText: "Business/Contractor"),
                validator: (value) => value!.isEmpty ? "Please enter a business/contractor name" : null,
              ),
              TextFormField(
                controller: _taskDetailController,
                decoration: InputDecoration(labelText: "Task Detail"),
                maxLines: 3,
                validator: (value) => value!.isEmpty ? "Please enter task details" : null,
              ),
              TextFormField(
                controller: _startTimeController,
                decoration: InputDecoration(
                  labelText: "Start Time",
                  suffixIcon: IconButton(
                    icon: Icon(Icons.access_time),
                    onPressed: () => _selectTime(_startTimeController),
                  ),
                ),
                validator: (value) => value!.isEmpty ? "Please select a start time" : null,
              ),
              TextFormField(
                controller: _endTimeController,
                decoration: InputDecoration(
                  labelText: "End Time",
                  suffixIcon: IconButton(
                    icon: Icon(Icons.access_time),
                    onPressed: () => _selectTime(_endTimeController),
                  ),
                ),
                validator: (value) => value!.isEmpty ? "Please select an end time" : null,
              ),
              TextFormField(
                controller: _rateController,
                decoration: InputDecoration(labelText: "Rate (/HR)"),
                keyboardType: TextInputType.number,
                validator: (value) => value!.isEmpty ? "Please enter an hourly rate" : null,
              ),
              SizedBox(height: 20),
              if (_totalAmount != null)
                Text(
                  "Total Amount: \$${_totalAmount!.toStringAsFixed(2)}",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green),
                ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _calculateTotalAmount();
                    Future.delayed(Duration(milliseconds: 500), _showInvoiceDialog);
                  }
                },
                child: Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}