class Note {
  int id;
  String title;
  String content;
  DateTime modifiedTime;

  Note({
    required this.id,
    required this.title,
    required this.content,
    required this.modifiedTime,
  });
}

List<Note> sampleNotes = [
  Note(
    id: 0,
    title: 'Benefits Of Time Management',
    content:
        'Time management is the process organising and planning how\nto divide your time between specific activities and priorities.\nThe benefits of time management include better habits and greater productivity.',
    modifiedTime: DateTime(2024, 1, 1, 34, 5),
  ),
  Note(
    id: 1,
    title: 'Recipes to Try',
    content:
        '1. Chicken Alfredo\n2. Vegan chili\n3. Spaghetti carbonara\n4. Chocolate lava cake',
    modifiedTime: DateTime(2022, 1, 1, 34, 5),
  ),
  Note(
    id: 2,
    title: 'Books to Read',
    content:
        '1. To Kill a Mockingbird\n2. 1984\n3. The Great Gatsby\n4. The Catcher in the Rye',
    modifiedTime: DateTime(2023, 3, 1, 19, 5),
  ),
  Note(
    id: 3,
    title: 'Discipline Habits',
    content: 'It means doing what you have to do, even when you dont want to do it.\nDiscipline is an effective habit and effective habits lead to effective results.\nConversely, ineffective habits produce ineffective results.',
    modifiedTime: DateTime(2023, 1, 4, 16, 53),
  ),
  Note(
    id: 4,
    title: 'Workout Plan',
    content:
        'Monday:\n- Run 5 miles\n- Yoga class\nTuesday:\n- HIIT circuit training\n- Swimming laps\nWednesday:\n- Rest day\nThursday:\n- Weightlifting\n- Spin class\nFriday:\n- Run 3 miles\n- Pilates class\nSaturday:\n- Hiking\n- Rock climbing',
    modifiedTime: DateTime(2023, 5, 1, 11, 6),
  ),
  Note(
    id: 5,
    title: 'Bucket List',
    content:
        'What should I write on my bucket list?\n Include anything you like on your bucket list.\nList career goals, travel destinations, health, finance, or relationship goals.\n It can be as long or as short as you want. Really, if you can dream it, you can do it.',
    modifiedTime: DateTime(2023, 1, 6, 13, 9),
  ),
  Note(
    id: 6,
    title: 'Motivational Books To Read',
    content:
        "“Atomic Habits” by James Clear. \n“The Power of Habit” by Charles Duhigg.\n“Big Magic: Creative Living Beyond Fear” by Elizabeth Gilbert\n“The Intentional Year: Simple Rhythms for Finding Freedom, Peace and Purpose” by Holly and Glenn Packaim",
    modifiedTime: DateTime(2023, 3, 7, 11, 12),
  ),
  Note(
    id: 7,
    title: 'Meeting Notes',
    content:
        'Attendees: John, Mary, David\nAgenda:\n- Budget review\n- Project updates\n- Upcoming events',
    modifiedTime: DateTime(2023, 2, 1, 15, 14),
  ),
  Note(
    id: 8,
    title: 'Ideas for Vacation',
    content:
        '1. Visit Grand Canyon\n2. Go on a hot air balloon ride\n3. Try local cuisine\n4. Attend a concert',
    modifiedTime: DateTime(2023, 2, 1, 12, 34),
  ),
];
