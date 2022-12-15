import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:slot_machine_game/models/prize.dart';
import 'package:slot_machine_game/theme.dart';

class PrizeDialog extends StatefulWidget {
  final Prize prize;
  const PrizeDialog({required this.prize, Key? key}) : super(key: key);

  @override
  State<PrizeDialog> createState() => _PrizeDialogState();
}

class _PrizeDialogState extends State<PrizeDialog> with TickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _animation;

  @override
  void initState() {
    _animationController = AnimationController(duration: const Duration(seconds: 2), vsync: this)..forward();
    _animation = CurvedAnimation(parent: _animationController, curve: Curves.bounceOut);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(widget.prize.asset),
          const SizedBox(height: 20),
          Text(widget.prize.name, style: TextStyles.bodyReg24),
        ],
      ),
    );
  }
}
