import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../app_state.dart';
import '../../models/category.dart';
import '../../styleguide.dart';

class CategoryWidget extends StatelessWidget {
  final Category category;

  const CategoryWidget({ required Key key, required this.category}): super(key: key);



  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    final isSelected = appState.selectedCategoryId == category.categoryId;

    return GestureDetector(
      onTap: () {
        if (!isSelected) {
          appState.updateCategoryId(category.categoryId);
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        width: 120,
        height: 120,
        decoration: BoxDecoration(
          border: Border.all(color: isSelected ? Colors.white : Color(0x99FFFFFF), width: 3),
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: isSelected ? Colors.white : Colors.transparent,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              category.getIconData(),
              color: isSelected ? Theme.of(context).primaryColor : Colors.yellow,
              size: 30,
            ),
            SizedBox(height: 10,),
            Text(
              category.name,
              style: isSelected ? selectedCategoryTextStyle : categoryTextStyle,
            )
          ],
        ),
      ),
    );
  }
}


