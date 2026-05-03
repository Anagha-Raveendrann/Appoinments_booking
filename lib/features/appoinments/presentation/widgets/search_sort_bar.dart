import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SearchSortBar extends StatefulWidget {
  final Function(String)? onDateSelected;
  const SearchSortBar({super.key, this.onDateSelected});

  @override
  State<SearchSortBar> createState() => _SearchSortBarState();
}

class _SearchSortBarState extends State<SearchSortBar> {
  DateTime? selectedDate;

  Future<void> pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2030),
    );

    if (picked != null) {
      setState(() => selectedDate = picked);

      String formatted = DateFormat('dd/MM/yyyy').format(picked);
      widget.onDateSelected?.call(formatted);
    }
  }

  @override
  Widget build(BuildContext context) {
    String dateText = selectedDate == null
        ? "Date"
        : DateFormat('dd/MM/yyyy').format(selectedDate!);

    return Column(
      children: [
        /// SEARCH BAR
        Row(
          children: [
            Expanded(
              child: Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.search, color: Colors.grey),
                    SizedBox(width: 10),
                    Text("Search for treatments",
                        style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 10),
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                color: const Color(0xff0C6B3F),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text("Search",
                    style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
            )
          ],
        ),

        const SizedBox(height: 20),

        /// SORT + DATE PICKER
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Sort by :", style: TextStyle(fontSize: 18)),
            GestureDetector(
              onTap: pickDate,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Row(
                  children: [
                    Text(dateText),
                    const SizedBox(width: 5),
                    const Icon(Icons.keyboard_arrow_down)
                  ],
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}