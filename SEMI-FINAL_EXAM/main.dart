// Name:
// Date: March 2026
// System: Sari-Sari Store Inventory System (Console-Based CRUD)

import 'dart:io';

List<Map<String, dynamic>> inventory = [];
int idCounter = 1;

// Pause function
void pause() {
  stdout.write("\nPress Enter to continue...");
  stdin.readLineSync();
}

// CREATE
void createItem() {
  print("\n=== ADD NEW PRODUCT ===");

  stdout.write("Enter product name: ");
  String name = stdin.readLineSync()!;

  stdout.write("Enter price: ");
  double price = double.parse(stdin.readLineSync()!);

  stdout.write("Enter stock quantity: ");
  int stock = int.parse(stdin.readLineSync()!);

  inventory.add({
    "id": idCounter++,
    "name": name,
    "price": price,
    "stock": stock,
  });

  print("\n✅ Product added successfully!");
  pause();
}

// READ
void viewItems() {
  print("\n=== PRODUCT LIST ===");

  if (inventory.isEmpty) {
    print("No products available.");
  } else {
    for (var item in inventory) {
      print(
        "ID: ${item['id']} | Name: ${item['name']} | Price: ${item['price']} | Stock: ${item['stock']}",
      );
    }
  }

  pause();
}

// UPDATE
void updateItem() {
  print("\n=== UPDATE PRODUCT ===");

  stdout.write("Enter product ID to update: ");
  int id = int.parse(stdin.readLineSync()!);

  for (var item in inventory) {
    if (item['id'] == id) {
      print("\nEnter new details:");

      stdout.write("New name: ");
      item['name'] = stdin.readLineSync()!;

      stdout.write("New price: ");
      item['price'] = double.parse(stdin.readLineSync()!);

      stdout.write("New stock: ");
      item['stock'] = int.parse(stdin.readLineSync()!);

      print("\n✅ Product updated!");
      pause();
      return;
    }
  }

  print("\n❌ Product not found.");
  pause();
}

// DELETE
void deleteItem() {
  print("\n=== DELETE PRODUCT ===");

  stdout.write("Enter product ID to delete: ");
  int id = int.parse(stdin.readLineSync()!);

  inventory.removeWhere((item) => item['id'] == id);

  print("\n✅ Product deleted (if ID existed).");
  pause();
}

// MENU
void showMenu() {
  print("\n===============================");
  print(" SARI-SARI STORE INVENTORY");
  print("===============================");
  print("1. Add Product");
  print("2. View Products");
  print("3. Update Product");
  print("4. Delete Product");
  print("5. Exit");
  print("===============================");
}

void main() {
  while (true) {
    showMenu();

    stdout.write("Choose an option (1-5): ");
    String choice = stdin.readLineSync()!;

    switch (choice) {
      case '1':
        createItem();
        break;
      case '2':
        viewItems();
        break;
      case '3':
        updateItem();
        break;
      case '4':
        deleteItem();
        break;
      case '5':
        print("\nExiting system...");
        return;
      default:
        print("\nInvalid choice. Try again.");
        pause();
    }
  }
}
