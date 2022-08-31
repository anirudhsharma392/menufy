import 'dart:async';
import 'package:flutter/material.dart';

///provides toggle animation
//for eg when the card expands
class ExpandedSection extends StatefulWidget {
  final Widget child;
  final bool isExpanded;

  ExpandedSection({this.isExpanded = false, required this.child});

  @override
  _ExpandedSectionState createState() => _ExpandedSectionState();
}

class _ExpandedSectionState extends State<ExpandedSection>
    with SingleTickerProviderStateMixin {
  late AnimationController expandController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    prepareAnimations();
    _runExpandCheck();
  }

  ///Setting up the animation
  void prepareAnimations() {
    expandController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    animation = CurvedAnimation(
      parent: expandController,
      curve: Curves.fastOutSlowIn,
    );
  }

  void _runExpandCheck() {
    if (widget.isExpanded) {
      expandController.forward();
    } else {
      expandController.reverse();
    }
  }

  @override
  void didUpdateWidget(ExpandedSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    _runExpandCheck();
  }

  @override
  void dispose() {
    expandController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
        axisAlignment:1.0, sizeFactor: animation, child: widget.child);
  }
}



///see more at https://pub.dev/packages/show_up_animation

// class SlideInAnimatedList extends StatelessWidget {
//   final List<Widget> children;
//   final CrossAxisAlignment crossAxisAlignment;
//   final Direction direction;
//   final int delayStart;
//   final int initialDelayStart;
//   final int animationDuration;
//   final double offSet;
//   final axis;
//   SlideInAnimatedList(
//       {this.children = const [],
//         this.offSet = 0.2,
//         this.crossAxisAlignment = CrossAxisAlignment.center,
//         this.direction = Direction.horizontal,
//         this.animationDuration = 1000,
//         this.delayStart = 100,
//         this.initialDelayStart = 0,
//         this.axis});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       crossAxisAlignment: crossAxisAlignment,
//       children: List.generate(
//           children.length,
//               (index) => SlideInAnimation(
//             children[index],
//             index: index,
//             offSet: offSet,
//             delayStart: index == 0 ? (initialDelayStart) : delayStart,
//             direction: direction,
//             animationDuration: animationDuration,
//           )),
//     );
//   }
// }

// class SlideInAnimation extends StatelessWidget {
//   final Widget child;
//   final int index;
//   final Direction direction;
//   final int delayStart;
//   final int animationDuration;
//   final double offSet;
//
//   SlideInAnimation(this.child,
//       {this.index = 1,
//         this.offSet = 0.2,
//         this.direction = Direction.horizontal,
//         this.animationDuration = 1000,
//         this.delayStart = 100});
//
//   @override
//   Widget build(BuildContext context) {
//     return ShowUpAnimation(
//       delayStart: Duration(milliseconds: delayStart * index),
//       animationDuration: Duration(milliseconds: animationDuration),
//       curve: Curves.easeIn,
//       direction: direction,
//       offset: offSet,
//       child: child,
//     );
//   }
// }

//animates child widget
class SizeAnimation extends StatefulWidget {
  final Widget child;
  final double axisAlignment;
  final Duration duration;
  final Curve curve;
  //will loop to end if true
  final bool animationStatus;
  final BoxDecoration? decoration;

  const SizeAnimation(
      {Key? key,
      required this.child,
      this.animationStatus = true,
      this.decoration,
      this.axisAlignment = -1,
      this.duration = const Duration(milliseconds: 300),
      this.curve = Curves.easeIn})
      : super(key: key);

  @override
  State<SizeAnimation> createState() => _SizeAnimationState();
}

class _SizeAnimationState extends State<SizeAnimation>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: widget.duration,
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: widget.curve,
  );

  @override
  void didUpdateWidget(covariant SizeAnimation oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);

    widget.animationStatus
        ? _controller.animateTo(1)
        : _controller.animateTo(0);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.animateTo(1);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: widget.decoration,
      child: SizeTransition(
          sizeFactor: _animation,
          axisAlignment: widget.axisAlignment,
          child: widget.child),
    );
  }
}

///animates the position on [animate] change
class AnimatePosition extends StatefulWidget {
  final bool animate;
  final Widget child;

  final Duration duration;
  final double? right1;
  final double? right2;
  final double? bottom1;
  final double? bottom2;
  final double size1;
  final double size2;
  @override
  State<AnimatePosition> createState() => _AnimatePositionState();

  const AnimatePosition(
      {Key? key,
      required this.size1,
      required this.size2,
      this.animate = true,
      required this.child,
      this.duration = const Duration(seconds: 2),
      this.right1,
      this.right2,
      this.bottom1,
      this.bottom2})
      : super(key: key);
}

class _AnimatePositionState extends State<AnimatePosition> {
  bool selected = true;

  bool hideWidget = false;
  @override
  void initState() {
    super.initState();
    selected = widget.animate;
  }

  @override
  void didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);

    setState(() {
      selected = widget.animate;
    });

    if (!selected) {
      hideWidget = true;
      Timer(widget.duration, () {
        setState(() {
          hideWidget = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (hideWidget) {
      return Positioned(
          height: widget.size2,
          width: widget.size2,
          right: widget.right2,
          bottom: widget.bottom2,
          child: widget.child);
    }

    return AnimatedPositioned(
        height: selected ? widget.size1 : widget.size2,
        width: selected ? widget.size1 : widget.size2,
        right: selected ? widget.right1 : widget.right2,
        bottom: selected ? widget.bottom1 : widget.bottom2,
        duration: widget.duration,
        curve: Curves.easeInBack,
        child: widget.child);
  }
}

class FadeTransitionDuo extends StatelessWidget {
  final Widget child1;
  final Widget child2;
  final bool showFirst;
  const FadeTransitionDuo(
      {Key? key,
      required this.child1,
      required this.child2,
      this.showFirst = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Duration _duration = Duration(milliseconds: 500);
    return Stack(children: <Widget>[
      AnimatedOpacity(
          opacity: showFirst ? 1 : 0, duration: _duration, child: child1),
      AnimatedOpacity(
          opacity: showFirst ? 0 : 1, duration: _duration, child: child2),
    ]);
  }
}

class FadeInAnimation extends StatelessWidget {
  final Widget child;
  final bool visible;
  final Duration duration;
  const FadeInAnimation(
      {Key? key,
      required this.child,
      required this.visible,
      this.duration = const Duration(milliseconds: 500)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
        // If the widget is visible, animate to 0.0 (invisible).
        // If the widget is hidden, animate to 1.0 (fully visible).
        opacity: visible ? 1.0 : 0.0,
        duration: duration,
        // The green box must be a child of the AnimatedOpacity widget.
        child: child);
  }
}
