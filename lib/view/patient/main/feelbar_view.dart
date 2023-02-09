import 'package:flutter/material.dart';
import 'package:psikoz/core/constants/app/app_size_constant.dart';

import '../home/widgets/feel_bar.dart';

class FeelBarView extends StatelessWidget {
  const FeelBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: FeelBar()),
    );
  }
}
