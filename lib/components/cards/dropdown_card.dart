import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolistapp/components/cards/card_container.dart';
import 'package:todolistapp/components/icons/icon_group.dart';
import 'package:todolistapp/constants.dart';
import 'package:todolistapp/models/tasks/providers/input_provider/add_project_input_provider.dart';
import 'package:todolistapp/models/tasks/task_group.dart';

class DropdownCard extends StatefulWidget {
  const DropdownCard({
    super.key,
    required this.title,
  });
  final String title;

  @override
  State<DropdownCard> createState() => _DropdownCardState();
}

class _DropdownCardState extends State<DropdownCard> {
  final List<TaskGroup> _listTaskGroup = [
    TaskGroup(
      groupName: "Work",
      iconGroup: IconGroup(
        icon: Icons.work,
        iconColor: kColorPink,
      ),
    ),
    TaskGroup(
      groupName: "Personal",
      iconGroup: IconGroup(
        icon: Icons.account_circle,
        iconColor: kColorPurple,
      ),
    ),
    TaskGroup(
      groupName: "Study",
      iconGroup: IconGroup(
        icon: Icons.menu_book,
        iconColor: kColorOrange,
      ),
    ),
  ];
  late TaskGroup _selectedTaskGroup;
  final TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    _selectedTaskGroup = _listTaskGroup[0];
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CardContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 36.0),
            child: Text(
              widget.title,
              style: kTitleTextStyle,
            ),
          ),
          DropdownButtonHideUnderline(
            child: Consumer<AddProjectProvider>(
              builder: (_, AddProjectProvider provider, __) =>
                  DropdownButton2<TaskGroup>(
                selectedItemBuilder: (context) => _listTaskGroup
                    .map<Widget>(
                      (taskGroup) => Row(
                        children: [
                          Transform.translate(
                            offset: const Offset(-10, -8),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: taskGroup.iconGroup,
                            ),
                          ),
                          Text(taskGroup.groupName),
                        ],
                      ),
                    )
                    .toList(),
                iconStyleData: const IconStyleData(
                  iconSize: 0,
                ),
                isExpanded: true,
                isDense: true,
                hint: Text(
                  'Select Item',
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                items: _listTaskGroup
                    .map((taskGroup) => DropdownMenuItem<TaskGroup>(
                          value: taskGroup,
                          child: Row(
                            children: [
                              taskGroup.iconGroup,
                              Padding(
                                padding: const EdgeInsets.only(left: 6.0),
                                child: Text(taskGroup.groupName),
                              ),
                            ],
                          ),
                        ))
                    .toList(),
                value: _selectedTaskGroup,
                onChanged: (newValue) {
                  provider.addTaskGroup(newValue ?? _listTaskGroup[0]);
                  setState(() {
                    _selectedTaskGroup = newValue ?? _listTaskGroup[0];
                  });
                },
                buttonStyleData: const ButtonStyleData(
                  height: 30,
                ),
                dropdownStyleData: const DropdownStyleData(
                  maxHeight: 200,
                  padding: EdgeInsets.all(10),
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                  padding: EdgeInsets.zero,
                ),
                dropdownSearchData: DropdownSearchData(
                  searchController: textEditingController,
                  searchInnerWidgetHeight: 50,
                  searchInnerWidget: Container(
                    height: 50,
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 4,
                      right: 8,
                      left: 8,
                    ),
                    child: TextFormField(
                      expands: true,
                      maxLines: null,
                      controller: textEditingController,
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 8,
                        ),
                        hintText: 'Search for an item...',
                        hintStyle: const TextStyle(fontSize: 12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  searchMatchFn: (item, searchValue) {
                    return item.value?.groupName
                            .toLowerCase()
                            .contains(searchValue) ??
                        false;
                  },
                ),
                //This to clear the search value when you close the menu
                onMenuStateChange: (isOpen) {
                  if (!isOpen) {
                    textEditingController.clear();
                  }
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
