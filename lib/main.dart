
import 'package:flutter/material.dart';

void main() {
  runApp(const DirectoryApp());
}

// Student stores information using fixed fields.
class Student {
  final String name;
  final String course;
  final int yearLevel;
  final String email;

  const Student({
    required this.name,
    required this.course,
    required this.yearLevel,
    required this.email,
  });
}

// Hard-coded list of five sample students.
const List<Student> students = [
  Student(
    name: 'Lovely Joy Rozano',
    course: 'BS Information Technology',
    yearLevel: 3,
    email: 'lovely.rozano@school.edu',
  ),
  Student(
    name: 'Yaohan Macoto',
    course: 'BS Computer Science',
    yearLevel: 2,
    email: 'yaohan.macoto@school.edu',
  ),
  Student(
    name: 'Jana Torino',
    course: 'BS Information Systems',
    yearLevel: 4,
    email: 'jana.torino@school.edu',
  ),
  Student(
    name: 'Jelyn Tac an',
    course: 'BS Computer Engineering',
    yearLevel: 1,
    email: 'jelyn.tacan@school.edu',
  ),
  Student(
    name: 'Euanice Ann Galon',
    course: 'BS Software Engineering',
    yearLevel: 2,
    email: 'euanice.galon@school.edu',
  ),
];

// Stateless because it uses a fixed theme and home screen.
class DirectoryApp extends StatelessWidget {
  const DirectoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Customization 1: green app theme.
      theme: ThemeData(
        colorSchemeSeed: const Color(0xFF247447),
        useMaterial3: true,
      ),
      home: const DirectoryScreen(),
    );
  }
}

// Stateless because it displays the supplied student list.
class DirectoryScreen extends StatelessWidget {
  const DirectoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Campus Directory'),
        centerTitle: true,
        // Customization 2: green AppBar and white text.
        backgroundColor: const Color(0xFF247447),
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SectionHeader(title: 'Students'),
          const SizedBox(height: 12),
          for (final student in students)
            StudentCard(student: student),
        ],
      ),
    );
  }
}

// Stateless because the title comes from its constructor.
class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xFF247447),
          ),
        ),
        const Divider(
          thickness: 2,
          color: Color(0xFF247447),
        ),
      ],
    );
  }
}

// Stateless because the Student object is passed by its parent.
class StudentCard extends StatelessWidget {
  final Student student;

  const StudentCard({
    super.key,
    required this.student,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      // Customization 3: rounded corners and card elevation.
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              // Customization 4: green avatar with white initial.
              radius: 27,
              backgroundColor: const Color(0xFF247447),
              child: Text(
                student.name[0].toUpperCase(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    student.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                 // Customization 5: make the course text smaller and softer.
Text(
  student.course,
  style: const TextStyle(
    fontSize: 14,
    color: Colors.black54,
  ),
),
                  const SizedBox(height: 10),
                  InfoRow(
                    icon: Icons.school,
                    text: 'Year Level: ${student.yearLevel}',
                  ),
                  const SizedBox(height: 6),
                  InfoRow(
                    icon: Icons.email,
                    text: student.email,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Stateless because the icon and text are passed to the widget.
class InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const InfoRow({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 18,
          color: const Color(0xFF247447),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 13),
          ),
        ),
      ],
    );
  }
}



