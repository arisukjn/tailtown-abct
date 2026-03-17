import 'package:flutter/material.dart';
import '../app_colors.dart';
import '../widgets/tailtown_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _allowNotifications = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            children: [

              // Back button
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, top: 30),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back,
                        color: AppColors.textDark, size: 26),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ),

              // Header area
              Expanded(
                flex: 2,
                child: Stack(
                  children: [

                    // Top content
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 8),
                        // Dog & Cat icon
                        Image.asset(
                          'assets/images/dog_cat_register.png',
                          width: 90,
                          height: 90,
                        ),
                        const SizedBox(height: 14),
                        const Text(
                          'Start register now and\njoin our Pet Community!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: AppColors.textDark,
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),


              // Form card (scrollable)
              Expanded(
                flex: 4,
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xFFCCE6F5),
                    borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                  ),
                  child: Scrollbar(
                    thickness: 5,
                    radius: const Radius.circular(8),
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(24, 28, 24, 32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Username
                        _fieldLabel('Username'),
                        const SizedBox(height: 8),
                        TailTownTextField(
                          controller: _usernameController,
                          hintText: '*Minimum of 4 characters',
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          '* The username should consist of alphanumeric characters only',
                          style: TextStyle(
                            fontSize: 11,
                            color: AppColors.textMedium,
                          ),
                        ),

                        const SizedBox(height: 18),

                        // Email
                        _fieldLabel('Email Address'),
                        const SizedBox(height: 8),
                        TailTownTextField(
                          controller: _emailController,
                          hintText: '',
                          keyboardType: TextInputType.emailAddress,
                        ),

                        const SizedBox(height: 18),

                        // Password
                        _fieldLabel('Password'),
                        const SizedBox(height: 8),
                        TailTownTextField(
                          controller: _passwordController,
                          hintText: '*Minimum of 8 characters',
                          obscureText: _obscurePassword,
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: AppColors.textLight,
                            ),
                            onPressed: () =>
                                setState(() => _obscurePassword = !_obscurePassword),
                          ),
                        ),

                        const SizedBox(height: 18),

                        // Confirm Password
                        _fieldLabel('Confirm Password'),
                        const SizedBox(height: 8),
                        TailTownTextField(
                          controller: _confirmPasswordController,
                          hintText: '',
                          obscureText: _obscureConfirmPassword,
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureConfirmPassword
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: AppColors.textLight,
                            ),
                            onPressed: () => setState(() =>
                                _obscureConfirmPassword = !_obscureConfirmPassword),
                          ),
                        ),

                        const SizedBox(height: 20),

                        // Notifications checkbox
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 22,
                              height: 22,
                              child: Checkbox(
                                value: _allowNotifications,
                                onChanged: (val) =>
                                    setState(() => _allowNotifications = val ?? false),
                                activeColor: AppColors.primaryBlue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                side: const BorderSide(
                                  color: AppColors.checkboxBorder,
                                  width: 1.5,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Expanded(
                              child: Text(
                                'Allow notifications for updates, news, and upcoming events',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: AppColors.textMedium,
                                  height: 1.4,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 28),

                        // Register button
                        SizedBox(
                          width: double.infinity,
                          height: 54,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryBlue,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                              elevation: 0,
                            ),
                            child: const Text(
                              'Register',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ],
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

  Widget _fieldLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w700,
        color: AppColors.textDark,
      ),
    );
  }
}