import 'package:intl/intl.dart';

var realFormat = NumberFormat.currency(
    locale: 'br',
    name: 'R\$ ',
    decimalDigits: 2,
    symbol: ''
);