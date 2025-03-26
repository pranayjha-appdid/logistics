import 'package:flutter/material.dart';

class ReviewPackersAndMovers extends StatefulWidget {
  const ReviewPackersAndMovers({super.key});

  @override
  State<ReviewPackersAndMovers> createState() => _ReviewPackersAndMoversState();
}

class _ReviewPackersAndMoversState extends State<ReviewPackersAndMovers> {
  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Schedule Bookings",
          style:
              Theme.of(context).textTheme.displayMedium?.copyWith(fontSize: 15),
        ),
        SizedBox(
          height: 15,
        ),
        GestureDetector(
          onTap: () => _selectDate(context),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.black),
            ),
            child: Row(
              children: [
                // pick up and drop timeline

                Icon(
                  Icons.calendar_month_outlined,
                  color: Colors.black,
                  size: 25,
                ),
                SizedBox(
                  width: 25,
                ),
                Text(
                  selectedDate == null
                      ? "Select Date"
                      : "${selectedDate!.day}-${selectedDate!.month}-${selectedDate!.year}",
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium
                      ?.copyWith(fontSize: 15),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
