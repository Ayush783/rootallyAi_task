import 'package:flutter/material.dart';
import 'package:rootallyai_task/models/sessions.dart';
import 'package:rootallyai_task/ui/common/styles.dart';
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
          return ListIndicator(
            isCompleted: sessions![index].isCompleted,
          );
        },
        contentsBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            decoration: BoxDecoration(
                border: Border.all(width: 2, color: Color(0xffaeaeae)),
                borderRadius: BorderRadius.circular(8)),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Session ${index + 1}",
                        style: textStyle2.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        sessions![index].title,
                        style: textStyle1.copyWith(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      sessions![index].isCompleted
                          ? Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.blue,
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 6),
                              child: Text(
                                "Completed",
                                style: textStyle1.copyWith(
                                    color: Colors.white, fontSize: 12),
                              ),
                            )
                          : sessions![index - 1].isCompleted
                              ? OutlinedButton(
                                  child: Text(
                                    '\u25B6 Start Session',
                                    style: textStyle1.copyWith(fontSize: 12),
                                  ),
                                  onPressed: () {},
                                  style: OutlinedButton.styleFrom(
                                      primary: Colors.black,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50))),
                                )
                              : Text("Finish session $index to start"),
                      SizedBox(
                        height: 4,
                      ),
                      if (sessions![index].isCompleted)
                        RichText(
                          text: TextSpan(
                              text: "Performed At:",
                              style: textStyle1.copyWith(
                                fontSize: 12,
                                color: Color(0xff4e4e4e),
                              ),
                              children: [
                                TextSpan(
                                    text:
                                        "\n${sessions![index].performedAt.hour}:${sessions![index].performedAt.minute} am")
                              ]),
                        )
                    ],
                  ),
                ),
                SizedBox(
                  width: 2,
                ),
                Expanded(
                    flex: 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'assets/images/img${index + 1}.png',
                      ),
                    )),
              ],
            ),
          );
        },
        startConnectorBuilder: (context, index) {
          if (index != 0)
            return Connector.dashedLine(
              color: sessions![index].isCompleted
                  ? Colors.blue
                  : Color(0xff4e4e4e),
              dash: 4,
              gap: 4,
            );
        },
        endConnectorBuilder: (context, index) {
          if (index != sessions!.length - 1)
            return Connector.dashedLine(
              dash: 4,
              gap: 4,
              color: sessions![index].isCompleted
                  ? Colors.blue
                  : Color(0xff4e4e4e),
            );
        },
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

//custom indicator for list
class ListIndicator extends StatelessWidget {
  const ListIndicator({Key? key, this.isCompleted}) : super(key: key);

  final bool? isCompleted;

  @override
  Widget build(BuildContext context) {
    return DotIndicator(
      color: isCompleted! ? Colors.blue : Colors.transparent,
      border: isCompleted!
          ? Border.all(width: 2, color: Colors.transparent)
          : Border.all(width: 2, color: Color(0xff4e4e4e)),
      child: Container(
        height: 24,
        width: 24,
        child: isCompleted!
            ? Icon(
                Icons.check,
                color: Colors.white,
              )
            : Container(
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Color(0xff4e4e4e), shape: BoxShape.circle),
              ),
      ),
    );
  }
}
