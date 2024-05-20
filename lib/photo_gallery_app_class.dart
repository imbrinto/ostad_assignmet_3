import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:ostad_assigment_3/create_image_details_screen.dart';
import 'package:ostad_assigment_3/image_model.dart';

class PhotoGallery extends StatefulWidget {
  const PhotoGallery({super.key});

  @override
  State<PhotoGallery> createState() => _PhotoGalleryState();
}

class _PhotoGalleryState extends State<PhotoGallery> {
  bool getImageListInProgress = false;
  List<dynamic> imageList = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Photo Gallery App',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          fetchData();
        },
        child: Visibility(
          visible: getImageListInProgress == false,
          replacement: const Center(
            child: CircularProgressIndicator(),
          ),
          child: ListView.builder(
            itemCount: imageList.length,
            itemBuilder: (context, index) {
              // final imageDetails = imageList[index];
              return buildImageView(imageList[index]);
            },
          ),
        ),
      ),
    );
  }

  Widget buildImageView(ImageModel imageModel) {
    return Wrap(children: [
      ListTile(
        leading: Image.network(imageModel.thumbnailUrl ?? 'Unknown'),
        title: Text(imageModel.title ?? 'Unknown'),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  CreateImageDetailsScreen(imageModel: imageModel),
            ),
          );
        },
      ),
    ]);
  }

  Future<void> fetchData() async {
    getImageListInProgress = true;

    setState(() {});

    Uri getImageApiUrl =
        Uri.parse('https://jsonplaceholder.typicode.com/photos');
    Response response = await get(getImageApiUrl);

    imageList.clear();

    if (response.statusCode == 200) {
      //json decode and get list
      List<dynamic> jsonImageList = jsonDecode(response.body);
      //loop inside the list
      for (Map<String, dynamic> json in jsonImageList) {
        ImageModel imageModel = ImageModel.fromJson(json);
        imageList.add(imageModel);
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to get image data...'),
        ),
      );
    }

    getImageListInProgress = false;

    setState(() {});
  }
}
