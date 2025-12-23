import 'package:flutter/material.dart';

import 'map_theme.dart';
import 'place_suggestion.dart';

class MapSearchPanel extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final bool isSearching;
  final List<PlaceSuggestion> suggestions;
  final ValueChanged<String> onChanged;
  final ValueChanged<PlaceSuggestion> onSuggestionTap;

  const MapSearchPanel({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.isSearching,
    required this.suggestions,
    required this.onChanged,
    required this.onSuggestionTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Material(
          color: mapSurfaceColor,
          elevation: 6,
          borderRadius: BorderRadius.circular(16),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: mapBorderColor),
            ),
            child: TextField(
              controller: controller,
              focusNode: focusNode,
              onChanged: onChanged,
              textInputAction: TextInputAction.search,
              decoration: const InputDecoration(
                hintText: 'Search for a place',
                border: InputBorder.none,
                prefixIcon: Icon(Icons.search),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              ),
            ),
          ),
        ),
        if (isSearching || suggestions.isNotEmpty) const SizedBox(height: 8),
        if (isSearching) const _SearchLoading(),
        if (!isSearching && suggestions.isNotEmpty)
          _SuggestionList(
            suggestions: suggestions,
            onTap: onSuggestionTap,
          ),
      ],
    );
  }
}

class _SearchLoading extends StatelessWidget {
  const _SearchLoading();

  @override
  Widget build(BuildContext context) {
    return const Material(
      color: mapSurfaceColor,
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Row(
          children: [
            SizedBox(
              height: 16,
              width: 16,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
            SizedBox(width: 8),
            Text('Searching...'),
          ],
        ),
      ),
    );
  }
}

class _SuggestionList extends StatelessWidget {
  final List<PlaceSuggestion> suggestions;
  final ValueChanged<PlaceSuggestion> onTap;

  const _SuggestionList({
    required this.suggestions,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: mapSurfaceColor,
      elevation: 6,
      borderRadius: BorderRadius.circular(16),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 240),
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: suggestions.length,
          separatorBuilder: (context, index) => const Divider(height: 1),
          itemBuilder: (context, index) {
            final suggestion = suggestions[index];
            return ListTile(
              title: Text(
                suggestion.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              onTap: () => onTap(suggestion),
            );
          },
        ),
      ),
    );
  }
}
