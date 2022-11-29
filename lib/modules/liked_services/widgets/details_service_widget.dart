import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/model/service_model.dart';

class DetailsServiceWidget extends StatelessWidget {
  final Service service;
  const DetailsServiceWidget({Key? key, required this.service}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Detalhes do serviço',
          style: TextStyle(fontSize: 30, color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 1),
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          image: DecorationImage(
            image: NetworkImage(
              service.servicePhotos!.isEmpty
                  ? "https://firebasestorage.googleapis.com/v0/b/ijob-bfe21.appspot.com/o/sem-imagem.png?alt=media&token=afc9df2c-08dc-4556-9e18-fe9dd69cb6e1"
                  : service.servicePhotos![0].url,
            ),
            fit: BoxFit.cover,
          ),
        ),
        height: 450,
        width: Get.size.width * 0.95,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Container(
              height: 130,
              width: 220,
              decoration: BoxDecoration(color: Colors.white.withOpacity(0.75), borderRadius: const BorderRadius.only(topLeft: Radius.circular(15))),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(service.title, style: const TextStyle(fontSize: 25)),
                    const SizedBox(height: 10),
                    Text(service.description, style: const TextStyle(fontSize: 15))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
