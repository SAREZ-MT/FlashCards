import 'package:flutter/material.dart';
import '../models/topic.dart';
import '../models/flashcard.dart';

final List<Topic> topicsData = [
  Topic(
    id: '1',
    title: 'Flutter',
    description: 'Fundamentos de Flutter y Dart',
    color: Colors.blue,
    icon: Icons.flutter_dash,
    flashcards: [
      Flashcard(
        id: '1',
        question: '¿Qué es un Widget en Flutter?',
        answer: 'Un Widget es el elemento básico de construcción de la interfaz de usuario en Flutter. Todo en Flutter es un widget, desde botones hasta layouts.',
        options: [
          'Un Widget es el elemento básico de construcción de la interfaz de usuario en Flutter.',
          'Un Widget es una animación de transición entre pantallas.',
          'Un Widget es una herramienta para depurar código en Flutter.',
        ],
        correctOptionIndex: 0,
        context: 'Flutter utiliza un sistema de construcción de interfaces basado en componentes. Estos componentes fundamentales son la base de toda aplicación Flutter.',
      ),
      Flashcard(
        id: '2',
        question: '¿Cuál es la diferencia entre StatelessWidget y StatefulWidget?',
        answer: 'Un StatelessWidget es inmutable y no puede cambiar su estado durante el tiempo de vida. Un StatefulWidget puede mantener un estado que puede cambiar durante el tiempo de vida del widget.',
        options: [
          'StatelessWidget tiene mejor rendimiento que StatefulWidget.',
          'Un StatelessWidget es inmutable y no puede cambiar su estado durante el tiempo de vida.',
          'StatelessWidget solo se usa para animaciones, mientras que StatefulWidget para interfaces estáticas.',
        ],
        correctOptionIndex: 1,
        context: 'En Flutter existen dos tipos principales de widgets para construir interfaces. Su elección depende de si necesitas manejar estados cambiantes o no.',
      ),
      Flashcard(
        id: '3',
        question: '¿Qué es el "Hot Reload" en Flutter?',
        answer: 'Hot Reload es una característica que permite ver los cambios de código casi instantáneamente sin perder el estado de la aplicación durante el desarrollo.',
        options: [
          'Es un error común que ocurre cuando la aplicación consume demasiada memoria.',
          'Es una función que optimiza el rendimiento de la aplicación en producción.',
          'Es una característica que permite ver los cambios de código casi instantáneamente sin perder el estado de la aplicación.',
        ],
        correctOptionIndex: 2,
        context: 'Flutter ofrece herramientas que mejoran significativamente la productividad de los desarrolladores durante la fase de codificación y pruebas.',
      ),
      Flashcard(
        id: '4',
        question: '¿Qué es pubspec.yaml?',
        answer: 'Es el archivo de configuración del proyecto Flutter donde se definen las dependencias, assets, fuentes y metadatos del proyecto.',
        options: [
          'Es el archivo donde se definen los estilos CSS de la aplicación.',
          'Es el archivo de configuración del proyecto Flutter donde se definen las dependencias y assets.',
          'Es un archivo que contiene el código compilado de la aplicación.',
        ],
        correctOptionIndex: 1,
        context: 'Todo proyecto Flutter contiene archivos de configuración esenciales. Uno de ellos es fundamental para definir los recursos y dependencias.',
      ),
    ],
  ),
  Topic(
    id: '2',
    title: 'JavaScript',
    description: 'Conceptos básicos y avanzados de JS',
    color: Colors.yellow.shade700,
    icon: Icons.javascript,
    flashcards: [
      Flashcard(
        id: '1',
        question: '¿Qué es el hoisting en JavaScript?',
        answer: 'Hoisting es el comportamiento predeterminado de JavaScript de mover las declaraciones al principio de su ámbito antes de la ejecución del código.',
        options: [
          'Es una técnica para optimizar el rendimiento del código JavaScript.',
          'Hoisting es el comportamiento de mover las declaraciones al principio de su ámbito antes de la ejecución.',
          'Es el proceso de compilación de JavaScript a código máquina.',
        ],
        correctOptionIndex: 1,
        context: 'JavaScript tiene comportamientos peculiares en la forma en que procesa las declaraciones antes de ejecutar el código. Esto puede afectar cómo escribimos nuestro código.',
      ),
      Flashcard(
        id: '2',
        question: '¿Cuál es la diferencia entre let, const y var?',
        answer: 'var tiene ámbito de función, mientras que let y const tienen ámbito de bloque. const no permite reasignar el valor, mientras que let sí lo permite.',
        options: [
          'var tiene ámbito de función, mientras que let y const tienen ámbito de bloque.',
          'let, const y var son exactamente iguales, solo cambia la sintaxis.',
          'const y let son versiones antiguas, mientras que var es la forma moderna de declarar variables.',
        ],
        correctOptionIndex: 0,
        context: 'En JavaScript moderno (ES6+) existen diferentes formas de declarar variables, cada una con características particulares sobre su ámbito y mutabilidad.',
      ),
      Flashcard(
        id: '3',
        question: '¿Qué es una Promise en JavaScript?',
        answer: 'Una Promise es un objeto que representa la eventual finalización o fallo de una operación asíncrona y su valor resultante.',
        options: [
          'Es una biblioteca externa para manejar peticiones HTTP.',
          'Es una función que siempre devuelve true o false.',
          'Es un objeto que representa la eventual finalización o fallo de una operación asíncrona.',
        ],
        correctOptionIndex: 2,
        context: 'JavaScript maneja operaciones asíncronas de varias formas. Desde ES6 se introdujo un patrón que simplifica considerablemente el manejo de código asíncrono.',
      ),
      Flashcard(
        id: '4',
        question: '¿Qué es el Event Loop en JavaScript?',
        answer: 'El Event Loop es un modelo de concurrencia que permite a JavaScript manejar operaciones asíncronas a pesar de ser un lenguaje de un solo hilo.',
        options: [
          'El Event Loop es un modelo de concurrencia para manejar operaciones asíncronas.',
          'Es una estructura de datos para almacenar eventos del usuario como clics.',
          'Es un patrón de diseño específico de React para manejar el estado.',
        ],
        correctOptionIndex: 0,
        context: 'JavaScript es un lenguaje de un solo hilo, pero puede manejar múltiples operaciones simultáneamente. Esto es posible gracias a un mecanismo fundamental de su arquitectura.',
      ),
    ],
  ),
  Topic(
    id: '3',
    title: 'Python',
    description: 'Fundamentos de Python',
    color: Colors.green,
    icon: Icons.code,
    flashcards: [
      Flashcard(
        id: '1',
        question: '¿Qué son los decoradores en Python?',
        answer: 'Los decoradores son funciones que modifican el comportamiento de otras funciones, métodos o clases sin cambiar su implementación.',
        options: [
          'Son funciones para decorar la interfaz gráfica de aplicaciones Python.',
          'Los decoradores son funciones que modifican el comportamiento de otras funciones.',
          'Son comentarios especiales que se usan para la documentación del código.',
        ],
        correctOptionIndex: 1,
        context: 'Python tiene características avanzadas que permiten extender o modificar el comportamiento de funciones y clases. Una de estas características es particularmente útil para aspectos como logging, autenticación y más.',
      ),
      Flashcard(
        id: '2',
        question: '¿Qué es una lista por comprensión?',
        answer: 'Es una forma concisa de crear listas basadas en listas existentes. Ejemplo: [x*2 for x in range(10)]',
        options: [
          'Es una forma concisa de crear listas basadas en listas existentes.',
          'Es una función para ordenar listas de manera eficiente.',
          'Es una técnica para entender el funcionamiento de las listas en Python.',
        ],
        correctOptionIndex: 0,
        context: 'Python ofrece sintaxis elegante para operaciones comunes con colecciones. Una de estas construcciones permite crear listas de manera más legible y compacta.',
      ),
      Flashcard(
        id: '3',
        question: '¿Cuál es la diferencia entre una tupla y una lista?',
        answer: 'Las tuplas son inmutables (no se pueden modificar después de su creación) mientras que las listas son mutables.',
        options: [
          'Las tuplas solo pueden contener números, mientras que las listas pueden contener cualquier tipo de dato.',
          'Las listas son más rápidas que las tuplas en todas las operaciones.',
          'Las tuplas son inmutables mientras que las listas son mutables.',
        ],
        correctOptionIndex: 2,
        context: 'Python tiene diferentes tipos de colecciones para almacenar datos. Dos de las más comunes se parecen en su sintaxis pero tienen diferencias cruciales en su comportamiento.',
      ),
      Flashcard(
        id: '4',
        question: '¿Qué es el GIL en Python?',
        answer: 'Global Interpreter Lock (GIL) es un mecanismo que permite que solo un hilo ejecute código Python a la vez, lo que afecta a la concurrencia en aplicaciones multiproceso.',
        options: [
          'Global Interface Library, una biblioteca estándar para crear interfaces gráficas.',
          'Global Interpreter Lock, un mecanismo que permite que solo un hilo ejecute código Python a la vez.',
          'General Input Loop, el sistema que procesa las entradas del usuario en aplicaciones de consola.',
        ],
        correctOptionIndex: 1,
        context: 'La implementación estándar de Python (CPython) tiene una característica que afecta significativamente el rendimiento de aplicaciones multi-hilo. Es importante entenderla para diseñar aplicaciones concurrentes.',
      ),
    ],
  ),
  Topic(
    id: '4',
    title: 'SQL',
    description: 'Bases de datos y consultas SQL',
    color: Colors.orange,
    icon: Icons.storage,
    flashcards: [
      Flashcard(
        id: '1',
        question: '¿Qué es una clave primaria?',
        answer: 'Una clave primaria es un campo o conjunto de campos que identifican de forma única cada registro en una tabla.',
        options: [
          'Es la contraseña principal para acceder a la base de datos.',
          'Una clave primaria es un campo que identifica de forma única cada registro en una tabla.',
          'Es el primer campo que se crea al diseñar una tabla.',
        ],
        correctOptionIndex: 1,
        context: 'En el diseño de bases de datos relacionales, es fundamental identificar cada registro de manera única. Existe un concepto específico para este propósito.',
      ),
      Flashcard(
        id: '2',
        question: '¿Cuál es la diferencia entre INNER JOIN y LEFT JOIN?',
        answer: 'INNER JOIN devuelve registros que tienen coincidencias en ambas tablas. LEFT JOIN devuelve todos los registros de la tabla izquierda y los registros coincidentes de la tabla derecha.',
        options: [
          'INNER JOIN devuelve registros que tienen coincidencias en ambas tablas.',
          'No hay diferencia, son sinónimos en SQL.',
          'INNER JOIN combina horizontalmente las tablas, mientras que LEFT JOIN las combina verticalmente.',
        ],
        correctOptionIndex: 0,
        context: 'SQL permite combinar datos de múltiples tablas. Existen diferentes tipos de JOIN que determinan qué registros se incluyen en los resultados.',
      ),
      Flashcard(
        id: '3',
        question: '¿Qué es una transacción en SQL?',
        answer: 'Una transacción es una unidad de trabajo que se ejecuta de forma atómica. O se completa totalmente o no se ejecuta ninguna parte (ACID).',
        options: [
          'Es el costo económico de ejecutar una consulta en la base de datos.',
          'Es el proceso de convertir datos de un formato a otro.',
          'Una transacción es una unidad de trabajo que se ejecuta de forma atómica.',
        ],
        correctOptionIndex: 2,
        context: 'Las bases de datos modernas necesitan mantener la integridad de los datos incluso cuando ocurren errores. SQL ofrece un mecanismo que garantiza la consistencia de operaciones complejas.',
      ),
      Flashcard(
        id: '4',
        question: '¿Qué es la normalización de bases de datos?',
        answer: 'Es el proceso de organizar los datos en una base de datos para reducir la redundancia y mejorar la integridad de los datos mediante la creación de tablas y relaciones.',
        options: [
          'Es el proceso de convertir una base de datos a su forma normal, eliminando anomalías.',
          'Es el proceso de compresión de datos para que ocupen menos espacio en disco.',
          'Es una técnica para cifrar los datos sensibles en una base de datos.',
        ],
        correctOptionIndex: 0,
        context: 'El diseño eficiente de bases de datos sigue ciertos principios para evitar problemas como la redundancia y las anomalías de actualización. Existe un proceso formal para estructurar correctamente los datos.',
      ),
    ],
  ),
]; 