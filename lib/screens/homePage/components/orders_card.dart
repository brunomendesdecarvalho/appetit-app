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
        leading: CircleAvatar(
          backgroundImage: AssetImage('assets/foto.jpg'),
        ),
        title:
        new Row(
          children: <Widget>[
            Text(
              _elements.values.toList()[index.section][index.index],
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            Spacer(),
            Text(
                'R\$ 5,50',
                style: TextStyle(color: Colors.black, fontSize: 18),
                textAlign: TextAlign.end,
            ),
          ],
        ),
        subtitle: Text(
            'Itens da compra abc aaaaa aaaaaaaaa aaaaaaaaaaaaaaaaaaaa',
            overflow: TextOverflow.ellipsis,
          ),
        );
    },
    groupHeaderBuilder: (BuildContext context, int section) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: Text(
          'Em ' + _elements.keys.toList()[section] + ', você arrecadou R\$ 16,50',
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
