import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';

class Settingscreen extends StatelessWidget {
  const Settingscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Row(mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SidebarX(
              theme:SidebarXTheme(),
            controller: SidebarXController(selectedIndex: 0),
            items: [
              SidebarXItem(
                icon: Icons.settings_accessibility,
                label: "سیستم"



              ),
              SidebarXItem(
                icon: Icons.network_wifi,
              ),
              SidebarXItem(
                icon: Icons.local_parking,
              ),
                  SidebarXItem(
                icon: Icons.camera,
              ),
                  SidebarXItem(
                icon: Icons.account_box,
              )
            ],
          )
        ],
      ),
    );
  }
}
