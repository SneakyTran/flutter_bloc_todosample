import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:todolistapp/components/buttons/acting_button_widget.dart';
import 'package:todolistapp/components/shapes/circle_blur_shape.dart';
import 'package:todolistapp/constants.dart';
import 'package:todolistapp/edit_project/view/edit_project_page.dart';
import 'package:todolistapp/models/tasks/providers/input_provider/add_project_input_provider.dart';
import 'package:todolistapp/screens/home_screen.dart';
import 'package:todolistapp/screens/login_screen.dart';
import 'package:todolistapp/widgets/main_background_widget.dart';
import 'package:todos_repository/todos_repository.dart';

class LetStartScreen extends StatelessWidget {
  static String id = "/";
  const LetStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            const MainBackgroundWidget(),
            Expanded(
              flex: kLetStartScreenBottomRateScale,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Text(
                      "Task Management &\n To-Do List",
                      style: kTextTitle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      "This productive tool is designed to help \n you better manage your tasks \n project-wise conveniently!",
                      style: kTextContent,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: ActingButtonWidget(
                        title: "Let's Start",
                        hasIcon: true,
                        hasBoxShadow: true,
                        isActive: true,
                        onTap: () {
                          Navigator.pushNamed(context, HomeScreen.id);
                          // Navigator.of(context).push(EditProjectPage.route());
                        }),
                  ),
                  Expanded(
                    child: Transform.translate(
                      offset: Offset(71, 13),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: CircleBlurShape(
                          rad: kRadianNormal - 12,
                          color: kColorOrange,
                          opacity: 0.5,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
