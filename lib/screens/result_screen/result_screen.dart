import 'package:d_chart/bar_custom/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'generate_endorsement_pdf.dart';

class ResultController extends GetxController {
  // Your controller logic here
}

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ResultController>(
      init: ResultController(), // Initialize the controller if needed
      builder: (controller) {
        return Scaffold(
          body: Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(width: 2.0, color: Color(0xFF000000)),
                left: BorderSide(width: 2.0, color: Color(0xFF000000)),
                right: BorderSide(width: 2.0, color: Color(0xFF000000)),
                bottom: BorderSide(width: 2.0, color: Color(0xFF000000)),
              ),
              gradient: LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                colors: [
                  Color(0xFFEFFFFF),
                  Color(0xFFA6E3E9),
                ],
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height * 0.1,
                    margin: const EdgeInsets.all(20),
                    padding: const EdgeInsets.all(0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "تقرير عن : اسم الأزمة",
                        style: TextStyle(fontSize: 20, fontFamily: 'Roboto'),
                        textDirection: TextDirection.ltr,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(20),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          textDirection: TextDirection.ltr,
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.all(10),
                                    padding: const EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: AspectRatio(
                                      aspectRatio: 2,
                                      child: DChartBarCustom(
                                        spaceDomainLinetoChart: 1,
                                        spaceBetweenItem: 0,
                                        valueAlign: Alignment.bottomCenter,
                                        radiusBar: BorderRadius.only(
                                          bottomRight: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                        ),
                                        showMeasureLine: true,
                                        showDomainLine: true,
                                        showDomainLabel: true,
                                        verticalDirection: false,
                                        showMeasureLabel: true,
                                        domainLineStyle: BorderSide(
                                          color: Colors.black,
                                          width: 2,
                                        ),
                                        listData: [
                                          DChartBarDataCustom(
                                            showValue: true,
                                            valueStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            color: Colors.green,
                                            value: 60,
                                            label: 'ايجابيه',
                                          ),
                                          DChartBarDataCustom(
                                            showValue: true,
                                            valueStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            color: Colors.yellow,
                                            value: 30,
                                            label: 'محايده',
                                          ),
                                          DChartBarDataCustom(
                                            showValue: true,
                                            valueStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            color: Colors.red,
                                            value: 10,
                                            label: 'سلبيه',
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.all(10),
                                    padding: const EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: AspectRatio(
                                      aspectRatio: 2,
                                      child: DChartBarCustom(
                                        spaceDomainLinetoChart: 1,
                                        spaceBetweenItem: 0,
                                        valueAlign: Alignment.bottomCenter,
                                        radiusBar: BorderRadius.only(
                                          bottomRight: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                        ),
                                        showMeasureLine: true,
                                        showDomainLine: true,
                                        showDomainLabel: true,
                                        verticalDirection: false,
                                        showMeasureLabel: true,
                                        domainLineStyle: BorderSide(
                                          color: Colors.black,
                                          width: 2,
                                        ),
                                        listData: [
                                          DChartBarDataCustom(
                                            showValue: true,
                                            valueStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            color: Colors.green,
                                            value: 60,
                                            label: 'ايجابيه',
                                          ),
                                          DChartBarDataCustom(
                                            showValue: true,
                                            valueStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            color: Colors.yellow,
                                            value: 30,
                                            label: 'محايده',
                                          ),
                                          DChartBarDataCustom(
                                            showValue: true,
                                            valueStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            color: Colors.red,
                                            value: 10,
                                            label: 'سلبيه',
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(20),
                                child: SelectableText(
                                  " تطوير القدرات الأمنية والعسكرية لمصر من خلال التعاون الفني والتدريب المشترك مع دول البريكس. تطوير القدرات الأمنية والعسكرية لمصر من خلال التعاون الفني والتدريب المشترك مع دول البريكس. تطوير القدرات الأمنية والعسكرية لمصر من خلال التعاون الفني والتدريب المشترك مع دول البريكس. تطوير القدرات الأمنية والعسكرية لمصر من خلال التعاون الفني والتدريب المشترك مع دول البريكس. تطوير القدرات الأمنية والعسكرية لمصر من خلال التعاون الفني والتدريب المشترك مع دول البريكس. تطوير القدرات الأمنية والعسكرية لمصر من خلال التعاون الفني والتدريب المشترك مع دول البريكس. تطوير القدرات الأمنية والعسكرية لمصر من خلال التعاون الفني والتدريب المشترك مع دول البريكس. تطوير القدرات الأمنية والعسكرية لمصر من خلال التعاون الفني والتدريب المشترك مع دول البريكس. تطوير القدرات الأمنية والعسكرية لمصر من خلال التعاون الفني والتدريب المشترك مع دول البريكس. تطوير القدرات الأمنية والعسكرية لمصر من خلال التعاون الفني والتدريب المشترك مع دول البريكس. تطوير القدرات الأمنية والعسكرية لمصر من خلال التعاون الفني والتدريب المشترك مع دول البريكس. تطوير القدرات الأمنية والعسكرية لمصر من خلال التعاون الفني والتدريب المشترك مع دول البريكس.",
                                  style:
                                      TextStyle(fontSize: 30, fontFamily: 'Roboto'),
                                  textAlign: TextAlign.right,
                                  textDirection: TextDirection.rtl,
                                ),
                              ),
                            ),
                          ],
                        ),
                        ElevatedButton(
                            onPressed: () async {
                              await generateEndorsementPdf(financeItem: Survey());
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),


                              primary: Colors.black,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 20),
                            ),
                            child: Text(
                              "تحميل التقرير",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
