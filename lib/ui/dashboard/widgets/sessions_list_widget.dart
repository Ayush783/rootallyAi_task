import 'package:flutter/material.dart';
import 'package:rootallyai_task/models/sessions.dart';
import 'package:timelines/timelines.dart';

class SessionsListWidget extends StatelessWidget {
  const SessionsListWidget({
    Key? key,
    this.sessions,
  }) : super(key: key);

  final List<Sessions>? sessions;

  @override
  Widget build(BuildContext context) {
    return Timeline.tileBuilder(
      builder: TimelineTileBuilder(
        itemCount: 4,
        indicatorBuilder: (context, index) {
          return DotIndicator();
        },
        contentsBuilder: (context, index) {
          return Container();
        },
        startConnectorBuilder: (context, index) {
          if (index != 0) return Connector.solidLine();
        },
        endConnectorBuilder: (context, index) {
          if (index == 0)
            return Connector.dashedLine(
              dash: 4,
              gap: 4,
            );
          else
            return Connector.solidLine();
        },
        itemExtent: 100,
        nodePositionBuilder: (context, index) => 0,
      ),
      padding: EdgeInsets.all(0),
      theme: TimelineThemeData(
          connectorTheme: ConnectorThemeData(
            color: Color(0xff606060),
            thickness: 2,
          ),
          indicatorTheme: IndicatorThemeData(color: Color(0xff606060))),
    );
  }
}
