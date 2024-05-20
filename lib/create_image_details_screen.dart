import 'package:flutter/material.dart';
import 'package:ostad_assigment_3/image_model.dart';

class CreateImageDetailsScreen extends StatelessWidget {
  final ImageModel imageModel;
  const CreateImageDetailsScreen({super.key, required this.imageModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Photo Details", style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children:  [
              Container(
                height: 500,
                width: 500,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(imageModel.url ?? 'Image Not Found',),
                  )
                ),
              ),
              // const SizedBox(height: ,),
              Text('Title: ${imageModel.title}'),
              Text('ID: ${imageModel.id}'),
            ],
          ),
        ),
    );
  }
}
