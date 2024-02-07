import 'package:flutter/material.dart';
import 'package:weather/Models/weatherAPIModel.dart';
import 'API/weatherAPI.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String city = "mansura";
  final search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xffF0F2F6),
        body: FutureBuilder<weatherAPIModel>(
          future: WeatherAPI().featchData(city),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              weatherAPIModel data = snapshot.data!;
              double tempC = (data.list![0].main!.temp! - 273).ceilToDouble();
              double HtempC =
                  (data.list![0].main!.tempMax! - 273).ceilToDouble();
              double LtempC =
                  (data.list![0].main!.tempMin! - 273).ceilToDouble();
              return SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 15,),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(18)),
                          border: Border.all(
                              color:Colors.blue, width: 1.2)),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: search,
                              decoration: InputDecoration(
                                hintText: "City",
                                hintStyle: TextStyle(color: Colors.blueGrey[200]),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                city = search.text;
                              });
                            },
                            icon: Icon(
                              Icons.search,
                              color: Colors.blueGrey[100],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Expanded(flex: 1, child: SizedBox()),
                    Text(
                      data.city!.name!,
                      style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff1F487E)),
                    ),
                    const Expanded(flex: 1, child: SizedBox()),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [Color(0xffB0E1FF) ,Color(0xff76CBFF)]
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            height: 80,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "${tempC.round()}",
                                  style: const TextStyle(
                                      color: Color(0xff243E36),
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "H: ${HtempC.round()}   L: ${LtempC.round()}",
                                  style: const TextStyle(
                                      color: Color(0xff667C5C),
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                    height: 70,
                                    child: Image.asset(
                                        "images/${data.list![0].weather![0].icon}.png")),
                                Text(
                                  '${data.list![0].weather![0].description}',
                                  style:
                                      const TextStyle(color: Color(0xffF4F7F5), fontSize: 16 ,fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Expanded(flex: 5, child: SizedBox()),
                    // const Expanded(child: SizedBox()),
                    SizedBox(
                      height: 150,
                      child: ListView.builder(
                          itemCount: data.list!.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      contentPadding: const EdgeInsets.all(0.0),
                                      content: Container(
                                        height: 400,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 12),
                                        decoration: const BoxDecoration(
                                          gradient: LinearGradient(
                                              begin: Alignment.bottomRight,
                                              end: Alignment.topLeft,
                                              colors: [
                                                Colors.white,
                                                Colors.lightBlueAccent,
                                                Colors.blue
                                              ]),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(25)),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              DateFormat('EE h:mm a').format(
                                                  DateTime.parse(data
                                                      .list![index].dtTxt!)),
                                              style: const TextStyle(
                                                  color: Color(0xffEDF7F6),
                                                  fontSize: 26,
                                                  fontWeight: FontWeight.bold
                                              ),
                                            ),
                                            Image.asset(
                                                "images/${data.list![index].weather![0].icon}.png"),
                                            Text(
                                              '${data.list![0].weather![0].description}',
                                              style: const TextStyle(
                                                  color: Color(0xFFFDFFFC),
                                                  fontSize: 24),
                                            ),
                                            ListTile(
                                              leading: const Icon(Icons.thermostat_auto),
                                              iconColor: Colors.orangeAccent[100],
                                              title: Text('${data.list![index].main!.temp!.round() - 273}',
                                                style: const TextStyle(color: Color(0xffA30B37) ,fontSize: 20 ,fontWeight: FontWeight.w400)),
                                            ),
                                            ListTile(
                                              leading: const Icon(Icons.air),
                                              iconColor: Colors.grey,
                                              title: Text('${data.list![index].wind!.speed!.round()}',
                                                style: const TextStyle(color: Color(0xffD3F3EE) ,fontSize: 20 ,fontWeight: FontWeight.w400)),
                                            ),
                                            ListTile(
                                              leading: const Icon(Icons.cloud),
                                              iconColor: const Color(0xffF8F7F9),
                                              title: Text('${data.list![index].clouds!.all}',
                                                style: const TextStyle(color: Color(0xff111D4A) ,fontSize: 20 ,fontWeight: FontWeight.w400)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Container(
                                width: 120,
                                height: 300,
                                margin: const EdgeInsets.all(8),
                                decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.centerRight,
                                      colors: [Color(0xffB0E1FF) ,Color(0xff76CBFF)]
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                child: Column(
                                  children: [
                                    const Expanded(child: SizedBox()),
                                    Text(
                                      DateFormat('EE h:mm a').format(
                                          DateTime.parse(
                                              data.list![index].dtTxt!)),
                                      style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(
                                        height: 80,
                                        child: Image.asset(
                                            "images/${data.list![index].weather![0].icon}.png")),
                                    Text(
                                        '${data.list![index].main!.temp!.round() - 273}',
                                        style: const TextStyle(
                                            color: Color(0xff031927))),
                                    const Expanded(child: SizedBox()),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                    const Expanded(flex: 1, child: SizedBox()),
                  ],
                ),
              );
            }
            if (snapshot.hasError) {
              print('Error : ${snapshot.error}');
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
