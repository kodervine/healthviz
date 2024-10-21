import 'package:flutter/material.dart';
import 'package:healthviz/widgets/common/custom_text.dart';
import 'package:healthviz/widgets/forms/custom_dropdown.dart';

class ReminderScreen extends StatefulWidget {
  const ReminderScreen({super.key});

  @override
  State<ReminderScreen> createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  bool isReminderOn = false;
  TimeOfDay? selectedTime;
  String reminderFrequency = 'Daily'; // Default reminder frequency
  List<String> selectedDays = [];

  final List<String> daysOfWeek = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];

  // Function to handle time selection using a time picker
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  // Toggle the selection of a day for custom reminders
  void _toggleDaySelection(String day) {
    setState(() {
      if (selectedDays.contains(day)) {
        selectedDays.remove(day);
      } else {
        selectedDays.add(day);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomText(
                    text: "Enable Reminder",
                    textSize: 18,
                  ),
                  Switch(
                    value: isReminderOn,
                    onChanged: (value) {
                      setState(() {
                        isReminderOn = value;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Show options only if reminder is ON
              if (isReminderOn) ...[
                const Text(
                  'Reminder Frequency',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                CustomDropdown(
                  hintText: reminderFrequency,
                  dropdownMenuEntries: const [
                    DropdownMenuEntry(value: "Daily", label: "Daily"),
                    DropdownMenuEntry(value: "Custom", label: "Custom"),
                    // DropdownMenuEntry(value: "Daily", label: "Daily")
                  ],
                  onSelected: (newValue) {
                    setState(() {
                      reminderFrequency = newValue!;
                      selectedDays
                          .clear(); // Reset selected days when frequency changes
                    });
                  },
                ),

                // DropdownButton<String>(
                //   value: reminderFrequency,
                //   items:
                //       <String>['Daily', 'Weekly', 'Custom'].map((String value) {
                //     return DropdownMenuItem<String>(
                //       value: value,
                //       child: Text(value),
                //     );
                //   }).toList(),
                //   onChanged: (newValue) {
                //     setState(() {
                //       reminderFrequency = newValue!;
                //       selectedDays
                //           .clear(); // Reset selected days when frequency changes
                //     });
                //   },
                // ),
                const SizedBox(height: 20),

                // If daily or weekly, show time picker
                if (reminderFrequency != 'Custom') ...[
                  const Text(
                    'Reminder Time',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () => _selectTime(context),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 254, 249, 255),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            selectedTime != null
                                ? selectedTime!.format(context)
                                : 'Select Time',
                            style: const TextStyle(fontSize: 16),
                          ),
                          const Icon(Icons.access_time),
                        ],
                      ),
                    ),
                  ),
                ],

                // If weekly, show day selection for a specific day
                if (reminderFrequency == 'Weekly') ...[
                  const SizedBox(height: 20),
                  const Text(
                    'Select Day',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 8.0,
                    children: daysOfWeek.map((day) {
                      return ChoiceChip(
                        label: Text(day),
                        selected: selectedDays.contains(day),
                        onSelected: (bool selected) {
                          _toggleDaySelection(day);
                        },
                      );
                    }).toList(),
                  ),
                ],

                // If custom, show multiple day selections
                if (reminderFrequency == 'Custom') ...[
                  const SizedBox(height: 20),
                  const Text(
                    'Select Days and Time',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 8.0,
                    children: daysOfWeek.map((day) {
                      return FilterChip(
                        label: Text(day),
                        selected: selectedDays.contains(day),
                        onSelected: (bool selected) {
                          _toggleDaySelection(day);
                        },
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () => _selectTime(context),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 254, 249, 255),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            selectedTime != null
                                ? selectedTime!.format(context)
                                : 'Select Time',
                            style: const TextStyle(fontSize: 16),
                          ),
                          const Icon(Icons.access_time),
                        ],
                      ),
                    ),
                  ),
                ]
              ],
            ],
          ),
        ),
      ),
    );
  }
}
