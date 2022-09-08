import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

Widget connectionerror() {
  return Container(
    padding: EdgeInsets.all(16),
    child: Text('connection error???'),
  );
}

Widget error(var Error) {
  return Container(
    padding: EdgeInsets.all(16),
    child: Text(Error.toString()),
  );
}

Widget nodata() {
  return Container(
    padding: EdgeInsets.all(16),
    child: Text('no data avaliable'),
  );
}

Widget loading() {
  return Container(
    padding: EdgeInsets.only(top: 16, bottom: 16),
    child: Center(
      child: CircularProgressIndicator(),
    ),
  );
}

String writendatetime(String datetime) {
  Duration timeagoo = DateTime.now().difference(DateTime.parse(datetime));
  DateTime thedifrence = DateTime.now().subtract(timeagoo);
  return timeago.format(thedifrence);
}
