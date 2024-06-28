import 'package:flutter/material.dart';

class OnboardingItemsModel {
  final String title;
  final String description;
  final Widget child;

  OnboardingItemsModel(
    this.title,
    this.description,
    this.child,
  );

  factory OnboardingItemsModel.empty() {
    return OnboardingItemsModel(
      "",
      "",
      const SizedBox.shrink(),
    );
  }
}
