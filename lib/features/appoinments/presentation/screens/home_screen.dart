import 'package:appoinments_booking/features/appoinments/presentation/widgets/app_button.dart';
import 'package:flutter/material.dart';
import '../widgets/common_appbar.dart';
import '../widgets/search_sort_bar.dart';
import '../widgets/booking_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: const CommonAppBar(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          height: 55,
          decoration: BoxDecoration(
            color: const Color(0xff0C6B3F),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child:AppButton(
              title: "Register Now", 
              onTap: (){
                print("Register tapped");
              }
              ) 
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SearchSortBar(),
            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return BookingCard(
                    index: index + 1,
                    name: "Vikram Singh",
                    package: "Couple Combo Package (Rejuvenation)",
                    date: "31/01/2024",
                    staff: "Jithesh",
                    onTap: () {},
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}