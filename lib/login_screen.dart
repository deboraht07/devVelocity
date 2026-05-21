import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'views/main_navigation.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color deepCanvas = Color(0xFF121212);
    const Color bentoCardBg = AppTheme.surfaceDark; // 0xFF1A1A1A
    const Color brightEmerald = AppTheme.accent; // 0xFF00B27A

    return Scaffold(
      backgroundColor: deepCanvas,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),

              // App Brand Header Context Label
              Text(
                'DevVelocity.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w900,
                  color: brightEmerald,
                  letterSpacing: -0.8,
                ),
              ),
              const SizedBox(height: 40),

              // Chunky Asymmetric Dark Bento Grid Module Card
              Container(
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: bentoCardBg,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(36),
                    topRight: Radius.circular(36),
                    bottomLeft: Radius.circular(36),
                    bottomRight: Radius.circular(
                      8,
                    ), // Keeps the asymmetric design motif matching the splash
                  ),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.04),
                    width: 2,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Welcome Back',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        letterSpacing: -0.5,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Sign in to continue',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.white38,
                        fontWeight: FontWeight.w400,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 36),

                    // Google Identity Button - Translucent dark card block with zero errors
                    SizedBox(
                      width: double.infinity,
                      child: TextButton.icon(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const MainNavigation(),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.g_mobiledata_rounded,
                          size: 32,
                          color: Colors.redAccent,
                        ), // Fixed typo here
                        label: const Text('Sign in with Google'),
                        style: TextButton.styleFrom(
                          backgroundColor: deepCanvas,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                            // Removed 'const' from here because withValues() evaluates at runtime
                            side: BorderSide(
                              color: Colors.white.withValues(alpha: 0.08),
                              width: 1.5,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),

                    // Phone Identity Button - Punchy Emerald Green Block With Dark Contrast Text
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const MainNavigation(),
                            ),
                          );
                        },
                        icon: const Icon(Icons.phone_android_rounded, size: 28),
                        label: const Text('Verify with Phone number'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: brightEmerald,
                          foregroundColor:
                              bentoCardBg, // High contrast flat dark text over green highlights
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 14,
                            letterSpacing: -0.2,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
