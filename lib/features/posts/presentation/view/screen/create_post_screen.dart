import 'package:flutter/material.dart';
import 'package:postify/core/theme/app_colors.dart';
import 'package:postify/features/posts/presentation/view/screen/content/ai_prompt_content.dart';
import 'package:postify/features/posts/presentation/view/screen/content/generate_image_content.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToNextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightMainAppColor(context),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          AiPromptContent(onPressed: _goToNextPage),

           GenerateImageContent(pageController: _pageController,),
        ],
      ),
    );
  }
}
