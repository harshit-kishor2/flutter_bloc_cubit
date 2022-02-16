import 'package:flutter/material.dart';

class TabView extends StatelessWidget {
  const TabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            leading: const Icon(Icons.person_outline),
            title: const Text(
              "HOME SCREEN",
              style: TextStyle(fontSize: 16.0),
            ),
            bottom: PreferredSize(
                child: TabBar(
                    isScrollable: true,
                    unselectedLabelColor: Colors.white.withOpacity(0.3),
                    indicatorColor: Colors.white,
                    tabs: const [
                      Tab(
                        child: Text("Kumar"),
                      ),
                      Tab(
                        child: Text("Lokesh"),
                      ),
                      Tab(
                        child: Text("Rathod"),
                      ),
                      Tab(
                        child: Text("Raj"),
                      ),
                      Tab(
                        child: Text("Madan"),
                      ),
                      Tab(
                        child: Text("Manju"),
                      )
                    ]),
                preferredSize: const Size.fromHeight(30.0)),
            actions: const <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 16.0),
                child: Icon(Icons.add_alert),
              ),
            ],
          ),
          body: const TabBarView(
            children: <Widget>[
              Center(
                child: Text("Tab 1"),
              ),
              Center(
                child: Text("Tab 2"),
              ),
              Center(
                child: Text("Tab 3"),
              ),
              Center(
                child: Text("Tab 4"),
              ),
              Center(
                child: Text("Tab 5"),
              ),
              Center(
                child: Text("Tab 6"),
              ),
            ],
          )),
    );
  }
}
