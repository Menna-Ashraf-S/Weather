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
            print(snapshot.data) ;
            return  Container(
        width:double.infinity , height: double.infinity,
        decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment(0, -1.0),
          end: Alignment(0, 0),
          colors: [  Color.fromARGB(255, 54, 139, 231) ,Color.fromARGB(255, 62, 103, 179),
          Color.fromARGB(255, 63, 94, 197) ,
          ],
          ),
          ),
          child:
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

                    Image.network('http://openweathermap.org/img/wn/${snapshot.data!.listData!.first.weather!.first.icon}@2x.png'),

                    SizedBox(height: 15,),

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

    
                      
                     SizedBox(height: 150,),
                    Padding(
                      padding: const EdgeInsets.only(left:3 ,right: 1),
                      child: SizedBox( height: 200,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5 ,
                          itemBuilder: ((context, index) {
                          return Row(
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                 
                               Text(DateFormat.E().format(DateTime.parse(snapshot.data!.listData!.elementAt(index*8).dt_txt.toString())),
                               style: TextStyle(
                                color: Colors.grey , fontSize: 15 , fontWeight: FontWeight.w500 ,
                               ),) ,

                               Image.network('http://openweathermap.org/img/wn/${snapshot.data!.listData!.elementAt(index*8).weather!.first.icon}@2x.png',height: 75 ,width: 75,),
                                    
                               Text('${((snapshot.data!.listData!.elementAt(index*8).mainWeather!.temp)!-273.15).round()}\u00B0',
                               style: TextStyle(
                                color: Colors.white , fontSize: 20 ,fontWeight: FontWeight.w500 ,
                               ),)

                              
                              ],),
                              
                            ],
                          );
                        })
                        ),
                      ),
                    )  ,  

                ],
                ),
                )
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
  

  
	