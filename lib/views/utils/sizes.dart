import 'package:flutter/material.dart';

class Sizes {
  BuildContext context;
  Sizes(this.context);
  Size get screenSize => MediaQuery.of(context).size;
}
