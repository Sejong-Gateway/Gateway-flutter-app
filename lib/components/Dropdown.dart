import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'Modal.dart';

class DropdownColors {
  DropdownColors({
    this.backgroundColor,
    this.textColor,
    this.iconColor,
    this.borderColor,
  });

  final Color backgroundColor;
  final Color textColor;
  final Color iconColor;
  final Color borderColor;

  DropdownColors copyWith({
    Color backgroundColor,
    Color textColor,
    Color iconColor,
    Color borderColor,
  }) {
    return DropdownColors(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textColor: textColor ?? this.textColor,
      iconColor: iconColor ?? this.iconColor,
      borderColor: borderColor ?? this.borderColor,
    );
  }

  DropdownColors merge(DropdownColors other) {
    if (other == null) return this;
    return copyWith(
      backgroundColor: other.backgroundColor,
      textColor: other.textColor,
      iconColor: other.iconColor,
      borderColor: other.borderColor,
    );
  }
}

class _DropdownDefaultColors {
  const _DropdownDefaultColors(this._theme);
  _DropdownDefaultColors.of(BuildContext context) : this(Theme.of(context));

  final ThemeData _theme;

  DropdownColors get _default => DropdownColors(
    textColor: _theme.disabledColor,
    backgroundColor: Colors.white,
    iconColor: Colors.black,
    borderColor: _theme.disabledColor,
  );

  DropdownColors get _active => DropdownColors(
    textColor: Colors.black,
    backgroundColor: Colors.white,
    iconColor: Colors.black,
    borderColor: _theme.disabledColor,
  );

  DropdownColors get _disabled => DropdownColors(
    textColor: Color(0xff888888),
    backgroundColor: Color(0xfff4f5f6),
    iconColor: Color(0xff888888),
    borderColor: _theme.disabledColor,
  );
}

// ITS-1000 Default, Active, Disabled 분류
class Dropdown extends StatefulWidget {
  const Dropdown({
    Key key,
    this.width = 366,
    this.height = 42,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
    this.margin,
    this.borderRadius = const BorderRadius.all(Radius.circular(4)),
    this.value,
    // 다른 widget에서 placeholder보단 hint를 자주 사용하기에 placeholder -> hint로 변경
    this.hint,
    this.textSize = 15,
    this.itemWidgetBuilder,
    @required this.items,
    @required this.labelGetter,
    this.onClickListItem,
    this.listViewPercentage = 0.4,
    this.disabled = false,
    this.defaultColors,
    this.activeColors,
    this.disabledColors,
  })  : assert(listViewPercentage < 1.0 && listViewPercentage > 0.0,
  "listview persantage는 0과 1사이여야 합니다."),
        assert(items != null, "items는 필수입니다."),
        assert(labelGetter != null, "labelGetter는 필수입니다."),
        super(key: key);

  final double width;
  final double height;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final double listViewPercentage;

  final BorderRadiusGeometry borderRadius;

  final dynamic value;
  final String hint;
  final double textSize;

  final bool disabled;

  // * itemWidgetBuilder를 사용해서 직접 list의 item을 반환해 주는 방법을 이용 할 수 있습니다.
  final Widget Function(
      BuildContext context, dynamic item, int index, List items)
  itemWidgetBuilder;

  final List items;
  // * items가 String이 아닐 경우 text에 띄우느 값이 이상하게 보일 수 있어서 labelGetter를 이용합니다.
  final String Function(dynamic item, int index, List items) labelGetter;
  final Function(dynamic item) onClickListItem;

  final DropdownColors defaultColors;
  final DropdownColors activeColors;
  final DropdownColors disabledColors;

  @override
  _DropdownState createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  String _value;
  // 만약 밖에서 정해주는 value가 있다면 그걸 띄우는게 1순위
  // 그 다음 순위는 내부에서 사용자가 선택한 아이템
  // 그 다음은 힌트
  String get _text => widget.value ?? _value ?? widget.hint;

  Function _onClick(items, index) => () {
    if (widget.onClickListItem != null)
      widget.onClickListItem(widget.items[index]);
    setState(() {
      _value = widget.labelGetter(widget.items[index], index, widget.items);
    });
    Navigator.pop(context);
  };

  DropdownColors get _color {
    if (widget.disabled)
      return _DropdownDefaultColors.of(context)
          ._disabled
          .merge(widget.disabledColors);
    if (_value != null)
      return _DropdownDefaultColors.of(context)
          ._active
          .merge(widget.activeColors);
    return _DropdownDefaultColors.of(context)
        ._default
        .merge(widget.defaultColors);
  }

  void _showModal() {
    showModal(
      context: context,
      builder: (context) => ModalView(
        padding: EdgeInsets.zero,
        childMarginBottom: 0,
        childMarginTop: 0,
        child: SizedBox(
          height:
          MediaQuery.of(context).size.height * widget.listViewPercentage,
          child: DropdownListView(
            // onClickListItem: widget.onClickListItem,
            childCount: widget.items.length,
            delegate: (BuildContext context, int index) {
              if (widget.itemWidgetBuilder != null)
                return InkWell(
                  onTap: _onClick(widget.items, index),
                  child: widget.itemWidgetBuilder(
                      context, widget.items[index], index, widget.items),
                );
              return DropdownListItem(
                text: widget.labelGetter(
                    widget.items[index], index, widget.items),
                onTap: _onClick(widget.items, index),
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
//    _value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      decoration: BoxDecoration(
        border: Border.all(color: _color.borderColor),
        borderRadius: widget.borderRadius,
      ),
      child: Material(
        color: _color.backgroundColor,
        borderRadius: widget.borderRadius,
        child: InkWell(
          onTap: widget.disabled ? null : _showModal,
          child: Padding(
            padding: widget.padding,
            child: SizedBox(
              width: widget.width,
              height: widget.height,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    this._text,
                    style: TextStyle(
                      fontSize: widget.textSize,
                      color: _color.textColor,
                    ),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: _color.iconColor,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DropdownListView extends StatelessWidget {
  const DropdownListView({
    Key key,
    this.onClickListItem,
    @required this.delegate,
    this.childCount,
  })  : assert(delegate != null, "delegate는 필수입니다."),
        super(key: key);

  final Function(num index) onClickListItem;
  final Function(BuildContext context, int index) delegate;
  final int childCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8),
      child: Scrollbar(
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                delegate,
                childCount: childCount,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DropdownListItem extends StatelessWidget {
  const DropdownListItem({
    Key key,
    @required this.text,
    this.onTap,
    this.width = double.infinity,
    this.height,
    this.padding = const EdgeInsets.all(12),
    this.margin = EdgeInsets.zero,
    this.backgroundColor,
    this.textColor,
    this.textSize = 15,
  }) : super(key: key);

  final double width;
  final double height;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final Color backgroundColor;

  final String text;
  final Color textColor;
  final double textSize;

  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: this.margin,
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: this.onTap,
          child: Padding(
            padding: this.padding,
            child: SizedBox(
              width: this.width,
              height: this.height,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      this.text,
                      style: TextStyle(
                        fontSize: this.textSize,
                        color: this.textColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}