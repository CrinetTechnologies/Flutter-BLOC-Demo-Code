import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'bloc/app.dart';
import 'bloc/shopping_repository.dart';
import 'bloc/simple_bloc_observer.dart';

void main() {
  Bloc.observer = const SimpleBlocObserver();
    runApp(App(shoppingRepository: ShoppingRepository()));
}
