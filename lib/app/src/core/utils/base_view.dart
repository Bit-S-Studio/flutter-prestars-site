import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

abstract class BaseView<TBind extends Object> extends StatelessWidget {
  BaseView({Key? key}) : super(key: key);

  final TBind _scope = GetIt.I.get<TBind>();

  TBind get controller => _scope;

  @override
  Widget build(BuildContext context);
}
