import 'dart:async';
import 'package:flutter/material.dart';
import 'package:owmflutter/model/model.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:provider/provider.dart';

class LinksList extends StatefulWidget {
  final dynamic builder;
  final Widget header;

  LinksList({this.builder, this.header});

  @override
  LinksListState createState() {
    return new LinksListState();
  }
}

class LinksListState extends State<LinksList> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
      child: ChangeNotifierProvider<LinkListModel>(
        builder: widget.builder,
        child: Consumer<LinkListModel>(
          builder: (context, model, _) => RefreshIndicator(
            onRefresh: () => model.refresh(),
            child: model.isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : InfiniteList(
                    header: widget.header,
                    loadData: (completer) async {
                      await model.loadMoreLinks();
                      completer.complete();
                    },
                    itemCount: model.links.length,
                    itemBuilder: (context, index) {
                      return ChangeNotifierProvider<LinkModel>(
                        builder: (context) =>
                            LinkModel()..setData(model.links[index]),
                        child: NewLinkWidget(),
                      );
                    },
                  ),
          ),
        ),
      ),
    );
  }
}
