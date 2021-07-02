import 'package:appetit/screens/homePage/components/option_button.dart';
import 'package:appetit/utils/theme.dart';
import 'package:appetit/utils/title_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cart/flutter_cart.dart';

class FoodDetailsPage extends StatefulWidget {
  @override
  _FoodDetailsPageState createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: getCorTema(),
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              TitleText('Detalhes do pedido'),
              DescriptionText('Caso queira, aproveite para adicionar alguma observação para este pedido'),
              Card(
                  color: Colors.white,
                  elevation: 0.2,
                  margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            ListTile(
                              leading: CircleAvatar(
                                backgroundImage: AssetImage('assets/cuscuz_completo.jpg'),
                              ),
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Cuscuz Completo',
                                      style: TextStyle(
                                        fontSize: 16,
                                      )
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(top: 19),
                                    child: Text('R\$ 3,25',
                                      style: TextStyle(
                                          fontSize: 16
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              subtitle: Text('Milho ou arroz',
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 16,
                                  )
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
              ),
              Divider(
                thickness: 1,
                color: Colors.black12,
              ),
              SizedBox(
                height: 24,
              ),
              Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 16.0, bottom: 4.0),
                    child: Text('Opções',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                        )),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 16.0, bottom: 16.0),
                    child: Text('Escolha uma das opções de massas disponíveis abaixo.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54
                        )
                    ),
                  ),
                ],
              ),
              OptionButton(context, 'Cuscuz de milho'),
              SizedBox(height: 8.0,),
              OptionButton(context, 'Cuscuz de arroz'),
              Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 16.0, top: 24.0),
                    child: Text('Observações',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                        )),
                  ),
                  Container(
                    padding: EdgeInsets.all(16.0),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Deseja adicionar alguma obs.?',
                      ),
                    )
                  ),
                ],
              ),
              // AddToCartMenu(),
              // SizedBox(
              //   height: 15,
              // ),
              // BottomMenu(),
            ],
          ),
        ),
      ),
    );
  }
}

// class FoodTitleWidget extends StatelessWidget {
//   String productName;
//   String productPrice;
//   String productDesc;
//
//   FoodTitleWidget({
//     Key? key,
//     required this.productName,
//     required this.productPrice,
//     required this.productDesc,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         Row(
//           children: <Widget>[
//             CircleAvatar(
//               backgroundImage: AssetImage('assets/cuscuz_completo.jpg'),
//             ),
//             Column(
//               children: [
//                 Text(
//                   productName,
//                   style: TextStyle(
//                       fontSize: 16,
//                       color: Colors.black,
//                       fontWeight: FontWeight.w500
//                   ),
//                 ),
//                 Text(
//                   productDesc,
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Colors.black54,
//                   ),
//                 ),
//               ],
//             ),
//             Text(
//               productPrice,
//               style: TextStyle(
//                   fontSize: 20,
//                   color: Color(0xFF3a3a3b),
//                   fontWeight: FontWeight.w500),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
//
// class BottomMenu extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Row(
//         children: <Widget>[
//           ]
//       ),
//     );
//   }
// }

// class AddToCartMenu extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           IconButton(
//             onPressed: () {},
//             icon: Icon(Icons.remove),
//             color: Colors.black,
//             iconSize: 30,
//           ),
//           InkWell(
//             onTap: () {
//               // Navigator.push(context, ScaleRoute(page: FoodOrderPage()));
//             },
//             child: Container(
//               width: 200.0,
//               height: 45.0,
//               decoration: new BoxDecoration(
//                 color: Color(0xFFfd2c2c),
//                 border: Border.all(color: Colors.white, width: 2.0),
//                 borderRadius: BorderRadius.circular(10.0),
//               ),
//               child: Center(
//                 child: Text(
//                   'abc',
//                   style: new TextStyle(
//                       fontSize: 18.0,
//                       color: Colors.white,
//                       fontWeight: FontWeight.w400),
//                 ),
//               ),
//             ),
//           ),
//           IconButton(
//             onPressed: () {},
//             icon: Icon(Icons.add),
//             color: Color(0xFFfd2c2c),
//             iconSize: 30,
//           ),
//         ],
//       ),
//     );
//   }
// }