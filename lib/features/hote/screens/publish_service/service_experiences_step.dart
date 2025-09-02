import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking/widgets/custom_select_field.dart';
import 'package:hotel_booking/widgets/custom_text_field.dart';

class ServiceExperienceStep extends StatelessWidget
{
  TextStyle textStyle = TextStyle(
      color: Colors.grey
  );
  TextStyle headText = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
  );

  BoxDecoration boxDecoration = BoxDecoration(
      border: BoxBorder.all(color: Colors.grey),
      borderRadius: BorderRadius.all(Radius.circular(10))
      
  );
  EdgeInsets boxPadding = EdgeInsets.all(10);

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Parlez-nous un peu de vous',
              style: headText,
            ),
            _addressSection(),
            SizedBox(height: 20,),
            _serviceLocationSection(),
            SizedBox(height: 20,),
            _serviceZoneSection()
          ],
        ),
      ),
    );
  }

  Widget _addressSection()
  {
    return Container(
      padding: EdgeInsets.all(5),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Quelle est votre adresse résidentielle ?",
                  style: TextStyle(
                    fontSize: 20
                  ),
                ),
                Text("Quelle est votre adresse résidentielle ?",
                  style: textStyle,
                ),
              ],
            ),
          ),
          Container(
            padding: boxPadding,
            decoration: boxDecoration,
            child: Column(
              children: [
                SizedBox(height: 10,),
                CustomSelectField(label: "Pays/région")
              ],
            ),
          ),
          SizedBox(height: 15,),
          Container(
            decoration: boxDecoration,
            padding: boxPadding,
            child: Column(
              children: [
                CustomSelectField(label: "Numéro et libellé de voie"),
                CustomTextField(label: "Appartement, étape, immeuble (si applicable)"),
                CustomTextField(label: "Commune"),
                CustomTextField(label: "Province/Etat/Térritoire"),
                CustomTextField(label: "Code postal")
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _serviceLocationSection()
  {
    return Container(
      child: Column(
        children: [
          Text("Où les voyageurs doivent-ils vous trouver ?",
            style: headText,
          ),
          Text("Les voyageurs verront cette adresse  sur votre annonce.",
            style: textStyle,
          ),
          CustomTextField(label: "",hintText: "Saisir une adresse",),
          Row(
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.location_on_outlined)),
              Text("Utiliser ma position actuelle",
                style: TextStyle(
                  color: Colors.black,
                  fontStyle: FontStyle.italic
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _serviceZoneSection()
  {
    return Container(
      child: Column(
        children: [
          Text("Quelle est votre zone de service ?",
            style: headText,
          ),
          Container(
            padding: boxPadding,
            decoration: boxDecoration,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Vous pouvea ajouter plusieurs lieux.",
                  style: textStyle,
                ),
                CustomTextField(label: "",hintText: "Ville,quartier ou code postal",),
              ],
            ),
          )
        ],
      ),
    );
  }

}