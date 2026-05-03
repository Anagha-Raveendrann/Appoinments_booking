import 'package:flutter/material.dart';

class BookingCard extends StatelessWidget{
  final int index;
  final String name;
  final String package;
  final String date;
  final String staff;
  final VoidCallback? onTap;

  const BookingCard({
    super.key, 
    required this.index,
     required this.name,
      required this.package, 
      required this.date,
       required this.staff,
        this.onTap
        });

  @ override
  Widget build(BuildContext context){
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(16)
      ),
      child: Column(
        children: [
          Text("$index. $name",
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12,),
          Row(
            children: [
              const Icon(Icons.calendar_today,size: 18,color: Colors.red,),
              const SizedBox(width: 6,),
              Text(date),
              const SizedBox(width: 20,),
              const Icon(Icons.group, size: 18, color: Colors.red,),
              const SizedBox(width: 6,),
              Text(staff)
            ],
          ),
          const Divider(height: 25,),

          GestureDetector(
            onTap:onTap,
            child: const Row(
              children: [
                Text("View Booking details",style: TextStyle(fontSize: 16)),
                Icon(Icons.arrow_back_ios,color: Color(0xff06B3F),)
              ],
            ),
            
          )
        ],
      ),
    );
  }
}