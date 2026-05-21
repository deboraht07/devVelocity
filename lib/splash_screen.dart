import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'theme/app_theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isAssembled = false;

  @override
  void initState() {
    super.initState();

    // Fast trigger for snappy geometric slide-ins
    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted) {
        setState(() {
          _isAssembled = true;
        });
      }
    });

    // 2.5-second hold before a smooth dissolve transition to the login page
    Future.delayed(const Duration(milliseconds: 2500), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            pageBuilder: (context, anim, secAnim) => const LoginScreen(),
            transitionsBuilder: (context, anim, secAnim, child) {
              return FadeTransition(opacity: anim, child: child);
            },
            transitionDuration: const Duration(milliseconds: 400),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    const Color deepCanvas = Color(0xFF121212); // Rich black background
    const Color bentoBlockBg =
        AppTheme.surfaceDark; // 0xFF1A1A1A container black
    const Color brightEmerald = AppTheme.accent; // 0xFF00B27A vibrant green

    return Scaffold(
      backgroundColor: deepCanvas,
      body: Stack(
        children: [
          // BACKGROUND GEOMETRY 1: Huge soft top-left capsule block (Moves down)
          AnimatedPositioned(
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeOutQuart,
            top: _isAssembled ? -40 : -200,
            left: _isAssembled ? -40 : -200,
            child: Container(
              width: 320,
              height: 320,
              decoration: BoxDecoration(
                color: bentoBlockBg,
                borderRadius: BorderRadius.circular(80),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.03),
                  width: 1,
                ),
              ),
            ),
          ),

          // BACKGROUND GEOMETRY 2: Bottom-right emerald crescent outline (Fades in)
          AnimatedPositioned(
            duration: const Duration(milliseconds: 900),
            curve: Curves.easeOutBack,
            bottom: _isAssembled ? -60 : -150,
            right: _isAssembled ? -60 : -150,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 600),
              opacity: _isAssembled ? 0.06 : 0.0,
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: brightEmerald, width: 45),
                ),
              ),
            ),
          ),

          // CENTRAL HIGH-CONTRAST BENTO SYSTEM ASSEMBLY
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 200,
                  height: 100,
                  child: Stack(
                    children: [
                      // Left Block: Chunky Black Square (Slides right)
                      AnimatedPositioned(
                        duration: const Duration(milliseconds: 700),
                        curve: Curves.easeOutBack,
                        left: _isAssembled ? 12 : -150,
                        top: 4,
                        child: Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: bentoBlockBg,
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(
                              color: Colors.white.withValues(alpha: 0.05),
                              width: 1.5,
                            ),
                          ),
                          child: const Icon(
                            Icons.grid_view_rounded,
                            color: Colors.white38,
                            size: 28,
                          ),
                        ),
                      ),

                      // Right Block: The Core Accent Signature (Drops in from top)
                      AnimatedPositioned(
                        duration: const Duration(milliseconds: 750),
                        curve: Curves.elasticOut,
                        right: _isAssembled ? 12 : 30,
                        top: _isAssembled ? 4 : -150,
                        child: Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: brightEmerald,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(24),
                              topRight: Radius.circular(24),
                              bottomLeft: Radius.circular(24),
                              bottomRight: Radius.circular(
                                4,
                              ), // Asymmetric crisp finish
                            ),
                          ),
                          child: const Icon(
                            Icons.bolt_rounded,
                            size: 42,
                            color:
                                deepCanvas, // High contrast punchy dark icon on green
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Typography Engine
                AnimatedOpacity(
                  opacity: _isAssembled ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 500),
                  child: Column(
                    children: [
                      const Text(
                        'DevVelocity',
                        style: TextStyle(
                          fontSize: 38,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                          letterSpacing: -1.2,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Accelerate Your Workflow',
                        style: TextStyle(
                          fontSize: 12,
                          color: brightEmerald.withValues(alpha: 0.8),
                          fontWeight: FontWeight.w800,
                          letterSpacing: 2.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
