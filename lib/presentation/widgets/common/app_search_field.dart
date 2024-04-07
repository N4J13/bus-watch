import 'package:bus_proj/bloc/bus_bloc.dart';
import 'package:bus_proj/utils/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:searchfield/searchfield.dart';

class AppSearchField extends StatefulWidget {
  final BusBloc bloc;
  final TextEditingController controller;
  final PhosphorIcon prefixIcon;
  final Function(String?)? validator;
  final String hintText;
  const AppSearchField({
    super.key,
    required this.bloc,
    required this.controller,
    required this.prefixIcon,
    required this.hintText,
    required this.validator,
  });

  @override
  State<AppSearchField> createState() => _AppSearchFieldState();
}

class _AppSearchFieldState extends State<AppSearchField> {
  late FocusNode _focusNode;
  List<String> _stations = [];

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    loadStations().then((stations) {
      setState(() {
        _stations = stations;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return SearchField(
      controller: widget.controller,
      autoCorrect: true,
      autofocus: false,
      focusNode: _focusNode,
      maxSuggestionsInViewPort: 3,
      marginColor: Colors.transparent,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      suggestionsDecoration: SuggestionDecoration(
        padding: const EdgeInsets.all(4),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      searchInputDecoration: InputDecoration(
        hintText: widget.hintText,
        border: InputBorder.none,
        prefixIcon: widget.prefixIcon,
      ),
      onSuggestionTap: (v) {
        _focusNode.unfocus();
      },
      offset: const Offset(0, 50),
      validator: (value) =>
          widget.validator != null ? widget.validator!(value) : null,
      itemHeight: screenHeight * 0.05,
      scrollbarDecoration: ScrollbarDecoration(
        radius: const Radius.circular(10),
        thickness: 3,
        thumbColor: Theme.of(context).colorScheme.outline,
      ),
      suggestions: _stations
          .map((e) => SearchFieldListItem(e,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Text(
                  e,
                ),
              )))
          .toList(),
    );
  }
}
