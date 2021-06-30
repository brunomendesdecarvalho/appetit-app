import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

class HomePage extends StatefulWidget {
  static String tag = 'home-page';
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _elements = [
    {'topicName': 'GridView.count', 'group': 'GridView Type'},
    {'topicName': 'GridView.builder', 'group': 'GridView Type'},
    {'topicName': 'GridView.custom', 'group': 'GridView Type'},
    {'topicName': 'GridView.extent', 'group': 'GridView Type'},
    {'topicName': 'ListView.builder', 'group': 'ListView Type'},
    {'topicName': 'StatefulWidget', 'group': 'Type of Widget'},
    {'topicName': 'ListView', 'group': 'ListView Type'},
    {'topicName': 'ListView.separated', 'group': 'ListView Type'},
    {'topicName': 'ListView.custom', 'group': 'ListView Type'},
    {'topicName': 'StatelessWidget', 'group': 'Type of Widget'},
  ];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: GroupedListView<dynamic, String>(
          elements: _elements,
          groupBy: (element) => element['group'],
          groupSeparatorBuilder: (String groupByValue) => Text(groupByValue),
          itemBuilder: (context, dynamic element) => Text(element['name']),
          itemComparator: (item1, item2) => item1['name'].compareTo(item2['name']), // optional
          useStickyGroupSeparators: true, // optional
          floatingHeader: true, // optional
          order: GroupedListOrder.ASC, // optional
        ),
      ),
    );

  }
}
