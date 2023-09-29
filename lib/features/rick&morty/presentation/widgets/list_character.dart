part of features.rickandmorty.presentation.widgets;

class ListVertical extends StatefulWidget {
  const ListVertical({
    super.key,
    required this.result,
    required this.nameListView,
    this.loadLastPage,
    this.loadResults,
  });

  final List<Result> result;
  final String nameListView;
  final VoidCallback? loadLastPage, loadResults;

  @override
  State<ListVertical> createState() => _ListVerticalState();
}

class _ListVerticalState extends State<ListVertical> {
  final scrollController = ScrollController();
  bool isActiveScroll = true;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (widget.loadResults == null) return;
      if ((scrollController.position.pixels + 200) >=
          scrollController.position.maxScrollExtent) {
        widget.loadLastPage!();
        widget.loadResults!();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.74,
      child: ListView.separated(
        padding: py16,
        controller: scrollController,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) => FadeInDown(
          child: CardItem(
            nameListView: widget.nameListView,
            result: widget.result[index],
            child: selectListView(
              value: widget.nameListView,
              result: widget.result[index],
              size: size,
              textStyles: textStyle,
            ),
          ),
        ),
        itemCount: widget.result.length,
        separatorBuilder: (_, __) => gapy16,
      ),
    );
  }
}
