import 'dart:convert';
import 'dart:typed_data';
import 'dart:html' as html;
import 'package:flutter/foundation.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/services.dart' show ByteData, rootBundle;
import 'package:flutter_easyloading/flutter_easyloading.dart';
class Survey {
  String? surveyName;
  String? result;
}

Future<ByteData> _readFontData() async {
  final ByteData bytes = await rootBundle.load('assets/fonts/Cairo-Regular.ttf');
  return bytes;
}

Future<void> generateEndorsementPdf({required Survey financeItem}) async {
  final pw.TtfFont font = pw.TtfFont(await _readFontData());
  final pw.TextStyle headerTextStyle = pw.TextStyle(
    font: font,
    fontSize: 30,
    color: PdfColors.black,
    lineSpacing: 2,
  );
  final pw.TextStyle mainTextStyle = pw.TextStyle(
    font: font,
    fontSize: 14,
    color: PdfColors.black,
  );

  final pw.TextStyle subTextStyle =
  pw.TextStyle(font: font, fontSize: 25, color: PdfColors.red);
  final pdf = pw.Document();

  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      textDirection: pw.TextDirection.rtl,
      margin: const pw.EdgeInsets.all(10),
      build: (pw.Context context) => pw.Padding(
        padding: const pw.EdgeInsets.all(5),
        child: pw.Container(
          decoration: pw.BoxDecoration(
            border: pw.Border.all(
              color: PdfColors.black,
              width: 2,
            ),
          ),
          child: pw.Column(
            mainAxisAlignment: pw.MainAxisAlignment.start,
            crossAxisAlignment: pw.CrossAxisAlignment.stretch,
            children: [
              pw.Align(
                alignment: pw.Alignment.center,
                child: pw.Text("تقرير عن :", style: headerTextStyle),
              ),
              pw.Padding(padding: const pw.EdgeInsets.all(10)),
              pw.Container(
                padding: const pw.EdgeInsets.all(10),
                child: pw.Text(
                  "- تطوير القدرات الأمنية والعسكرية لمصر من خلال التعاون الفني والتدريب المشترك مع دول البريكس.",
                  style: mainTextStyle,
                ),
              ),
              pw.Container(
                height: 200,
                margin: pw.EdgeInsets.all(10),
                padding: const pw.EdgeInsets.all(20),
                decoration: pw.BoxDecoration(
                  borderRadius: pw.BorderRadius.circular(10),
                  border: pw.Border.all(
                    color: PdfColors.black,
                    width: 2,

                  ),
                ),
                child: pw.AspectRatio(
                  aspectRatio: 12,
                  child: pw.Chart(

                    grid: pw.CartesianGrid(
                      xAxis: pw.FixedAxis.fromStrings(
                        List.generate(4, (index) => (index ).toString()),
                      ),
                      yAxis: pw.FixedAxis.fromStrings(
                        List.generate(10, (index) => (index + 1).toString()),
                      ),

                  ), datasets: [
                    pw.BarDataSet(
                      color: PdfColors.green,
                      legend: "ايجابيه",

                      width: 20,
                      offset: -5,
                      drawSurface: true,
                      drawBorder: true,
                      data: List.generate(
                        3,
                            (index) => pw.PointChartValue(
                          1,10,
                            ),

                      )
                    ),
                    pw.BarDataSet(
                      color: PdfColors.red,
                      legend: "سلبيه",
                      width: 20,
                      offset: -5,
                      drawSurface: true,
                      data: List.generate(
                        2,
                            (index) => pw.PointChartValue(2,3),
                      ),
                    ),
                    pw.BarDataSet(
                      color: PdfColors.yellow,
                      legend: "محايده",
                      width: 20,
                      offset: -5,
                      drawSurface: true,
                      data: List.generate(
                        1,
                            (index) => pw.PointChartValue(3,5),
                      ),
                    ),

                  ],
                  ),
                ),
              ),
              pw.Spacer(),
              pw.Container(
                padding: const pw.EdgeInsets.all(10),
                child: pw.Text("التوقيع/", style: subTextStyle),
              ),
            ],
          ),
        ),
      ),
    ),
  );

  final Uint8List bytes = await pdf.save();

  // Save and dispose of the PDF document
  final pdfData = base64Encode(bytes);

  // For web, create a download link
  if (kIsWeb) {
    final blob =
    html.Blob([Uint8List.fromList(bytes)], 'application/pdf');
    final url = html.Url.createObjectUrlFromBlob(blob);
    final anchor = html.AnchorElement(href: url)
      ..target = 'blank'
      ..download = 'endorsement.pdf';

    html.document.body?.children.add(anchor);
    anchor.click();
    html.Url.revokeObjectUrl(url);
    anchor.remove();
  } else {
    // For non-web platforms, save and open the file
    saveAndLaunchFile(bytes, "endorsement.pdf");
  }

  EasyLoading.showSuccess("تم التحميل بنجاح");
}

Future<void> saveAndLaunchFile(
    Uint8List bytes, String fileName) async {
  if (kIsWeb) {
    // For web, use the same logic as in generateEndorsementPdf for web
    final blob =
    html.Blob([Uint8List.fromList(bytes)], 'application/pdf');
    final url = html.Url.createObjectUrlFromBlob(blob);
    final anchor = html.AnchorElement(href: url)
      ..target = 'pdfData'
      ..download = fileName;
    html.document.body?.children.add(anchor);
    anchor.click();
    html.Url.revokeObjectUrl(url);
    anchor.remove();
  } else {
    // For non-web platforms, you can use the OpenFile package or any other appropriate method
    // Example using OpenFile package (add 'open_file: ^3.1.3' to pubspec.yaml)
    // await OpenFile.open(Uint8List.fromList(bytes), type: 'application/pdf', uti: 'public.pdf', name: fileName);
    // Adjust the open_file usage based on the specifics of your project.
  }
}
