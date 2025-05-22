import 'dart:math';
import 'package:flutter/material.dart';
import '../models/flashcard.dart';

class FlashcardWidget extends StatefulWidget {
  final Flashcard flashcard;
  final Color color;
  final VoidCallback? onCorrectAnswer;

  const FlashcardWidget({
    super.key,
    required this.flashcard,
    required this.color,
    this.onCorrectAnswer,
  });

  @override
  State<FlashcardWidget> createState() => _FlashcardWidgetState();
}

class _FlashcardWidgetState extends State<FlashcardWidget> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool _isFront = true;
  bool _showOptions = false;
  bool _answered = false;
  int? _selectedOptionIndex;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleCard() {
    if (_answered) return; // No permitir voltear si ya respondió

    if (_isFront) {
      _animationController.forward().then((_) {
        setState(() {
          _showOptions = true;
        });
      });
    } else {
      setState(() {
        _showOptions = false;
      });
      _animationController.reverse();
    }
    _isFront = !_isFront;
  }

  void _resetCard() {
    setState(() {
      _selectedOptionIndex = null;
      _answered = false;
      _showOptions = false;
    });
    _animationController.reverse();
    _isFront = true;
  }

  void _checkAnswer(int index) {
    if (_answered) return; // Evitar múltiples selecciones

    setState(() {
      _selectedOptionIndex = index;
      _answered = true;
    });

    // Verificar si la respuesta es correcta
    if (index == widget.flashcard.correctOptionIndex) {
      Future.delayed(const Duration(milliseconds: 800), () {
        if (widget.onCorrectAnswer != null) {
          widget.onCorrectAnswer!();
        }
      });
    } else {
      // Si la respuesta es incorrecta, esperar un momento y reiniciar la tarjeta
      Future.delayed(const Duration(milliseconds: 1500), () {
        _resetCard();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001)
        ..rotateY(pi * _animation.value),
      child: _animation.value < 0.5
          ? GestureDetector(
              onTap: _toggleCard,
              child: _buildCardFace(
                isAnswer: false,
                text: widget.flashcard.context,
                hintText: 'Toca para ver la pregunta y opciones',
              ),
            )
          : Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()..rotateY(pi),
              child: _buildAnswerFace(),
            ),
    );
  }

  Widget _buildCardFace({
    required bool isAnswer,
    required String text,
    required String hintText,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: widget.color.withOpacity(0.5),
          width: 2,
        ),
      ),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: isAnswer
                ? [
                    Colors.white,
                    Colors.grey.shade50,
                  ]
                : [
                    widget.color.withOpacity(0.1),
                    Colors.white,
                  ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'CONTEXTO',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: widget.color,
                  ),
                ),
                Icon(
                  Icons.info_outline,
                  color: widget.color,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  child: Text(
                    text,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: Text(
                hintText,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade600,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnswerFace() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: widget.color.withOpacity(0.5),
          width: 2,
        ),
      ),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white,
              Colors.grey.shade50,
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'PREGUNTA',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: widget.color,
                  ),
                ),
                Icon(
                  Icons.help_outline,
                  color: widget.color,
                ),
              ],
            ),
            const SizedBox(height: 16),
            if (_showOptions) ...[
              Expanded(
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.flashcard.question,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 24),
                        ...List.generate(
                          widget.flashcard.options.length,
                          (index) => _buildOptionCard(index),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Center(
                child: _answered
                    ? _selectedOptionIndex == widget.flashcard.correctOptionIndex
                        ? const Text(
                            '¡Correcto! Avanzando a la siguiente tarjeta...',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : Text(
                            'Incorrecto. Volviendo al contexto...',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                    : Text(
                        'Selecciona la respuesta correcta',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
              ),
            ] else ...[
              const Expanded(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildOptionCard(int index) {
    final bool isSelected = _selectedOptionIndex == index;
    final bool isCorrect = widget.flashcard.correctOptionIndex == index;
    final bool showResult = _answered && isSelected;
    
    // Colores para los bordes
    Color borderColor = Colors.grey.shade300;
    if (_answered) {
      if (isSelected && isCorrect) {
        borderColor = Colors.green;
      } else if (isSelected && !isCorrect) {
        borderColor = Colors.red;
      } else if (isCorrect) {
        borderColor = Colors.green.withOpacity(0.5);
      }
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: _answered ? null : () => _checkAnswer(index),
        borderRadius: BorderRadius.circular(12),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: borderColor,
              width: 2,
            ),
            color: isSelected
                ? isCorrect
                    ? Colors.green.withOpacity(0.1)
                    : Colors.red.withOpacity(0.1)
                : Colors.white,
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  widget.flashcard.options[index],
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ),
              if (showResult)
                Icon(
                  isCorrect ? Icons.check_circle : Icons.cancel,
                  color: isCorrect ? Colors.green : Colors.red,
                ),
            ],
          ),
        ),
      ),
    );
  }
} 