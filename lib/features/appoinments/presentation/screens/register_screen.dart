import 'package:appoinments_booking/features/appoinments/presentation/widgets/app_button.dart';
import 'package:appoinments_booking/features/appoinments/presentation/widgets/app_textfield.dart';
import 'package:appoinments_booking/features/appoinments/presentation/widgets/common_appbar.dart';
import 'package:flutter/material.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // Controllers
  final nameController = TextEditingController();
  final whatsappController = TextEditingController();
  final addressController = TextEditingController();
  final totalController = TextEditingController();
  final discountController = TextEditingController();
  final advanceController = TextEditingController();
  final balanceController = TextEditingController();

  String? selectedLocation;
  String? selectedBranch;
  String paymentMethod = "Cash";

  DateTime? selectedDate;
  String? selectedHour;
  String? selectedMinute;

  List<String> locations = ["Kochi", "Angamaly", "Aluva"];
  List<String> branches = ["Branch A", "Branch B", "Branch C"];

  

  Future<void> pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2030),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
           CommonAppBar(),
           SizedBox(height: 15,),
           Padding(
             padding: const EdgeInsets.only(right: 370.0),
             child: Text("Register",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
           ),
            /// Name
            AppTextfield(
              hintText: "Enter your full name",
              controller: nameController,
              keyboardType: TextInputType.name,
            ),
            const SizedBox(height: 15),

            /// Whatsapp
            AppTextfield(
              hintText: "Enter your Whatsapp number",
              controller: whatsappController,
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 15),

            /// Address
            AppTextfield(
              hintText: "Enter your full address",
              controller: addressController,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 15),

            /// Location Dropdown
            DropdownButtonFormField<String>(
              value: selectedLocation,
              decoration: inputDecoration("Choose your location"),
              items: locations
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (val) {
                setState(() => selectedLocation = val);
              },
            ),
            const SizedBox(height: 15),

            /// Branch Dropdown
            DropdownButtonFormField<String>(
              value: selectedBranch,
              decoration: inputDecoration("Select the branch"),
              items: branches
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (val) {
                setState(() => selectedBranch = val);
              },
            ),
            const SizedBox(height: 20),

            /// Total Amount
            AppTextfield(
              hintText: "Total Amount",
              controller: totalController,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 15),

            /// Discount
            AppTextfield(
              hintText: "Discount Amount",
              controller: discountController,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 15),

            /// Payment Option
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: ["Cash", "Card", "UPI"].map((method) {
                return Row(
                  children: [
                    Radio(
                      value: method,
                      groupValue: paymentMethod,
                      activeColor: const Color(0xff0E6B3E),
                      onChanged: (value) {
                        setState(() {
                          paymentMethod = value!;
                        });
                      },
                    ),
                    Text(method),
                  ],
                );
              }).toList(),
            ),
            const SizedBox(height: 15),

            /// Advance
            AppTextfield(
              hintText: "Advance Amount",
              controller: advanceController,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 15),

            /// Balance
            AppTextfield(
              hintText: "Balance Amount",
              controller: balanceController,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),

            /// Date Picker
            GestureDetector(
              onTap: pickDate,
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 18),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      selectedDate == null
                          ? "Select Treatment Date"
                          : "${selectedDate!.day}-${selectedDate!.month}-${selectedDate!.year}",
                    ),
                    const Icon(Icons.calendar_today,
                        color: Color(0xff0E6B3E))
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

             // SAVE BUTTON
             AppButton(title: "save",
              onTap: (){})
            
          ],
        ),
      ),
    );
  }

  InputDecoration inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: Colors.grey.shade100,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Color(0xff0E6B3E)),
      ),
    );
  }
}