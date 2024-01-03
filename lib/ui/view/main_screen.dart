import 'package:flutter/material.dart';

import '../view_model/main_screen_view_model.dart';
import '../widgets/search_bar_widget.dart';
import 'image_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final MainScreenViewModel _viewModel;

  _MainScreenState() : _viewModel = MainScreenViewModel();

  GridView _buildGridView() => GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 32.0,
          mainAxisSpacing: 32.0,
        ),
        itemCount: _viewModel.images.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) =>
                    ImageScreen(imageUrl: _viewModel.images[index].imageUrl),
              )),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24.0),
            child: Image.network(
              _viewModel.images[index].previewUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
      );

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
                  await _viewModel.searchImages(query: text);
                },
              ),
              const SizedBox(height: 32.0),
              Expanded(
                child: StreamBuilder(
                  stream: _viewModel.isLoaded,
                  builder: (context, snapshot) => (snapshot.hasData &&
                          snapshot.data != null &&
                          snapshot.data == true)
                      ? _viewModel.images.isNotEmpty
                          ? _buildGridView()
                          : const Center(child: Text('No results'))
                      : const Center(child: CircularProgressIndicator()),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
