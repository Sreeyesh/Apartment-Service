import 'package:apartment_service/controller/user_dashboard_controller.dart';
import 'package:apartment_service/models/service_request.dart';
import 'package:apartment_service/widgets/appbar_image.dart';
import 'package:apartment_service/widgets/indicator.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class UserDashboard extends StatefulWidget {
  @override
  _UserDashboardState createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  int touchedIndex = 0;
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: AssetImage(
                  'assets/images/profile.jpg',
                ),
              ),
              Text("Nasu Apartment Service System")
            ],
          ),
          backgroundColor: Colors.indigo[900],
          centerTitle: true,
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Add your onPressed code here!
          },
          child: const Icon(Icons.add),
          backgroundColor: Colors.indigo[900],
        ),
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            AppBarImage(),
            Positioned(
              bottom: 10,
              child: Container(
                height: MediaQuery.of(context).size.height / 2 - 95,
                width: MediaQuery.of(context).size.width,
                child: buildListView(touchedIndex),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                margin: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(200),
                    topRight: Radius.circular(200),
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 0,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2 - 115,
                      child: PieChart(
                        PieChartData(
                          pieTouchData:
                              PieTouchData(touchCallback: (pieTouchResponse) {
                            setState(() {
                              final desiredTouch = pieTouchResponse.touchInput
                                  is! PointerUpEvent;
                              if (desiredTouch &&
                                  pieTouchResponse.touchedSection != null) {
                                touchedIndex = pieTouchResponse
                                    .touchedSection.touchedSectionIndex;
                              } else {
                                touchedIndex = touchedIndex;
                              }
                            });
                          }),
                          borderData: FlBorderData(
                            show: false,
                          ),
                          sectionsSpace: 5,
                          centerSpaceRadius: 40,
                          sections: DashboardData.getSectionData(touchedIndex),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 5,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Indicator(
                                color: DashboardData.colorList[0],
                                text: 'New',
                                isSquare: true,
                              ),
                              Indicator(
                                color: DashboardData.colorList[1],
                                text: 'Pending',
                                isSquare: true,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 15,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Indicator(
                                color: DashboardData.colorList[2],
                                text: 'Cancelled',
                                isSquare: true,
                              ),
                              Indicator(
                                color: DashboardData.colorList[3],
                                text: 'Success',
                                isSquare: true,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );

  ListView buildListView(int selIdx) {
    List<ServiceRequest> y = ServiceRequest.allStatusData(selIdx);
    return ListView.builder(
      itemCount: y.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 12),
          child: Card(
            color: Colors.white.withOpacity(0.9),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: SizedBox(
                height: 100,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 0.1,
                      child: Container(
                        decoration: BoxDecoration(
                            color: DashboardData.colorList[y[index].status]),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20.0, 0.0, 2.0, 0.0),
                        child: _ArticleDescription(
                          title: y[index].title,
                          description: y[index].description,
                          loggedDate: y[index].logDate.toString(),
                          rectifiedDate: y[index].endDate.toString(),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _ArticleDescription extends StatelessWidget {
  const _ArticleDescription({
    Key key,
    this.title,
    this.description,
    this.loggedDate,
    this.rectifiedDate,
  }) : super(key: key);

  final String title;
  final String description;
  final String loggedDate;
  final String rectifiedDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 2.0)),
              Text(
                description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                children: [
                  Text(
                    'Logged Date : ',
                    style: const TextStyle(
                      fontSize: 12.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '$loggedDate',
                    style: const TextStyle(
                      fontSize: 12.0,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Rectified Date : ',
                    style: const TextStyle(
                      fontSize: 12.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '$rectifiedDate',
                    style: const TextStyle(
                      fontSize: 12.0,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
