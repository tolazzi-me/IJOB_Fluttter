import 'package:flutter/material.dart';

class JobCard extends StatefulWidget {
  final title;
  final description;
  final urlImage;

  const JobCard({
    Key? key,
    required this.title,
    required this.description,
    required this.urlImage,
  }) : super(key: key);

  @override
  State<JobCard> createState() => _JobCardState();
}

class _JobCardState extends State<JobCard> {
  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 1),
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            image: DecorationImage(
                image: NetworkImage(widget.urlImage), fit: BoxFit.fill)),
        height: 570,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Container(
              height: 130,
              width: 220,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.75),
                  borderRadius:
                      const BorderRadius.only(topLeft: Radius.circular(15))),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Fotografo', style: TextStyle(fontSize: 25)),
                    SizedBox(height: 10),
                    Text('Procura-se fotografo para casamento',
                        style: TextStyle(fontSize: 15))
                  ],
                ),
              ),
            ),
          ),
        ),
      );

  Widget buildCard() => ClipRRect(
        child: Container(
          margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 1),
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              image: DecorationImage(
                  image: NetworkImage(widget.urlImage), fit: BoxFit.fill)),
          height: 570,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                height: 130,
                width: 220,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.75),
                    borderRadius:
                        const BorderRadius.only(topLeft: Radius.circular(15))),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Fotografo', style: TextStyle(fontSize: 25)),
                      SizedBox(height: 10),
                      Text('Procura-se fotografo para casamento',
                          style: TextStyle(fontSize: 15))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
