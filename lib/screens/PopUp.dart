import 'package:flutter/Material.dart';
import 'package:flutter/services.dart';

class PopUpLayout extends ModalRoute {
  Key key;
  double top = 10;
  double bottom = 20;
  double left = 20;
  double right = 20;
  final Widget child;
  Color bgColor;

  PopUpLayout(
      {this.key,
      @required this.child,
      this.top,
      this.bottom,
      this.left,
      this.right,
      this.bgColor});

  @override
  Duration get transitionDuration => Duration(milliseconds: 300);
  @override
  bool get opaque => false;
  @override
  bool get barrierDismissible => false;
  @override
  Color get barrierColor =>
      bgColor == null ? Colors.black.withOpacity(0.5) : bgColor;
  @override
  String get barrierLabel => null;
  @override
  bool get maintainState => false;

  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return GestureDetector(
      onTap: () {
        SystemChannels.textInput.invokeMethod('TextInput.hide');
      },
      child: Material(
        type: MaterialType.transparency,
        child: SafeArea(
          bottom: true,
          child: _buildOverlayContent(context),
        ),
      ),
    );
  }

  Widget _buildOverlayContent(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          bottom: this.bottom,
          left: this.left,
          top: this.top,
          right: this.right),
      child: child,
    );
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(
      opacity: animation,
      child: ScaleTransition(
        scale: animation,
        child: child,
      ),
    );
  }
}

class PopUpContent extends StatefulWidget {
  _PopUpContentState createState() => _PopUpContentState();
  final Widget content;
  PopUpContent({Key key, this.content}) : super(key: key);
}

class _PopUpContentState extends State<PopUpContent> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.content,
    );
  }
}

showPopUp(BuildContext context, Widget widget, String title,
    {BuildContext popUpContext}) {
  Navigator.push(
      context,
      PopUpLayout(
          top: 30,
          bottom: 50,
          left: 30,
          right: 30,
          child: PopUpContent(
            content: Scaffold(
              appBar: AppBar(
                title: Text(title),
                leading: new Builder(
                  builder: (context) {
                    return IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        try {
                          Navigator.pop(context);
                        } catch (e) {}
                      },
                    );
                  },
                ),
                brightness: Brightness.light,
              ),
              // resizeToAvoidBottomPadding: false,
              body: widget,
            ),
          )));
}
