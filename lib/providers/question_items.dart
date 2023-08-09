import 'package:flutter/cupertino.dart';
import 'package:quiz_app/providers/question.dart';

class QuizItems with ChangeNotifier {
  final List<Question> _gkItems = [
    Question(
      question: "1. Which animal is known as the 'Ship of the Desert'?",
      image: 'gkImages/desert.jpg',
      options: [
        Option(text: 'Camel', isCorrect: true),
        Option(text: 'Horse', isCorrect: false),
        Option(text: 'Zebra', isCorrect: false),
        Option(text: 'Giraffe', isCorrect: false),
      ],
    ),
    Question(
      question: "2. How many days are there in a week?",
      image: 'gkImages/week.jpg',
      options: [
        Option(text: '8 days', isCorrect: false),
        Option(text: '7 days', isCorrect: true),
        Option(text: '6 days', isCorrect: false),
        Option(text: '5 days', isCorrect: false),
      ],
    ),
    Question(
      question: "3. How many hours are there in a day?",
      image: 'gkImages/clock.png',
      options: [
        Option(text: '12 hours', isCorrect: false),
        Option(text: '15 hours', isCorrect: false),
        Option(text: '20 hours', isCorrect: false),
        Option(text: '24 hours', isCorrect: true),
      ],
    ),
    Question(
      question: "4. How many letters are there in the English alphabet?",
      image: 'gkImages/alphabets.jpg',
      options: [
        Option(text: '24', isCorrect: false),
        Option(text: '25', isCorrect: false),
        Option(text: '26', isCorrect: true),
        Option(text: '27', isCorrect: false),
      ],
    ),
    Question(
      question: "5. Rainbow consist of how many colours?",
      image: 'gkImages/rainbow.png',
      options: [
        Option(text: '8', isCorrect: false),
        Option(text: '5', isCorrect: false),
        Option(text: '3', isCorrect: false),
        Option(text: '7', isCorrect: true),
      ],
    ),
    Question(
      question: "6. Baby frog is known as.......",
      image: 'gkImages/frog.jpg',
      options: [
        Option(text: 'Tadpole', isCorrect: true),
        Option(text: 'Amoeba', isCorrect: false),
        Option(text: 'Larva', isCorrect: false),
        Option(text: 'Embryo', isCorrect: false),
      ],
    ),
    Question(
      question: "7. How many consonants are there in the English alphabet?",
      image: 'gkImages/consonents.png',
      options: [
        Option(text: '18', isCorrect: false),
        Option(text: '19', isCorrect: false),
        Option(text: '20', isCorrect: false),
        Option(text: '21', isCorrect: true),
      ],
    ),
    Question(
      question: "8. Which animal is known as the king of the jungle?",
      image: 'gkImages/jungle.jpg',
      options: [
        Option(text: 'Tiger', isCorrect: false),
        Option(text: 'Elephant', isCorrect: false),
        Option(text: 'Lion', isCorrect: true),
        Option(text: 'Fox', isCorrect: false),
      ],
    ),
    Question(
      question: "9. Name the National bird of India?",
      image: 'gkImages/bird.jpg',
      options: [
        Option(text: 'Parrot', isCorrect: false),
        Option(text: 'Peacock', isCorrect: true),
        Option(text: 'Swan', isCorrect: false),
        Option(text: 'Eagle', isCorrect: false),
      ],
    ),
    Question(
      question: "10. Who designed the National Flag of India?",
      image: 'gkImages/flag.jpg',
      options: [
        Option(text: 'Pingali Venkayya', isCorrect: true),
        Option(text: 'Mahatma Gandhi', isCorrect: false),
        Option(text: 'Jawaharlal Nehru', isCorrect: false),
        Option(text: 'Bhagat Singh', isCorrect: false),
      ],
    ),
  ];

  final List<Question> _scienceItems = [
    Question(
      question: "1. What is the biggest planet in our solar system?",
      image: 'stImages/jupiter.jpg',
      options: [
        Option(text: 'Mars', isCorrect: false),
        Option(text: 'Jupiter', isCorrect: true),
        Option(text: 'Venus', isCorrect: false),
        Option(text: 'Earth', isCorrect: false),
      ],
    ),
    Question(
      question: "2. What is the chemical symbol for the element oxygen?",
      image: 'stImages/oxygen.jpg',
      options: [
        Option(text: 'O', isCorrect: true),
        Option(text: 'CO', isCorrect: false),
        Option(text: 'N', isCorrect: false),
        Option(text: 'Zn', isCorrect: false),
      ],
    ),
    Question(
      question: "3. Another name for a tidal wave is a?",
      image: 'stImages/tsunami.jpg',
      options: [
        Option(text: 'Cyclone', isCorrect: false),
        Option(text: 'Tsunami', isCorrect: true),
        Option(text: 'Small wave', isCorrect: false),
        Option(text: 'Flood', isCorrect: false),
      ],
    ),
    Question(
      question: "4. What is the name of the part of the human skeleton which protects our brain?",
      image: 'stImages/brain.jpg',
      options: [
        Option(text: 'Head', isCorrect: false),
        Option(text: 'Skull', isCorrect: true),
        Option(text: 'Face', isCorrect: false),
        Option(text: 'Skin', isCorrect: false),
      ],
    ),
    Question(
      question: "5. What is the 7th element on the periodic table of elements?",
      image: 'stImages/nitrogen.jpg',
      options: [
        Option(text: 'Oxygen', isCorrect: false),
        Option(text: 'Carbon', isCorrect: false),
        Option(text: 'Nitrogen', isCorrect: true),
        Option(text: 'Helium', isCorrect: false),
      ],
    ),
    Question(
      question: "6. What is the name of the long appendage that hangs from an elephants face?",
      image: 'stImages/elephant.jpg',
      options: [
        Option(text: 'Nose', isCorrect: false),
        Option(text: 'A trunk', isCorrect: true),
        Option(text: 'Mouth', isCorrect: false),
        Option(text: 'Tail', isCorrect: false),
      ],
    ),
    Question(
      question: "7. The highest mountain on earth is?",
      image: 'stImages/everest.jpg',
      options: [
        Option(text: 'Kilimanjaro', isCorrect: false),
        Option(text: 'Mount Everest', isCorrect: true),
        Option(text: 'Himalayas', isCorrect: false),
        Option(text: 'K2', isCorrect: false),
      ],
    ),
    Question(
      question: "8. What is the name of the closest star to the earth?",
      image: 'stImages/moon.jpg',
      options: [
        Option(text: 'The moon', isCorrect: false),
        Option(text: 'The sun', isCorrect: true),
        Option(text: 'Jupiter', isCorrect: false),
        Option(text: 'Saturn', isCorrect: false),
      ],
    ),
    Question(
      question: "9. Pure water has a pH level of a around?",
      image: 'stImages/water.jpeg',
      options: [
        Option(text: '5', isCorrect: false),
        Option(text: '6', isCorrect: false),
        Option(text: '7', isCorrect: true),
        Option(text: '8', isCorrect: false),
      ],
    ),
    Question(
      question: "10. How many bones do sharks have in their bodies?",
      image: 'stImages/shark.jpg',
      options: [
        Option(text: '0', isCorrect: false),
        Option(text: '206', isCorrect: false),
        Option(text: '350', isCorrect: false),
        Option(text: '421', isCorrect: false),
      ],
    ),
  ];

  final List<Question> _mathItems = [
    Question(
      question: "1. What is the next prime number after 7?",
      image: 'mathImages/prime.jpg',
      options: [
        Option(text: '5', isCorrect: false),
        Option(text: '9', isCorrect: false),
        Option(text: '11', isCorrect: true),
        Option(text: '13', isCorrect: false),
      ],
    ),
    Question(
      question: "2. The perimeter of a circle is also known as what?",
      image: 'mathImages/circle.jpg',
      options: [
        Option(text: 'Circumference', isCorrect: true),
        Option(text: 'Area', isCorrect: false),
        Option(text: 'Volume', isCorrect: false),
        Option(text: 'Perimeter', isCorrect: false),
      ],
    ),
    Question(
      question: "3. 65 – 43 = ?",
      image: 'mathImages/65-43.jpg',
      options: [
        Option(text: '32', isCorrect: false),
        Option(text: '22', isCorrect: true),
        Option(text: '25', isCorrect: false),
        Option(text: '18', isCorrect: false),
      ],
    ),
    Question(
      question: "4. 52 divided by 4 equals what?",
      image: 'mathImages/524.jpg',
      options: [
        Option(text: '13', isCorrect: true),
        Option(text: '15', isCorrect: false),
        Option(text: '22', isCorrect: false),
        Option(text: '24', isCorrect: false),
      ],
    ),
    Question(
      question: "5. 87 + 56 = ?",
      image: 'mathImages/87+56.jpg',
      options: [
        Option(text: '141', isCorrect: false),
        Option(text: '142', isCorrect: false),
        Option(text: '143', isCorrect: true),
        Option(text: '144', isCorrect: false),
      ],
    ),
    Question(
      question: "6. What is the next number in the Fibonacci sequence: 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, ?",
      image: 'mathImages/Fibonacci.png',
      options: [
        Option(text: '53', isCorrect: false),
        Option(text: '56', isCorrect: false),
        Option(text: '51', isCorrect: false),
        Option(text: '55', isCorrect: true),
      ],
    ),
    Question(
      question: "7. 5 to the power of 0 equals what?",
      image: 'mathImages/5power0.jpg',
      options: [
        Option(text: '0', isCorrect: false),
        Option(text: '1', isCorrect: true),
        Option(text: '5', isCorrect: false),
        Option(text: '25', isCorrect: false),
      ],
    ),
    Question(
      question: "8. Which number means we have nothing?",
      image: 'mathImages/nothing.jpg',
      options: [
        Option(text: '1', isCorrect: false),
        Option(text: '0', isCorrect: true),
        Option(text: '2', isCorrect: false),
        Option(text: '-1', isCorrect: false),
      ],
    ),
    Question(
      question: "9. What is the largest number of these: 1, 14, 7, 11?",
      image: 'mathImages/largest.jpg',
      options: [
        Option(text: '14', isCorrect: true),
        Option(text: '11', isCorrect: false),
        Option(text: '7', isCorrect: false),
        Option(text: '1', isCorrect: false),
      ],
    ),
    Question(
      question: "10. Which shape has three corners?",
      image: 'mathImages/triangle.jpg',
      options: [
        Option(text: 'Square', isCorrect: false),
        Option(text: 'Triangle', isCorrect: true),
        Option(text: 'Pentagon', isCorrect: false),
        Option(text: 'Rectangle', isCorrect: false),
      ],
    ),
  ];

  final List<Question> _guessItems = [
    Question(
      question: "1. LO_LI_OP",
      image: 'guessImages/lollipop.jpg',
      options: [
        Option(text: 'L,I', isCorrect: false),
        Option(text: 'I,L', isCorrect: false),
        Option(text: 'P,L', isCorrect: false),
        Option(text: 'L,P', isCorrect: true),
      ],
    ),
    Question(
      question: "2. _ON_EY",
      image: 'guessImages/monkey.jpg',
      options: [
        Option(text: 'K,M', isCorrect: false),
        Option(text: 'N,K', isCorrect: false),
        Option(text: 'M,K', isCorrect: true),
        Option(text: 'D,K', isCorrect: false),
      ],
    ),
    Question(
      question: "3. REV__UT_ON",
      image: 'guessImages/revolution.png',
      options: [
        Option(text: 'M,K,G', isCorrect: false),
        Option(text: 'C,L,I', isCorrect: false),
        Option(text: 'F,K,C', isCorrect: false),
        Option(text: 'O,L,I', isCorrect: true),
      ],
    ),
    Question(
      question: "4. _I_N_",
      image: 'guessImages/piano.jpg',
      options: [
        Option(text: 'K,S,T', isCorrect: false),
        Option(text: 'D,I,L', isCorrect: false),
        Option(text: 'P,A,O', isCorrect: true),
        Option(text: 'G,I,N', isCorrect: false),
      ],
    ),
    Question(
      question: "5. C__P_T_R",
      image: 'guessImages/computer.jpeg',
      options: [
        Option(text: 'O,M,U,E', isCorrect: true),
        Option(text: 'O,M.D.F', isCorrect: false),
        Option(text: 'O,C,U,E', isCorrect: false),
        Option(text: 'O,K,K,S', isCorrect: false),
      ],
    ),
    Question(
      question: "6. C_C_MB_R",
      image: 'guessImages/cucumber.jpg',
      options: [
        Option(text: 'U,U,E', isCorrect: true),
        Option(text: 'O,O,E', isCorrect: false),
        Option(text: 'U,O,E', isCorrect: false),
        Option(text: 'O,U,E', isCorrect: false),
      ],
    ),
    Question(
      question: "7. LA_OR_T__Y",
      image: 'guessImages/lab.jpeg',
      options: [
        Option(text: 'B,A,O,G', isCorrect: false),
        Option(text: 'C,A,O,R', isCorrect: false),
        Option(text: 'R,K,S,O', isCorrect: false),
        Option(text: 'B,A,O,R', isCorrect: true),
      ],
    ),
    Question(
      question: "8. BA__E_",
      image: 'guessImages/barrel.jpg',
      options: [
        Option(text: 'R,S,L', isCorrect: false),
        Option(text: 'R,R,L', isCorrect: true),
        Option(text: 'C,R,L', isCorrect: false),
        Option(text: 'R,O,D', isCorrect: false),
      ],
    ),
    Question(
      question: "9. U_B_E_LA",
      image: 'guessImages/umbrella.jpg',
      options: [
        Option(text: 'C,O,L', isCorrect: false),
        Option(text: 'R,I,N', isCorrect: false),
        Option(text: 'M,R,L', isCorrect: true),
        Option(text: 'C,A,N', isCorrect: false),
      ],
    ),
    Question(
      question: "10. _I_H_",
      image: 'guessImages/eight.png',
      options: [
        Option(text: 'E,G,T', isCorrect: true),
        Option(text: 'F,G,T', isCorrect: false),
        Option(text: 'K,I,T', isCorrect: false),
        Option(text: 'E,G,I', isCorrect: false),
      ],
    ),
  ];

  List<Question> get gkItems {
    return [..._gkItems];
  }

  List<Question> get scienceItems {
    return [..._scienceItems];
  }

  List<Question> get mathItems {
    return [..._mathItems];
  }

  List<Question> get guessItems {
    return [..._guessItems];
  }
}
