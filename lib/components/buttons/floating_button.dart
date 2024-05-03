import 'package:flutter/material.dart';
import 'package:todolistapp/constants.dart';
import 'package:todolistapp/edit_project/view/edit_project_page.dart';
import 'package:todolistapp/screens/add_project_screen.dart';
import 'package:todolistapp/screens/today_tasks_screen.dart';
import 'package:todolistapp/screens/view_projects_screen.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    const Color menuColor = kColorMenu;
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: kColorButton.withOpacity(0.1),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Stack(
        children: [
          Transform.translate(
            offset: const Offset(0, -25),
            child: Align(
              alignment: Alignment.topCenter,
              child: CustomPaint(
                size: const Size(60, 60),
                painter: CirclePainter(color: Colors.white),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildIcon(Icons.home, menuColor.withOpacity(0.5), () {}),
              _buildIcon(Icons.calendar_month_outlined, menuColor, () {
                Navigator.pushNamed(context, TodayTasksScreen.id);
              }),
              _buildCenterIcon(Icons.add, menuColor, () {
                Navigator.of(context).push(EditProjectPage.route());
              }),
              _buildIcon(Icons.note, menuColor.withOpacity(0.5), () {
                Navigator.pushNamed(context, ViewProjectsScreen.id);
              }),
              _buildIcon(Icons.group, menuColor.withOpacity(0.5), () {}),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildIcon(IconData iconData, Color color,
          VoidCallback? handleBottomMenuChoose) =>
      Expanded(
        flex: 2,
        child: GestureDetector(
          onTap: handleBottomMenuChoose,
          child: Icon(
            iconData,
            color: color.withOpacity(0.5),
          ),
        ),
      );

  Widget _buildCenterIcon(IconData iconData, Color color,
          VoidCallback? handleBottomMenuChoose) =>
      Expanded(
        flex: 3,
        child: GestureDetector(
          onTap: handleBottomMenuChoose,
          child: Transform.translate(
            offset: Offset(0, -25),
            child: CircleAvatar(
              radius: 28,
              backgroundColor: color,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(28)),
                  boxShadow: [
                    BoxShadow(
                      color: color.withOpacity(0.3),
                      blurRadius: 10,
                      spreadRadius: 19,
                      offset: Offset(2, 10),
                    )
                  ],
                ),
                child: Icon(
                  iconData,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      );
}

class CirclePainter extends CustomPainter {
  final Color color;

  CirclePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final double width = size.width;
    final double height = size.height;

    final Rect rect = Rect.fromLTWH(0, 0, width, height);
    canvas.drawOval(rect, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
