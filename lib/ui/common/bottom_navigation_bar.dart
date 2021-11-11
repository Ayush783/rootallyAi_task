import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rootallyai_task/ui/common/styles.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          label: 'Today',
          icon: SvgPicture.asset(
            'assets/images/calendar.svg',
            height: 24,
          ),
        ),
        BottomNavigationBarItem(
          label: 'Rehab',
          icon: SvgPicture.asset(
            'assets/images/rehab.svg',
            height: 24,
          ),
        ),
        BottomNavigationBarItem(
          label: 'Demo',
          icon: SvgPicture.asset(
            'assets/images/compass.svg',
            height: 24,
          ),
        ),
        BottomNavigationBarItem(
          label: 'Profile',
          icon: SvgPicture.asset(
            'assets/images/profile.svg',
            height: 24,
          ),
        ),
      ],
      iconSize: 24,
      backgroundColor: Color(0xfff1f1f1),
      elevation: 8,
      currentIndex: 0,
      onTap: (value) {},
      selectedItemColor: Colors.black,
      showUnselectedLabels: true,
      selectedLabelStyle:
          textStyle1.copyWith(fontSize: 14, fontWeight: FontWeight.bold),
      unselectedLabelStyle: textStyle1.copyWith(
        fontSize: 14,
        color: Colors.black45,
      ),
      unselectedItemColor: Colors.black54,
      type: BottomNavigationBarType.fixed,
    );
  }
}
