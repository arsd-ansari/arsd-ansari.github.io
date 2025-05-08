import 'package:arshad_portfolio/constants.dart';
import 'package:arshad_portfolio/modals/Recommendation.dart';
import 'package:flutter/material.dart';

class DraggableScrollList extends StatefulWidget {
  final List<Recommendation> recommendations;

  const DraggableScrollList({required this.recommendations});

  @override
  State<DraggableScrollList> createState() => _DraggableScrollListState();
}

class _DraggableScrollListState extends State<DraggableScrollList> {
  final ScrollController _scrollController = ScrollController();
  double _dragStartX = 0.0;
  bool _isDragging = false;

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (event) {
        _dragStartX = event.position.dx;
        _isDragging = true;
      },
      onPointerMove: (event) {
        if (_isDragging) {
          double delta = _dragStartX - event.position.dx;
          _scrollController.jumpTo(
            (_scrollController.offset + delta).clamp(
              0.0,
              _scrollController.position.maxScrollExtent,
            ),
          );
          _dragStartX = event.position.dx;
        }
      },
      onPointerUp: (_) => _isDragging = false,
      onPointerCancel: (_) => _isDragging = false,
      child: SizedBox(
        height: 230,
        child: ListView.builder(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          itemCount: widget.recommendations.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(right: defaultPadding),
            child: RecommendationCard(
              recommendation: widget.recommendations[index],
              context: context,
            ),
          ),
        ),
      ),
    );
  }

  Widget RecommendationCard(
      {required Recommendation recommendation, required BuildContext context}) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      padding: EdgeInsets.all(defaultPadding),
      color: secondaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            recommendation.name!,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Text(recommendation.source!),
          const SizedBox(height: defaultPadding),
          Text(
            recommendation.text!,
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(height: 1.5),
          )
        ],
      ),
    );
  }
}
