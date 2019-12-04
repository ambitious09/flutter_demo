import 'package:flutter/material.dart';

class SuggestionList extends StatelessWidget {
  const SuggestionList({this.suggestions, this.query, this.onSelected});

  final List<String> suggestions;
  final String query;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return query.isEmpty?Container(
      margin: EdgeInsets.only(left:10,top: 10),
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              '大家都在搜',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
      Container(
        margin: EdgeInsets.only(top: 10.0),
        alignment: Alignment.centerLeft,
        child: Wrap(
          runSpacing: 8.0,
          spacing: 8.0,
          children: suggestions.map((item){
            return GestureDetector(
              child: ClipRRect(
                child: Container(
                  padding: EdgeInsets.all(3.0),
                  child: Text(
                    item,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  color: Colors.blue,

                ),
                borderRadius: BorderRadius.circular(5),
              ),
              onTap: (){
                onSelected(item);
              },
            );
          }).toList(),
        ),
      ),
        ],
      ),
    ): ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (BuildContext context, int i) {
        final String suggestion = suggestions[i];
        return ListTile(
          leading: query.isEmpty ? const Icon(Icons.history) : const Icon(null),
          title: RichText(
            text: TextSpan(
              text: suggestion.substring(0, query.length),
              style: theme.textTheme.subhead.copyWith(fontWeight: FontWeight.bold),
              children: <TextSpan>[
                TextSpan(
                  text: suggestion.substring(query.length),
                  style: theme.textTheme.subhead,
                ),
              ],
            ),
          ),
          onTap: () {
            onSelected(suggestion);
          },
        );
      },
    );
  }
}