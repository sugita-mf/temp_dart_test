// ==========================================
// Dart 3.13+ Primary Constructor Example
// ==========================================

// ✅ 1. With 'final': Stored as fields (Recommended)
// Accessible via .name and .age from outside the class
class UserWithFields(final String name, final int age);

// ❌ 2. Without 'final': Temporary constructor arguments
// NOT stored as properties, so inaccessible from outside
class UserWithoutFields(String name, int age);
// class UserWithoutFields(String rawName, int age) {
//   final String name = rawName; 
// }

void main() {
  // --- Case 1: With 'final' ---
  final user1 = UserWithFields('Alice', 25);
  print('User 1 Name: ${user1.name}'); // ⭕️ Accessible!
  print('User 1 Age: ${user1.age}');   // ⭕️ Accessible!

  // --- Case 2: Without 'final' ---
  final user2 = UserWithoutFields('Bob', 30);
  
  // Compile error: The getter 'name' isn't defined for the class 'UserWithoutFields'
  // print(user2.name); 
}
