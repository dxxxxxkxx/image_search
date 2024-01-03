import 'package:flutter/material.dart';

import '../data/image_dto.dart';
import '../data/image_mapper.dart';
import '../data/image_repository.dart';
import 'search_bar_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final ImageRepository _repository;
  List<ImageDto> _images;
  bool _isLoaded;

  _MainScreenState()
      : _repository = ImageRepository(),
        _images = [],
        _isLoaded = false;

  @override
  void initState() {
    super.initState();
    _initImages();
  }

  Future<void> _initImages() async {
    _images = await _repository.getImages();

    setState(() {
      _isLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: SafeArea(
          child: Column(
            children: [
              SearchBarWidget(
                search: (text) async {
                  setState(() {
                    _isLoaded = false;
                  });

                  _images = await _repository.getImages(query: text);

                  setState(() {
                    _isLoaded = true;
                  });
                },
              ),
              const SizedBox(height: 32.0),
              _isLoaded
                  ? Expanded(
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 32.0,
                          mainAxisSpacing: 32.0,
                        ),
                        itemCount: _images.length,
                        itemBuilder: (context, index) => ClipRRect(
                          borderRadius: BorderRadius.circular(24.0),
                          child: Image.network(
                            _images[index].toImageItem().urlSrc,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    )
                  : const Expanded(
                      child: Center(child: CircularProgressIndicator()),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
