import 'package:flutter/material.dart';
import 'package:group_list_view/group_list_view.dart';

GroupListView createCard() {
  Map<String, List> _elements = {
    '23/10': ['Klay Lewis', 'Ehsan Woodard', 'River Bains'],
    '22/10': ['Toyah Downs', 'Tyla Kane', 'abc'],
  };
  return GroupListView(
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    sectionsCount: _elements.keys.toList().length,
    countOfItemInSection: (int section) {
      return _elements.values.toList()[section].length;
    },
    itemBuilder: (BuildContext context, IndexPath index) {
      return ListTile(
        title: Text(
          _elements.values.toList()[index.section][index.index],
          style: TextStyle(color: Colors.black, fontSize: 18),
      ),
        subtitle: Text('Itens da compra'),
        );
    },
    groupHeaderBuilder: (BuildContext context, int section) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: Text(
          'Em ' + _elements.keys.toList()[section] + ' você vendeu R\$ 16,50',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      );
    },
    separatorBuilder: (context, index) => Divider(
      height: 8,
      thickness: 1,
      color: Colors.black12,
    ),
    sectionSeparatorBuilder: (context, section) => SizedBox(height: 10),
  );
}
