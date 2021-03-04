import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:progIV_BII/app_controller.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() {
    return HomePageState();
  }
}

Future<void> _showMyDialog(context, data) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Dados do Shinobi ${data[0]}'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Nome: ${data[0]}'),
              Text("Jutsu mais brabo: ${data[1]}"),
              Text("Data de nascimento: ${data[2]}"),
              Text("Rival mortal: ${data[3]}"),
              Text("Nível em Ninjutsu: ${data[4]}"),
              Text("Nível em Taijutsu: ${data[5]}"),
              Text("Nível em Genjutsu: ${data[6]}"),
              Text("Entitulação: ${data[7]}"),
              Text("Está morto? ${data[8]}"),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text(
              'Beleza!',
              style: TextStyle(color: Colors.green),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

class HomePageState extends State<HomePage> {
  bool isDead = false;
  String name;
  String strongestJutsu;
  String birthDate;
  String deadlyRival;
  String ninjutsuPower;
  String taijutsuPower;
  String genjutsuPower;
  String entitlement;
  String clan;

  String getName() => name;
  void setName(value) => name = value;

  String getStrongestJutsu() => strongestJutsu;
  void setStrongestJutsu(value) => strongestJutsu = value;

  String getbirthDate() => birthDate;
  void setbirthDate(value) => birthDate = value;

  String getDeadlyRival() => deadlyRival;
  void setDeadlyRival(value) => deadlyRival = value;

  String getNinjutsuPower() => ninjutsuPower;
  void setNinjutsuPower(value) => ninjutsuPower = value;

  String getTaijutsuPowerr() => taijutsuPower;
  void setTaijutsuPower(value) => taijutsuPower = value;

  String getGenjutsuPower() => genjutsuPower;
  void setGenjutsuPower(value) => genjutsuPower = value;

  String getEntitlement() => entitlement;
  void setEntitlement(value) => entitlement = value;

  String getClan() => clan;
  void setClanr(value) => clan = value;

  bool getisDead() => isDead;
  void setisDead(value) => isDead = value;

  // Future get() async {
  //   var url = 'https://jsonplaceholder.typicode.com/todos';
  //   var response = await http.get(url);

  //   print(response.body);
  //   print(_counter);

  //   return jsonDecode(response.body);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "Nome do Shinobi",
                    border: OutlineInputBorder(),
                    labelText: "Nome",
                  ),
                  onChanged: (value) {
                    setState(() {
                      setName(value);
                    });
                  },
                ),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Jutsu mais brabo",
                    border: OutlineInputBorder(),
                    labelText: "Jutsu mais brabo",
                  ),
                  onChanged: (value) {
                    setState(() {
                      setStrongestJutsu(value);
                    });
                  },
                ),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    fillColor: Colors.purple,
                    hintText: "Data de nascimento",
                    border: OutlineInputBorder(),
                    labelText: "Data de nascimento",
                  ),
                  onChanged: (value) {
                    setState(() {
                      setbirthDate(value);
                    });
                  },
                ),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    fillColor: Colors.purple,
                    hintText: "Rival mortal",
                    border: OutlineInputBorder(),
                    labelText: "Rival mortal",
                  ),
                  onChanged: (value) {
                    setState(() {
                      setDeadlyRival(value);
                    });
                  },
                ),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Nível em Ninjutsu",
                    border: OutlineInputBorder(),
                    labelText: "Nível em Ninjutsu",
                  ),
                  onChanged: (value) {
                    setState(() {
                      setNinjutsuPower(value);
                    });
                  },
                ),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    fillColor: Colors.purple,
                    hintText: "Nível em Taijutsu",
                    border: OutlineInputBorder(),
                    labelText: "Nível em Taijutsu",
                  ),
                  onChanged: (value) {
                    setState(() {
                      setTaijutsuPower(value);
                    });
                  },
                ),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    fillColor: Colors.purple,
                    hintText: "Nível em Genjutsu",
                    border: OutlineInputBorder(),
                    labelText: "Nível em Genjutsu",
                  ),
                  onChanged: (value) {
                    setState(() {
                      setGenjutsuPower(value);
                    });
                  },
                ),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    fillColor: Colors.purple,
                    hintText: "Entitulação",
                    border: OutlineInputBorder(),
                    labelText: "Entitulação",
                  ),
                  onChanged: (value) {
                    setState(() {
                      setEntitlement(value);
                    });
                  },
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Switch(
                        value: isDead,
                        onChanged: (value) {
                          setState(() {
                            setisDead(value);
                          });
                        },
                      ),
                      Text("Está morto?")
                    ],
                  ),
                ),
                RaisedButton.icon(
                  onPressed: () {
                    print([
                      name,
                      strongestJutsu,
                      birthDate,
                      deadlyRival,
                      ninjutsuPower,
                      taijutsuPower,
                      genjutsuPower,
                      entitlement,
                      isDead
                    ]);

                    _showMyDialog(context, [
                      name,
                      strongestJutsu,
                      birthDate,
                      deadlyRival,
                      ninjutsuPower,
                      taijutsuPower,
                      genjutsuPower,
                      entitlement,
                      isDead
                    ]);
                  },
                  icon: Icon(Icons.add),
                  label: Text("Adicionar"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (Switch(
      value: AppController.instance.switchValue,
      onChanged: (value) {
        AppController.instance.changeSwitch();
      },
    ));
  }
}
