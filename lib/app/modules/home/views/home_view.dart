import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:mylab/app/modules/home/util/medical_tile.dart';
import 'package:mylab/app/modules/home/views/webview_custom.dart';
import 'package:mylab/app/modules/news/views/article_listPage.dart';
import 'package:mylab/app/routes/app_pages.dart';
import 'package:mylab/app/modules/login/controllers/auth_controller.dart';
import 'package:mylab/app/modules/login/views/login_page.dart';
// import 'package:mylab/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

import 'package:google_nav_bar/google_nav_bar.dart';

class HomeView extends GetView<HomeController> {
  final AuthController _authController = Get.put(AuthController());
  HomeView({Key? key}) : super(key: key);

  // Creating static data in list
  List<Widget> catButtons = [
    ElevatedButton(
      onPressed: () {
        Get.to(() => ArticlePage());
      },
      style: ElevatedButton.styleFrom(
        primary: Color(0xff0D98BA),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Column(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(Icons.medical_services_outlined,
                  color: Color.fromARGB(255, 0, 102, 203), size: 30),
            ),
          ),
          SizedBox(height: 5),
          Text(
            'News',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ],
      ),
    ),
    SizedBox(
      height: 10,
    ),
    ElevatedButton(
      onPressed: () {
        Get.to(WebviewCustom());
      },
      style: ElevatedButton.styleFrom(
        primary: Color(0xff0D98BA),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Column(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(Icons.medical_services_outlined,
                  color: Color.fromARGB(255, 0, 102, 203), size: 30),
            ),
          ),
          SizedBox(height: 5),
          Text(
            'Halodek',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                children: [
                  // greetings row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Hai, Daffa Akmal
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hi, Ganteng',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8),
                          Text(
                            '18 Oct, 2023',
                            style: TextStyle(color: Colors.blue[200]),
                          )
                        ],
                      ),

                      // Notification
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.blue[600],
                            borderRadius: BorderRadius.circular(12)),
                        padding: EdgeInsets.all(2),
                        child: IconButton(
                          onPressed: () {
                            _authController.logout();
                          },
                          icon: Icon(Icons.exit_to_app),
                        ),
                      )
                    ],
                  ),

                  SizedBox(
                    height: 25,
                  ),

                  // search bar
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.blue[600],
                        borderRadius: BorderRadius.circular(12)),
                    padding: EdgeInsets.all(12),
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Cari',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 25,
                  ),

                  // konten
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Kategori',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.more_horiz,
                        color: Colors.white,
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 15, left: 15, right: 15, bottom: 15),
                    child: Column(
                      children: [
                        GridView.builder(
                          itemCount: catButtons.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            childAspectRatio: 1.1,
                          ),
                          itemBuilder: (context, index) {
                            return catButtons[index];
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(25),
                color: Colors.grey[200],
                child: Center(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Medical info',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Icon(Icons.more_horiz),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      // Listview of Medical Info
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        child: ListView(
                          children: [
                            MedicalTile(),
                            MedicalTile(),
                            MedicalTile(),
                            MedicalTile(),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      Container(
                        child: Text(
                          "Take a Photo for Consulation",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),

                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 400,
                        height: 80,
                        color: Colors.grey,
                        child: IconButton(
                          icon: Icon(Icons.add_photo_alternate_outlined),
                          color: Colors.black,
                          onPressed: () {
                            Get.offAllNamed(Routes.PROFILE);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.blue[800],
      bottomNavigationBar: Container(
        color: Color(0xff4264D0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6),
          child: GNav(
            backgroundColor: Color(0xff4264D0),
            color: Colors.black,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.grey.shade800,
            gap: 8,
            // selectedIndex: _index,
            // onTabChange: (int index) {
            //   setState(() {
            //     _index = index;
            //   });
            // },
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.chat,
                text: 'Chat',
              ),
              GButton(
                icon: Icons.search,
                text: 'Search',
              ),
              GButton(
                icon: Icons.person,
                text: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
