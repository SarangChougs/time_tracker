import 'package:excel/excel.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

void exportToExcel(List<Map<String, dynamic>> data) async {
  var excel = Excel.createExcel();
  Sheet sheetObject = excel['Worktime Logs'];
  List<CellValue?> categories = [
    TextCellValue("Category"),
    TextCellValue('Start Time'),
    TextCellValue('End Time'),
    TextCellValue('Comments')
  ];
  sheetObject.appendRow(categories);

  for (var row in data) {
    sheetObject.appendRow(
        [row['category'], row['start_time'], row['end_time'], row['comments']]);
  }

  var fileBytes = excel.save();
  saveExcel(fileBytes);
}

saveExcel(dynamic selectedExcel) async {
  final directory = await getApplicationDocumentsDirectory();
  String filePath = '${directory.path}/worktime_report.xlsx';
  File file = File((filePath));
  if (await file.exists()) {
    if (kDebugMode) {
      print("File exist");
    }
    // ignore: body_might_complete_normally_catch_error
    await file.delete().catchError((e) {
      if (kDebugMode) {
        print(e);
      }
    });
  }
  selectedExcel.encode().then((onValue) {
    file
      ..createSync(recursive: true)
      ..writeAsBytesSync(onValue);
  });
}
