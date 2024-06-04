import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class TriagemLoader extends StatelessWidget {
  const TriagemLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.waveDots(
        color: const Color(0xFFFED701),
        size: 60,
      ),
    );
  }
}
