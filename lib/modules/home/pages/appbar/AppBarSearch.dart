import 'package:flutter/material.dart';
import 'package:new_project/config/config.dart';

// APP BAR QUANDO COMEÇA A BUSCA
class AppBarSearch extends StatefulWidget {
  final Function searchChat;
  final Function(String) onSearchChange;
  final Function onClear;

  // Utilizando as chaves no construtor, utiliza-se parametros nomeados. ( comum para StatefulWidget )
  const AppBarSearch(
      {Key key, @required this.searchChat, this.onSearchChange, this.onClear})
      : super(key: key);

  @override
  _AppBarSearchState createState() => _AppBarSearchState();
}

class _AppBarSearchState extends State<AppBarSearch> {
  TextEditingController textFieldController;

  void initState() {
    // primeria coisa que roda
    print("init");
    super.initState();
    textFieldController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    textFieldController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textFieldController,
      decoration: InputDecoration(
        hintText: "Pesquisar...",
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
        prefixIcon: IconButton(
          icon: Icon(Icons.arrow_back),
          color: primaryColor,
          onPressed: widget.searchChat,
        ),
        suffixIcon: IconButton(
          icon: Icon(Icons.clear),
          color: Colors.grey,
          onPressed: () {
            widget.onClear();
            textFieldController.clear();
          },
        ),
        fillColor: Colors.white,
        filled: true,
      ),
      onChanged: widget.onSearchChange,
    );
  }
}
