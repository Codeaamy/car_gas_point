
import 'package:cargaspoint/screens/NewConnectionScreen.dart';
import 'package:cargaspoint/screens/TankServicing.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Car Gas Point'),
          bottom: TabBar(
            indicatorColor: Colors.green,
            tabs: [
              Tab(
                icon: Icon(Icons.add),
                text: 'New Fitting',
              ),
              Tab(
                icon: Icon(Icons.car_repair),
                text: 'Tank Service',
              ),
              Tab(
                icon: Icon(Icons.search),
                text: 'Search',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            NewConnection(),
            TankServicing(),
            Text('Search'),


          ],
        ),
      ),
    );
  }


}
