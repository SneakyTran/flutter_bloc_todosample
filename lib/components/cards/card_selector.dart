import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:todolistapp/components/cards/dropdown_card.dart';
import 'package:todolistapp/components/cards/flash_card.dart';
import 'package:todolistapp/components/icons/icon_group.dart';
import 'package:todolistapp/models/logo/logo.dart';

class CardSelector extends StatelessWidget {
  const CardSelector({
    super.key,
    required this.title,
    required this.description,
    this.iconGroup,
    required this.iconPath,
    required this.cardTypeSelector,
    this.descriptionTextStyle,
  });

  final String title;
  final String description;
  final IconGroup? iconGroup;
  final String iconPath;
  final CardTypeSelector cardTypeSelector;
  final TextStyle? descriptionTextStyle;

  @override
  Widget build(BuildContext context) {
    final List<Logo> _listLogo = [
      Logo(
        iconData: Icons.wordpress,
        iconName: "iconName",
        iconType: "iconType",
      ),
      Logo(
        iconData: Icons.wordpress,
        iconName: "iconName",
        iconType: "iconType",
      ),
      Logo(
        iconData: Icons.wordpress,
        iconName: "iconName",
        iconType: "iconType",
      ),
    ];
    final Size _sizeScreen = MediaQuery.of(context).size;
    final double _maxHeight = _sizeScreen.height * 2 / 3;
    final double _maxWidgth = _sizeScreen.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Image(
              image: AssetImage("assets/images/$iconPath"),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: cardTypeSelector == CardTypeSelector.projectType
                  ? DropdownCard(title: title)
                  : FlashCard(
                      title: title,
                      description: description,
                      descriptionStyle: descriptionTextStyle,
                    ),
            ),
          ],
        ),
        (cardTypeSelector == CardTypeSelector.logo)
            ? ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xFFEDE8FF)),
                ),
                onPressed: () {
                  showMaterialModalBottomSheet(
                    context: context,
                    builder: (context) => SingleChildScrollView(
                      controller: ModalScrollController.of(context),
                      child: SizedBox(
                        height: _maxHeight,
                        child: GridView.count(
                          crossAxisSpacing:
                              10.0, // Set the spacing between columns
                          mainAxisSpacing: 10.0, // Set the spacing between rows
                          crossAxisCount: 2,
                          childAspectRatio: _maxWidgth * 4 / _maxHeight,
                          children: _listLogo
                              .map((logo) => SizedBox(
                                    child: Row(
                                      children: [
                                        Icon(
                                          logo.iconData,
                                          size: 50,
                                        ),
                                        SizedBox(width: 5),
                                        Text(logo.iconName),
                                      ],
                                    ),
                                  ))
                              .toList(),
                        ),
                      ),
                    ),
                  );
                },
                child: const Text(
                  "Change Logo",
                  style: TextStyle(color: Color(0xFF5F33E1)),
                ),
              )
            : const Image(image: AssetImage("assets/images/Arrow - Down 3.png"))
      ],
    );
  }
}

enum CardTypeSelector {
  datetime,
  projectType,
  logo,
}
