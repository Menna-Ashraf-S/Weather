import 'package:flutter/material.dart';
import 'package:flutter_pro/model/allData.dart';
import 'package:flutter_pro/model/weather.dart';
import 'package:flutter_pro/network/api.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false ,
      
      home: Home(),
        
    );
  }
}

class Home  extends StatefulWidget {
 
  @override
  _HomeState  createState() => _HomeState();
  
}


class _HomeState extends State < Home > {

  DateTime dateTime = DateTime.now() ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Color.fromARGB(255, 62, 103, 179),
      body: FutureBuilder <AllData>
      (future: API.getWeather(),
        builder: ((context, snapshot) {
          if (snapshot.hasData){
            double  ? x = snapshot.data!.listData!.first.mainWeather!.temp ;
            double temperature = (x! - 273.15) ;
           // var y = snapshot.data!.listData!.where((element) => element.dt_txt!.startsWith(dateTime.year.toString()+'-'+dateTime.month.toString()+'-0'+(dateTime.day+1).toString()));
            print(snapshot.data) ;
          
            return 
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[

                  SizedBox(height: 200,),


                    Text('${snapshot.data!.city!.name}',
                    style: TextStyle(
                      fontSize: 30 ,  color: Colors.white  ,
                    ),
                    ),

                   // Image.network('${snapshot.data!.listData!.first.weather}.png'),

                    SizedBox(height: 25,),

                    Text('${temperature.toStringAsFixed(1)}' ,
                    style: TextStyle(
                      fontSize: 45 , color: Colors.white , fontWeight: FontWeight.w500 ,
                    ),
                    ),

                    Text('H:${(snapshot.data!.city!.coord!.lat!).round()} \u00B0 L: ${(snapshot.data!.city!.coord!.lon!).round()} \u00B0',
                    style: TextStyle(
                      color: Colors.white , fontSize: 15 ,
                    ),
                    ),


                    SizedBox(height: 200,),
                    Padding(
                      padding: const EdgeInsets.only(left:10 ,right: 10),
                      child: SizedBox( height: 100,
                        child: ListView.builder(
                          itemCount: 5 ,
                          itemBuilder: ((context, index) {
                          return Row(
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Text('${snapshot.data!.listData!.first.weather}')
                              //Text(DateFormat.E().format() ,
                              ],),
                              
                            ],
                          );
                        })
                        ),
                      ),
                    )  ,  

                ],),
                );
          }
          else if (snapshot.hasError){
            print(snapshot.error);
            return Center(child: Container(child: Text('${snapshot.error}'),));
          }
          return Center(child: CircularProgressIndicator(),);
        })),
    );

  }
  
  }
  

  
	