import 'package:flutter/material.dart';

class TabbedContentView extends StatefulWidget {
  final List<Widget> tabViews;
  final List<String> tabDataList;
  final Color indicatorColor;
  final Color borderColor;
  final ValueChanged<int> onTabSelected;

  TabbedContentView({
    required this.tabViews,
    required this.tabDataList,
    this.indicatorColor = Colors.blue,
    this.borderColor = Colors.grey,
    required this.onTabSelected,
  });

  @override
  _TabbedContentViewState createState() => _TabbedContentViewState();
}

class _TabbedContentViewState extends State<TabbedContentView> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late double _leftRadius;
  late double _rightRadius;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: widget.tabDataList.length, vsync: this);
    _tabController.addListener(_handleTabSelection);
    _tabController.addListener(_updateBorderRadius);
    _updateBorderRadius(); // Initialize border radius
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _updateBorderRadius() {
    setState(() {
      // Calculate border radius based on the selected tab index
      final currentIndex = _tabController.index;
      _leftRadius = currentIndex == 0 ? 12.0 : 0.0;
      _rightRadius = currentIndex == widget.tabDataList.length - 1 ? 12.0 : 0.0;
    });
  }

  void _handleTabSelection() {
    setState(() {
      widget.onTabSelected(_tabController.index);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        if (widget.tabDataList.length > 1)...[
          Container(
            height: 36,
            decoration: BoxDecoration(
              border: Border.all(color: widget.borderColor),
              borderRadius: BorderRadius.circular(13),
            ),
            child: Row(
              children: [
                for (var i = 0; i < widget.tabDataList.length; i++)...[
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        _tabController.animateTo(i); // Switch to the tapped tab
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: _tabController.index == i
                              ? widget.indicatorColor
                              : Colors.transparent,
                          borderRadius: BorderRadius.horizontal(
                              right: Radius.circular(_rightRadius),
                              left: Radius.circular(_leftRadius)
                          ) ,
                        ),
                        child: Center(
                          child: Text(
                            widget.tabDataList[i],
                            style: TextStyle(
                              fontSize: 10,
                              color: _tabController.index == i
                                  ? Colors.redAccent
                                  : Colors.grey,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (i < widget.tabDataList.length - 1)
                    VerticalDivider(
                      color: widget.borderColor,
                      width: 1,
                      thickness: 1,
                    ),
                ],
              ],
            ),
          ),
          SizedBox(height: 20),
        ],
        Expanded(
          child: TabBarView(
            controller: _tabController,
            physics: NeverScrollableScrollPhysics(),
            children: widget.tabViews,
          ),
        ),
      ],
    );
  }
}