import 'package:flutter/material.dart';
import '../models/topic.dart';
import '../widgets/flashcard_widget.dart';

class FlashcardsScreen extends StatefulWidget {
  final Topic topic;

  const FlashcardsScreen({
    super.key,
    required this.topic,
  });

  @override
  State<FlashcardsScreen> createState() => _FlashcardsScreenState();
}

class _FlashcardsScreenState extends State<FlashcardsScreen> {
  late PageController _pageController;
  int _currentIndex = 0;
  bool _canSwipe = false;
  bool _showCompletionDialog = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextCard() {
    if (_currentIndex < widget.topic.flashcards.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // Si estamos en la última tarjeta, mostrar el diálogo de finalización
      setState(() {
        _showCompletionDialog = true;
      });
      
      // Volver a la pantalla principal después de un breve retraso
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          Navigator.of(context).pop(); // Volver a la pantalla principal
        }
      });
    }
  }

  void _goBack() {
    // Implementamos nuestro propio método para volver atrás
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // No permitir que el botón de retroceso nativo cierre esta pantalla
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.topic.title),
          backgroundColor: widget.topic.color,
          foregroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: _goBack,
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.shuffle),
              onPressed: () {
                // Implementar funcionalidad de mezclar tarjetas
              },
            ),
          ],
        ),
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    physics: _canSwipe ? const AlwaysScrollableScrollPhysics() : const NeverScrollableScrollPhysics(),
                    itemCount: widget.topic.flashcards.length,
                    onPageChanged: (index) {
                      setState(() {
                        _currentIndex = index;
                        _canSwipe = false;
                      });
                    },
                    itemBuilder: (context, index) {
                      final flashcard = widget.topic.flashcards[index];
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: FlashcardWidget(
                          flashcard: flashcard,
                          color: widget.topic.color,
                          onCorrectAnswer: () {
                            setState(() {
                              _canSwipe = true;
                            });
                            _nextCard();
                          },
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: _currentIndex > 0 && _canSwipe
                            ? () {
                                _pageController.previousPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                              }
                            : null,
                      ),
                      Text(
                        '${_currentIndex + 1} / ${widget.topic.flashcards.length}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      IconButton(
                        icon: const Icon(Icons.arrow_forward),
                        onPressed: _currentIndex < widget.topic.flashcards.length - 1 && _canSwipe
                            ? () {
                                _pageController.nextPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                              }
                            : null,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // Diálogo de finalización
            if (_showCompletionDialog)
              Container(
                color: Colors.black54,
                alignment: Alignment.center,
                child: Card(
                  margin: const EdgeInsets.all(32),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.green.shade100,
                            shape: BoxShape.circle,
                          ),
                          padding: const EdgeInsets.all(16),
                          child: Icon(
                            Icons.check_circle,
                            color: Colors.green.shade700,
                            size: 60,
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          '¡Felicitaciones!',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: widget.topic.color,
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Has completado correctamente todas las tarjetas de este tema.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 24),
                        const Text(
                          'Volviendo a la pantalla principal...',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
} 