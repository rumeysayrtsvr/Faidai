import 'package:first_app/test.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Egitim1 extends StatelessWidget {
  const Egitim1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.close_outlined),
            iconSize: 50,
            color: HexColor("#FF003E"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'Burn',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold), // Yeni eklenen kısım
                  textAlign: TextAlign.center, // Yeni eklenen kısım
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Tissue deterioration caused by exposure to various physical and caustic chemical agents such as fire, radiation, hot objects, etc. is called burn.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              _buildSubtitle('1st degree burns'),
              _buildList([
                'There is tissue damage on the surface of the skin, visible as redness (pink to red color). ',
                'It is painful. ',
                'There is slight swelling in the burned area. ',
                'It usually heals spontaneously within 48 hours',
              ]),
              _buildSubtitle('2nd degree burns'),
              _buildList([
                'All layers of the skin are affected. ',
                'Muscles, nerves, veins can be affected. ',
                'It is very painful.',
              ]),
              _buildSubtitle('3rd degree burns '),
              _buildList([
                'All layers of the skin are affected. ',
                'Muscles, nerves, veins can be affected. ',
                'There are stages from white dry wound to black color in the burned area. ',
                'It is painless because all nerves are damaged.',
              ]),
              _buildSubtitle('The negative effects of burns on the body'),
              _buildList([
                'Depending on its depth, extent and location, it causes dysfunction in organs and systems. ',
                'Shock occurs due to pain and fluid loss. ',
                'There is a risk of infection with microbes and toxins in the patients or injured persons own body.',
              ]),
              _buildSubtitle('First aid for thermal burns'),
              _buildList([
                'The patient or injured person is wrapped with a wet blanket etc. or rolled to stop the burning. ',
                'Airway patency and respiration (AB) of the patient or injured person are evaluated.',
                'If the burn is not very extensive, the burned area is kept under unpressurized and plenty of cold water for at least 20 minutes. ',
                'Clothes in the burned area are removed (if the clothing is adhered to the burned area, it should be cut off around it). ',
                'Clean the burned area carefully with soapy water. ',
                'Water collecting places are not blown out. ',
                'Burned areas (such as hands, feet) are not bandaged together. ',
                'Cover the burn with a clean and damp cloth, do not apply any substance on the burn. ',
                'If the burned body area is large and the health institution is far away, if there is no vomiting, if consciousness is clear; the patient or injured person is given prepared liquid (1 lt. water + 1 teaspoon of baking soda + 1 teaspoon of salt), mineral water, etc. to drink in order to eliminate fluid loss. ',
                'Medical assistance is requested.',
              ]),
              _buildSubtitle('First aid in chemical burns'),
              _buildList([
                ' Clothes in the burned area are removed and contact of the chemical substance with the skin is stopped. ',
                'The burned area is washed with plenty of unpressurized running water for at least 20-25 minutes. ',
                'The patient or injured person is covered with a blanket etc. ',
                'Medical assistance is requested.',
              ]),
              _buildSubtitle('First aid for electrical burns '),
              _buildList([
                'Remain as cool and calm as possible. '
                    'Disconnect the electric current before touching the sick or injured person. ',
                'If it is not possible to cut the current, an insulating material (wood, plastic) prevents the person from contact with electricity. ',
                'The patient or injured persons airway patency and breathing should be evaluated. ',
                'The patient or injured person should not be moved. ',
                'The damaged body area is covered. ',
                'Medical assistance is requested even if the patient or injured person is conscious and feels well.',
              ]),
              _buildSubtitle('First aid in heat stroke '),
              _buildList([
                'The patient is taken to a cool and airy place. ',
                'The patients clothes are removed. ',
                'The patient is placed on his/her back and arms and legs are raised. ',
                'If there is no nausea and consciousness is clear, the patient is given a liquid prepared with water, salt, baking soda or mineral water to replace water and salt loss.',
              ]),
              Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      minimumSize: const Size(348, 52),
                      backgroundColor: HexColor("#FF003E"),
                      elevation: 0,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyQuizPage()));
                    },
                    child: Text(
                      "Solve The Test",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: HexColor("#e6e8ed"),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSubtitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildList(List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items
          .map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: Text('• $item'),
            ),
          )
          .toList(),
    );
  }
}
