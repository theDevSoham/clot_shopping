import 'package:clot_shopping/auth_route.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  String _selectedGender = "Men";
  String? _selectedAgeRange;

  final List<String> _ageRanges = ["18 - 24", "25 - 34", "35 - 44", "45+"];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment
                .spaceBetween, // 🔑 keeps content center + button bottom
            children: [
              // Centered content
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      "Tell us About yourself",
                      style: theme.textTheme.headlineLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 30),

                    // Gender Question
                    Text(
                      "Who do you shop for ?",
                      style: theme.textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 12),

                    Row(
                      children: [
                        ChoiceChip(
                          label: const Text("Men"),
                          selected: _selectedGender == "Men",
                          onSelected: (_) {
                            setState(() => _selectedGender = "Men");
                          },
                          labelStyle: TextStyle(
                            color: _selectedGender == "Men"
                                ? Colors.white
                                : Colors.black,
                          ),
                          selectedColor: theme.primaryColor,
                          backgroundColor: theme.secondaryHeaderColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        const SizedBox(width: 12),
                        ChoiceChip(
                          label: const Text("Women"),
                          selected: _selectedGender == "Women",
                          onSelected: (_) {
                            setState(() => _selectedGender = "Women");
                          },
                          labelStyle: TextStyle(
                            color: _selectedGender == "Women"
                                ? Colors.white
                                : Colors.black,
                          ),
                          selectedColor: theme.primaryColor,
                          backgroundColor: theme.secondaryHeaderColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),

                    // Age Question
                    Text("How Old are you ?", style: theme.textTheme.bodyLarge),
                    const SizedBox(height: 12),

                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      decoration: BoxDecoration(
                        color: theme.secondaryHeaderColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: _selectedAgeRange,
                          hint: const Text("Age Range"),
                          items: _ageRanges
                              .map(
                                (age) => DropdownMenuItem(
                                  value: age,
                                  child: Text(age),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            setState(() => _selectedAgeRange = value);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Finish Button pinned at bottom
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    // Handle finish logic
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const BottomNavParent(),
                      ),
                    );
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: theme.primaryColor,
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                  child: Text(
                    "Finish",
                    style: theme.textTheme.headlineSmall?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
