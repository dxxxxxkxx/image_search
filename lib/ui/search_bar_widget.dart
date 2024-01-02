import 'package:flutter/material.dart';

class SearchBarWidget extends StatefulWidget {
  final void Function(String text) _search;

  const SearchBarWidget({super.key, required void Function(String text) search})
      : _search = search;

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final TextEditingController _controller;
  final Color _color;

  _SearchBarWidgetState()
      : _controller = TextEditingController(),
        _color = const Color(0xFF4FB6B2);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      controller: _controller,
      side: MaterialStatePropertyAll(BorderSide(width: 2.0, color: _color)),
      shape: MaterialStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
      elevation: const MaterialStatePropertyAll(0.0),
      hintText: 'Search',
      trailing: [
        IconButton(
          onPressed: () {
            widget._search(_controller.text);
          },
          icon: Icon(Icons.search, color: _color),
        )
      ],
    );
  }
}
