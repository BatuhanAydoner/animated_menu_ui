import 'package:animated_menu_ui/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

double width = 0.0;
double height = 0.0;

class MenuDashboard extends StatefulWidget {
  @override
  _MenuDashboardState createState() => _MenuDashboardState();
}

class _MenuDashboardState extends State<MenuDashboard>
    with SingleTickerProviderStateMixin {
  bool isOpen = false;

  PageController pageController;

  AnimationController controller;
  Animation animation;
  Animation slideAnimation;

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.8);

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));

    animation = Tween(begin: 1.0, end: 0.7).animate(controller);
    slideAnimation =
        Tween<Offset>(begin: Offset(-1, 0.0), end: Offset(0.0, 0.0))
            .animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Stack(
          children: [_buildMenu(context), _buildDashboard(context)],
        ),
      ),
    );
  }

  Widget _buildMenu(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: SlideTransition(
          position: slideAnimation,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Dashboard",
                style: menuFontStyle,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Messages",
                style: menuFontStyle,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Utility Bills",
                style: menuFontStyle,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Funds Transfer",
                style: menuFontStyle,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Bracnhes",
                style: menuFontStyle,
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDashboard(BuildContext context) {
    return AnimatedPositioned(
      top: isOpen ? 0.2 * height : 0.0,
      bottom: isOpen ? 0.2 * height : 0.0,
      left: isOpen ? 0.5 * width : 0.0,
      right: 0.0,
      duration: Duration(milliseconds: 500),
      child: Material(
        borderRadius: BorderRadius.circular(isOpen ? 30.0 : 0.0),
        elevation: 15.0,
        color: backgroundColor,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                    icon: Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        isOpen = !isOpen;
                        (isOpen) ? controller.forward() : controller.reverse();
                      });
                    }),
                Text(
                  "My Cards",
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
                IconButton(
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    onPressed: () {}),
              ],
            ),
            ScaleTransition(
              scale: animation,
              child: Container(
                margin: EdgeInsets.only(top: 10.0),
                height: 200,
                child: PageView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      color: Colors.pink,
                      width: 100,
                      margin: EdgeInsets.symmetric(horizontal: 12.0),
                    ),
                    Container(
                      color: Colors.purple,
                      width: 100,
                      margin: EdgeInsets.symmetric(horizontal: 12.0),
                    ),
                    Container(
                      color: Colors.teal,
                      width: 100,
                      margin: EdgeInsets.symmetric(horizontal: 12.0),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text("Item $index"),
                      leading: Icon(Icons.person),
                      trailing: Icon(Icons.add),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: Colors.white,
                      height: 2.0,
                    );
                  },
                  itemCount: 10),
            )
          ],
        ),
      ),
    );
  }
}
