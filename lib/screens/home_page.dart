import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:invoice_app/utils/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:invoice_app/screens/bot_navbar.dart';

class HomePage extends StatelessWidget {
const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        
        drawer: Drawer(
          backgroundColor: AppColors.drawerColor,
          
          // backgroundColor: AppColors.bgColor,
          child: ListView(
            
            children: [
              
                 SizedBox(
                  height: 190,
                   child: DrawerHeader(
                    decoration: BoxDecoration(
                      color: AppColors.drawerColor,
                    ),
                           
                                padding: EdgeInsets.zero,
                                 child: Container(
                           
                    padding: EdgeInsets.all(10),
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        
                               
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage('https://media.licdn.com/dms/image/v2/D5603AQEP_R_7T-G20A/profile-displayphoto-shrink_200_200/profile-displayphoto-shrink_200_200/0/1693224802374?e=2147483647&v=beta&t=njH_rz9TnJT13tc8Bhbzn7yFPIvbkows5c6EEqV7Kus'),
                        ),
                           
                        SizedBox(height: 12,),
                           
                        Column(
                         mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                           
                            Text('Sakchyam Dhaurali', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Colors.white),),
                         Text('sakchyamdhaurali5@gmail.com', style: TextStyle(fontSize: 12, color: Colors.white54),),
                             
                          ],
                          
                        ),
                     
                      
                           
                           
                             ],
                           ),
                    ),
                                 ),
      
                                
                 ),
      
                 ListTile(
                  leading: Icon(Icons.dashboard_outlined),
                  title: Text('Dashboard' , style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),),
                  iconColor: Colors.white,
                 ),
                   ListTile(
                  leading: FaIcon(FontAwesomeIcons.fileInvoice),
                  title: Text('Invoices' , style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),),
                  iconColor: Colors.white,
                 ),
                 
                   ListTile(
                  leading: Icon(FontAwesomeIcons.fileContract),
                  title: Text('Bills' , style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),),
                  iconColor: Colors.white,
                 ),
      
                 ListTile(
                  leading: Icon(FontAwesomeIcons.clock),
                  title: Text('Track' , style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),),
                  iconColor: Colors.white,
                 ),
                  ListTile(
                  leading: Icon(FontAwesomeIcons.file),
                  title: Text('Files' , style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),),
                  iconColor: Colors.white,
                 ),
      
                  ListTile(
                  leading: Icon(FontAwesomeIcons.trashCan),
                  title: Text('Trash' , style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),),
                  iconColor: Colors.white,
                 ),
            ],
          ),
        ),
        backgroundColor: AppColors.bgColor,
        appBar: AppBar(
          
          centerTitle: true,
          actionsPadding: EdgeInsets.all(20),
          leadingWidth: 50,
        title:  Row(
          mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                  Text(
                  'Bill',
                  style:  GoogleFonts.comicNeue(
                    fontSize: 26,
                  ),
                ),
                Text("\$wift", style: GoogleFonts.comicNeue(
                  fontSize: 26
                ),
                ),
              ]
             ),
        
         
         
          backgroundColor: AppColors.bgColor,
          elevation: 0,
          shape:RoundedRectangleBorder(
            borderRadius: BorderRadius.horizontal(
              left: Radius.circular(10),
              right: Radius.circular(10),
              ),
          ),
          actions: [
            Icon(
            Icons.search, 
            color:AppColors.drawerColor,
            )],
          iconTheme: IconThemeData(color: AppColors.drawerColor),
         bottom: TabBar(
              tabs: [
                Tab(text: 'Unpaid'),
                Tab(text: 'Draft'),
                Tab(text: 'Paid'),
              ],
            ),
        ),
      body: Column(
        children: [
      Text('Hello'),
     TabBarView(
  children: [
    LayoutBuilder(
      builder: (context, constraints) {
        debugPrint('Unpaid Tab Constraints: $constraints');
        return Center(child: Text('Unpaid Content'));
      },
    ),
    LayoutBuilder(
      builder: (context, constraints) {
        debugPrint('Draft Tab Constraints: $constraints');
        return Center(child: Text('Draft Content'));
      },
    ),
    LayoutBuilder(
      builder: (context, constraints) {
        debugPrint('Paid Tab Constraints: $constraints');
        return Center(child: Text('Paid Content'));
      },
    ),
  ],
)
        ],
      ),
        bottomNavigationBar: BotNavbar(),
      ),
    );
  }
}