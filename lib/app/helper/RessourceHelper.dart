import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:palikorne/generated/l10n.dart';

class ResourceHelper {
  static String getTimePassedFromDate(String date, BuildContext context){
    var now = new DateTime.now();
    DateTime dateTime = DateFormat("yyyy-MM-dd'T'hh:mm:ss.SSS'Z'").parse(date);
    var deltaTime = now.difference(dateTime).inMinutes;
    String msg;
    if (deltaTime < 60) {
      msg = deltaTime > 1 ? S.of(context).articleDateInMinutes(deltaTime) : S.of(context).articleDateInMinute(deltaTime);
    } else if (deltaTime < 1440) {
      deltaTime = (deltaTime / 60).floor();
      msg = deltaTime > 1 ? S.of(context).articleDateInHours(deltaTime) : S.of(context).articleDateInHour(deltaTime);
    } else if (deltaTime < 43200) {
      deltaTime = (deltaTime / 1440).floor();
      msg = deltaTime > 1 ? S.of(context).articleDateInDays(deltaTime) : S.of(context).articleDateInDay(deltaTime);
    } else if (deltaTime < 525601) {
      deltaTime = (deltaTime / 43200).floor();
      msg = deltaTime > 1 ? S.of(context).articleDateInMonths(deltaTime) : S.of(context).articleDateInMonth(deltaTime);
    } else {
      deltaTime = (deltaTime / 525601).floor();
      msg = deltaTime > 1 ? S.of(context).articleDateInYears(deltaTime) : S.of(context).articleDateInYear(deltaTime);
    }
    return msg;
  }

  String removeAllHtmlTags(String htmlText) {
    RegExp exp = RegExp(
        r"<[^>]*>",
        multiLine: true,
        caseSensitive: true
    );

    return htmlText.replaceAll(exp, '');
  }
}