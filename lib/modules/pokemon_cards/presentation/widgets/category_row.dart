import 'package:flutter/material.dart';

class CategoryRow extends StatefulWidget {
  final List<String> items;
  const CategoryRow({
    super.key,
    required this.items,
  });

  @override
  State<CategoryRow> createState() => _CategoryRowState();
}

class _CategoryRowState extends State<CategoryRow> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Near You',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.08,
          child: ListView(
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.03),
            scrollDirection: Axis.horizontal,
            children: List.generate(
              widget.items.length,
              (index) => Padding(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.06),
                child: GestureDetector(
                  onTap: () {},
                  child: Text(
                    widget.items[index],
                    style: TextStyle(
                      color: widget.items[selectedIndex] == widget.items[index]
                          ? Colors.yellowAccent
                          : Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
