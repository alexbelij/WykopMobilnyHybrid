import 'package:flutter/material.dart';
import 'package:owmflutter/owm_glyphs.dart';
import 'package:owmflutter/utils/utils.dart';

class VoteButton extends StatefulWidget {
  final VoidCallback onClicked;
  final VoidCallback onLongClicked;
  final num count;
  final bool isSelected;
  final bool negativeIcon;
  final bool onlyIcon;
  final double fontSize;
  final EdgeInsets margin;
  final bool isComment;

  VoteButton({
    @required this.onClicked,
    @required this.isSelected,
    this.onLongClicked,
    this.count,
    this.negativeIcon: false,
    this.onlyIcon: false,
    this.fontSize: 15.0,
    this.margin,
    this.isComment: false,
  });

  _VoteButtonState createState() => _VoteButtonState();
}

class _VoteButtonState extends State<VoteButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onClicked(),
      onLongPress: () => widget.onLongClicked(),
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 400),
        curve: Curves.easeInOutQuart,
        margin: widget.margin,
        padding: EdgeInsets.all(widget.fontSize / 3.5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: widget.isComment
              ? Border.all(color: Theme.of(context).backgroundColor, width: 2.0)
              : null,
          color: Utils.voteBackgroundStateColor(
            context,
            isComment: widget.isComment,
            isSelected: widget.isSelected,
            negativeIcon: widget.negativeIcon,
          ),
        ),
        child: Row(
          children: <Widget>[
            Icon(
              widget.negativeIcon
                  ? OwmGlyphs.ic_buttontoolbar_minus
                  : OwmGlyphs.ic_buttontoolbar_plus,
              size: widget.fontSize * 1.19,
              color: Utils.voteIconStateColor(
                isSelected: widget.isSelected,
                negativeIcon: widget.negativeIcon,
              ),
            ),
            Visibility(
              visible: !widget.onlyIcon,
              child: Padding(
                padding: EdgeInsets.only(right: widget.fontSize / 3.5),
                child: Text(
                  (widget.count ?? 0).toInt().toString(),
                  style: TextStyle(
                    color: Utils.voteIconStateColor(
                      isSelected: widget.isSelected,
                      negativeIcon: widget.negativeIcon,
                    ),
                    fontSize: widget.fontSize,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
