import 'package:flutter/material.dart';
import '../app_colors.dart';
import 'register_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentPage = 0;

  final List<_OnboardingData> _pages = [
    _OnboardingData(
      title: 'TailTOWN is a community-centered\napplication for your pets',
      subtitle: 'Blog and Interact with other Pet\nOwners and their Furbabies',
      imagePath: 'assets/images/pets_cat_dog.png',
    ),
    _OnboardingData(
      title: 'Scan and provide your concern\nabout your pet\'s health',
      subtitle: 'Look for a nearby and great\nVet Clinics within your area',
      imagePath: 'assets/images/vet_clinic.png',
    ),
    _OnboardingData(
      title: 'Start interacting with different\nPet Owners, alongside your\npaw companion',
      subtitle: '',
      imagePath: 'assets/images/pet_love.png',
    ),
  ];

  void _next() {
    if (_currentPage < _pages.length - 1) {
      setState(() => _currentPage++);
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const RegisterScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final page = _pages[_currentPage];

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFD6EAF5), Color(0xFF9DCCE8)],
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back button
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 30),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back,
                      color: AppColors.textDark, size: 26),
                  onPressed: () {
                    if (_currentPage > 0) {
                      setState(() => _currentPage--);
                    } else {
                      Navigator.pop(context);
                    }
                  },
                ),
              ),

              const SizedBox(height: 24),

              const Spacer(flex: 1),

              // Title
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 8),
                  child: Text(
                    page.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textDark,
                      height: 1.5,
                    ),
                  ),
                ),
              ),


              // Illustration
              Center(
                child: Image.asset(
                  page.imagePath,
                  width: 220,
                  height: 220,
                  fit: BoxFit.contain,
                ),
              ),


              // Subtitle
              if (page.subtitle.isNotEmpty)
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 8),
                    child: Text(
                      page.subtitle,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textDark,
                        height: 1.5,
                      ),
                    ),
                  ),
                ),

              const Spacer(flex: 2),

              // Dot indicators
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _pages.length,
                  (i) => AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: i == _currentPage ? 20 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: i == _currentPage
                          ? AppColors.primaryBlue
                          : AppColors.inputBorder,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Bottom card with Next button
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(24, 28, 24, 36),
                decoration: const BoxDecoration(
                  color: Color(0xFFCCE6F5),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: ElevatedButton(
                    onPressed: _next,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryBlue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      _currentPage < _pages.length - 1 ? 'Next' : 'Get Started',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
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

class _OnboardingData {
  final String title;
  final String subtitle;
  final String imagePath;

  _OnboardingData({
    required this.title,
    required this.subtitle,
    required this.imagePath,
  });
}