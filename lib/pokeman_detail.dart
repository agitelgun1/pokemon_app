import 'package:flutter/material.dart';
import 'package:pokeman/pokeman.dart';

class PokemanDetail extends StatelessWidget {
  final Pokemon pokemon;
  const PokemanDetail({this.pokemon});

  bodyWidget(BuildContext context) => Stack(
        children: [
          Positioned(
            height: MediaQuery.of(context).size.height / 1.5,
            width: MediaQuery.of(context).size.width - 20,
            left: 10.0,
            top: MediaQuery.of(context).size.height * 0.1,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 50.0,
                  ),
                  Text(
                    pokemon.name,
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  Text("Height : ${pokemon.height}"),
                  Text("Height : ${pokemon.weight}"),
                  Text(
                    "Types",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.type
                        ?.map((type) => FilterChip(
                              backgroundColor: Colors.amber,
                              label: Text(type),
                              onSelected: (b) {},
                            ))
                        ?.toList()?? [],
                  ),
                  Text(
                    'Weekaness',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.weaknesses
                        ?.map((weaknesses) => FilterChip(
                              backgroundColor: Colors.red,
                              onSelected: (b) {},
                              label: Text(
                                weaknesses,
                                style: TextStyle(color: Colors.white),
                              ),
                            ))
                        ?.toList()?? [],
                  ),
                  Text(
                    "Nex Evolution",
                    style:
                        TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.nextEvolution
                        ?.map((nextEvolution) => FilterChip(
                              backgroundColor: Colors.green,
                              label: Text(
                                nextEvolution.name,
                                style: TextStyle(color: Colors.white),
                              ),
                              onSelected: (b) {},
                            ))
                        ?.toList()?? [],
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Hero(
              tag: pokemon.img,
              child: Container(
                height: 150.0,
                width: 150.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(pokemon.img),
                )),
              ),
            ),
          )
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        elevation: 0.0,
        title: Text(pokemon.name),
        backgroundColor: Colors.cyan,
      ),
      body: bodyWidget(context),
    );
  }
}
