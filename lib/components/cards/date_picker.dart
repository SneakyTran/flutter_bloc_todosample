import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolistapp/components/cards/card_container.dart';
import 'package:todolistapp/components/cards/card_selector.dart';
import 'package:todolistapp/edit_project/bloc/edit_project_bloc.dart';
import 'package:todolistapp/edit_project/bloc/edit_project_event.dart';
import 'package:todolistapp/models/tasks/providers/input_provider/add_project_input_provider.dart';
import 'package:todolistapp/models/tasks/providers/input_provider/input_provider.dart';
import 'package:todolistapp/ultilities/date_time.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({
    super.key,
  });
  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime? _startDate;
  DateTime? _endDate;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initData();
  }

  void initData() async {
    _startDate = DateTime.now();
    _endDate = DateTime.now();
  }

  void addInputDate(AddProjectProvider addProjectProvider, DateTime? inputDate,
      InputDateType inputDateType) {
    addProjectProvider.addDatePicker(inputDate, inputDateType);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () async {
            await _selectDate(context, true, _startDate!);
            context
                .read<EditProjectBloc>()
                .add(EditStartDateChanged(_startDate ?? DateTime.now()));
          },
          child: CardContainer(
            child: CardSelector(
              title: "Start Date",
              iconPath: 'calendar.png',
              cardTypeSelector: CardTypeSelector.datetime,
              description: DateTimeLibraryHelper.instance.getDate(_startDate),
            ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            await _selectDate(context, false, _endDate!);
            context
                .read<EditProjectBloc>()
                .add(EditStartDateChanged(_endDate ?? DateTime.now()));
          },
          child: CardContainer(
            child: CardSelector(
              title: "End Date",
              iconPath: 'calendar.png',
              cardTypeSelector: CardTypeSelector.datetime,
              description: DateTimeLibraryHelper.instance.getDate(_endDate),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _selectDate(
      BuildContext context, bool isStartDate, DateTime initialDate) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: isStartDate ? DateTime(1900) : _startDate!,
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      setState(() {
        if (isStartDate) {
          if (pickedDate.isAfter(_endDate!)) {
            _endDate = pickedDate;
          }
          _startDate = pickedDate;
        } else {
          _endDate = pickedDate;
        }
        // Obtain shared preferences.
      });
    }
  }
}
