import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:invoice_app/utils/colors.dart';

class BotNavbar extends StatefulWidget {
  const BotNavbar({Key? key}) : super(key: key);

  @override
  State<BotNavbar> createState() => _BotNavbarState();
}

class _BotNavbarState extends State<BotNavbar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return NavigationBarTheme(
      
      data: NavigationBarThemeData(

        labelTextStyle: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return TextStyle(color: Colors.white, fontWeight: FontWeight.w400,
          fontSize: 16,
          ); // Selected label color
        }
        return TextStyle(color: Colors.grey, fontWeight: FontWeight.normal, fontSize: 14,); // Unselected label color
      }
      ),
       
        iconTheme: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return IconThemeData(color: Colors.white); // Color of selected icon
        }
        return IconThemeData(color: Colors.grey); // Color of unselected icon
        
      }),
    

      ),
      child: NavigationBar(
        
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
        indicatorColor: Colors.transparent,
        backgroundColor: AppColors.drawerColor,
        
        
        destinations: [
          
          NavigationDestination(icon: Icon(Icons.home), label: "Home",),
          NavigationDestination(
            icon: Icon(FontAwesomeIcons.fileInvoice),
            label: "Invoice",
          ),
          NavigationDestination(
            icon: Icon(FontAwesomeIcons.clock),
            label: "Track",
          ),
          NavigationDestination(icon: Icon(Icons.more_horiz), label: "More"),
        ],
      ),
    );
  }
}
