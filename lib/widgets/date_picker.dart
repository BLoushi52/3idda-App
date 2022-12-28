import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../providers/myorder_provider.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({super.key});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTimeRange selectedDates = DateTimeRange(
    start: DateTime.now(),
    end: DateTime.now(),
  );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "From: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(DateFormat("yyyy-MM-dd").format(selectedDates.start)),
                  ],
                ),
              )),
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "To: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(DateFormat("yyyy-MM-dd").format(selectedDates.end)),
                  ],
                ),
              )),
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "Duration : ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text("${selectedDates.duration.inDays} days"),
                  ],
                ),
              )),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.yellow[700],
              foregroundColor: Colors.black,
              padding: EdgeInsets.symmetric(horizontal: 116, vertical: 10),
            ),
            child: Text(
              "Choose Dates",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () async {
              final DateTimeRange? dateTimeRange = await showDateRangePicker(
                context: context,
                firstDate: DateTime(2000),
                lastDate: DateTime(3000),
                initialDateRange: selectedDates,
                builder: (context, child) {
                  return Theme(
                    data: Theme.of(context).copyWith(
                      colorScheme: ColorScheme.light(
                        primary: Colors.amberAccent, // <-- SEE HERE
                        onPrimary: Colors.black, // <-- SEE HERE
                        onSurface: Colors.black, // <-- SEE HERE
                      ),
                    ),
                    child: child!,
                  );
                },
              );
              if (dateTimeRange != null) {
                setState(() {
                  selectedDates = dateTimeRange;
                  context.read<MyOrderProvider>().chooseDate(
                      DateFormat("yyyy-MM-dd").format(selectedDates.start),
                      DateFormat("yyyy-MM-dd").format(selectedDates.end));
                });

                print(context.read<MyOrderProvider>().fromDate);
                print(context.read<MyOrderProvider>().toDate);
              }
            },
          )
        ],
      ),
    );
  }
}
