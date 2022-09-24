import 'package:flutter/material.dart';

class UnimplementedPage extends StatelessWidget {
  const UnimplementedPage({required this.pageName, Key? key}) : super(key: key);

  final String pageName;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Funcionalidade ainda não implementada para $pageName'),
    );
  }
}
