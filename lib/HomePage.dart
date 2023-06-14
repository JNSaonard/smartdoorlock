import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/scheduler.dart';
import 'HistoryPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _timeString = '';

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance!.addPostFrameCallback((_) {
      updateTime();
    });
  }

  void updateTime() {
    setState(() {
      _timeString = DateFormat.Hms().format(DateTime.now());
    });

    Future.delayed(Duration(seconds: 1), () {
      updateTime();
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Text(
                _timeString,
                style: TextStyle(
                  fontFamily: 'Bahnschrift Semilight Condensed',
                  fontSize: 20,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Attendance Binus Student Card for Door Access',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(
                  Icons.home,
                  color: Colors.blue,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.history,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("../images/CardDoor.jpg"), 
                  fit: BoxFit.cover),
                
              ),
              child: Center(
                child: Text(
                  'Please Input Your Student Binus Card in RFID',
                  style: TextStyle(
                    fontFamily: 'Times New Roman',
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            HistoryPage(),
          ],
        ),
      ),
    );
  }
}
