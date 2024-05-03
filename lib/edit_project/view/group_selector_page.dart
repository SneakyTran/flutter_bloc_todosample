import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolistapp/components/cards/card_container.dart';
import 'package:todolistapp/constants.dart';
import 'package:todolistapp/edit_project/bloc/edit_project_bloc.dart';
import 'package:todolistapp/edit_project/bloc/edit_project_event.dart';

import '../../project_overview/models/group.dart';

class GroupSelectorPage extends StatelessWidget {
  const GroupSelectorPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const GroupSelectorView();
  }
}

class GroupSelectorView extends StatefulWidget {
  const GroupSelectorView({super.key});

  @override
  State<GroupSelectorView> createState() => _GroupSelectorViewState();
}

class _GroupSelectorViewState extends State<GroupSelectorView> {
  final List<Group> _listTaskGroup = [
    Group(name: "Work", groupStyleEnum: GroupStyleEnum.work),
    Group(name: "Personal", groupStyleEnum: GroupStyleEnum.personal),
    Group(name: "Study", groupStyleEnum: GroupStyleEnum.study),
  ];

  late Group _selectedTaskGroup;

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
    textEditingController.dispose();
    super.dispose();
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
              _selectedTaskGroup.name,
              style: kTitleTextStyle,
            ),
          ),
          DropdownButtonHideUnderline(
            child: DropdownButton2<Group>(
              selectedItemBuilder: (context) => _listTaskGroup
                  .map<Widget>(
                    (taskGroup) => Row(
                      children: [
                        Transform.translate(
                          offset: const Offset(-10, -8),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Icon(
                              taskGroup.groupStyleEnum.icon,
                              color: taskGroup.groupStyleEnum.color,
                            ),
                          ),
                        ),
                        Text(taskGroup.name),
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
                  .map((taskGroup) => DropdownMenuItem<Group>(
                        value: taskGroup,
                        child: Row(
                          children: [
                            Icon(
                              taskGroup.groupStyleEnum.icon,
                              color: taskGroup.groupStyleEnum.color,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 6.0),
                              child: Text(taskGroup.name),
                            ),
                          ],
                        ),
                      ))
                  .toList(),
              value: _selectedTaskGroup,
              onChanged: (newValue) {
                context.read<EditProjectBloc>().add(EditGroupChanged(
                      (newValue ?? _listTaskGroup[0]).name,
                    ));
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
                  return item.value?.name.toLowerCase().contains(searchValue) ??
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
          )
        ],
      ),
    );
  }
}
