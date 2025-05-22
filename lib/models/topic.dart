import 'package:flutter/material.dart';
import 'flashcard.dart';

class Topic {
  final String id;
  final String title;
  final String description;
  final Color color;
  final IconData icon;
  final List<Flashcard> flashcards;

  const Topic({
    required this.id,
    required this.title,
    required this.description,
    required this.color,
    required this.icon,
    required this.flashcards,
  });
} 