// ==========================================
// Dart 3.13+ Primary Constructor Example
// ==========================================

// ✅ 1. With 'final': Stored as fields (Recommended)
// Accessible via .name and .age from outside the class
class UserWithFinalParam(final String name, final int age);

// ❌ 2. Without 'final': Temporary constructor arguments
// NOT stored as properties, so inaccessible from outside
class UserWithoutFinalParam(String name, int age);
// class UserWithoutFinalParam(String rawName, int age) {
//    final String name = rawName; 
//    // ❌ Compile error: 'name' isn't defined for the class
//    // String get name => rawName;
// }

// ⭕️ 3. User3: With methods and getters accessing parameters
class User3(final String name, final int age) {

  // Accessible from inside class methods!
  void introduce() {
    print('Hello, I am $name, $age years old.');
  }

  // Also accessible from getters or computed properties
  bool get isAdult => age >= 18;

  // ❌ Cannot define a setter (final parameters are immutable)
  // set setAge(int value) {
  //   age = value; // ❌ Compile error: The final variable 'age' can't be set.
  // }
}

void main() {
  // --- Case 1: With 'final' ---
  final user1 = UserWithFinalParam('Alice', 25);
  print('User 1 Name: ${user1.name}'); // ⭕️ Accessible!
  print('User 1 Age: ${user1.age}');   // ⭕️ Accessible!

  // --- Case 2: Without 'final' ---
  final user2 = UserWithoutFinalParam('Bob', 30);
  
  // Compile error: The getter 'name' isn't defined for the class 'UserWithoutFinalParam'
  // print(user2.name); 

  // --- Case 3: User3 ---
  final user3 = User3('Charlie', 20);
  user3.introduce(); // ⭕️ Accessible!
  // user3.setAge = 100; // ❌ Compile error
  print(user3.isAdult); // ⭕️ Accessible!
}
