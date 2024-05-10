import 'package:flutter/material.dart';
import 'package:flutter_app_features/widgets/custom_dropdown_button.dart';

class DependentMultilevelDropdown extends StatefulWidget {
  const DependentMultilevelDropdown({super.key});

  @override
  State<DependentMultilevelDropdown> createState() => _DependentMultilevelDropdownState();
}

class _DependentMultilevelDropdownState extends State<DependentMultilevelDropdown> {
  late List<Division> divisions;

  @override
  void initState() {
    super.initState();
    divisions = [
      Division(name: 'Dhaka', districts: [
        District(name: 'Dhaka', subDistricts: [
          SubDistrict(name: 'Mohammedpur'),
          SubDistrict(name: 'Savar')
        ]),
        District(name: 'Gopalgonj', subDistricts: [
          SubDistrict(name: 'Tungipara'),
          SubDistrict(name: 'Gopalgonj Sadar')
        ])
      ]),
      Division(name: 'Chittagong', districts: [
        District(name: 'Chittagong', subDistricts: [
          SubDistrict(name: 'Bandar'),
          SubDistrict(name: 'Agrabad')
        ]),
        District(name: 'Cumilla', subDistricts: [
          SubDistrict(name: 'Chandina'),
          SubDistrict(name: 'Devidwar')
        ])
      ]),
    ];
  }

  Division? selectedDivision;
  District? selectedDistrict;
  SubDistrict? selectedSubDistrict;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomDropdownButton1<Division>(
                value: selectedDivision,
                items: divisions,
                hintText: 'Select Division',
                onChanged: (value) {
                  setState(() {
                    selectedDivision = value;
                    selectedDistrict = null;
                    selectedSubDistrict = null;
                  });
                },
              ),
              const SizedBox(height: 10),
              CustomDropdownButton1<District>(
                value: selectedDistrict,
                items: selectedDivision?.districts ?? [],
                hintText: 'Select District',
                onChanged: (value) {
                  setState(() {
                    selectedDistrict = value;
                    selectedSubDistrict = null;
                  });
                },
              ),
              const SizedBox(height: 10),
              CustomDropdownButton1<SubDistrict>(
                value: selectedSubDistrict,
                items: selectedDistrict?.subDistricts ?? [],
                hintText: 'Select Sub-District',
                onChanged: (value) {
                  setState(() {
                    selectedSubDistrict = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              Text('Division: $selectedDivision'),
              Text('District: $selectedDistrict'),
              Text('Sub-District: $selectedSubDistrict'),
            ],
          ),
        ),
      ),
    );
  }
}

class Division {
  String name;
  List<District> districts;

  Division({required this.name, required this.districts});
  @override
  String toString() {
    return name;
  }
}

class District {
  String name;
  List<SubDistrict> subDistricts;

  District({required this.name, required this.subDistricts});
  @override
  String toString() {
    return name;
  }
}

class SubDistrict {
  String name;
  SubDistrict({required this.name});
  @override
  String toString() {
    return name;
  }
}
