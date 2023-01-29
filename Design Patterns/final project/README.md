# Final Project

## Part 1

Use the given code base to identify two code smells that are described in the Anti Patterns & Code Smells lecture -- **excluding Long Method**.

For each of the two code smells you have identified:

- Document them by clearly stating where the code smell is (which class, which method, etc.)
- Which code smell from the lecture it is, and why you think the code fits the description of the code smell.
- Give your reasoning on why each code smell is a problem and should be fixed.
- Suggest a solution to fix the code smell.

**Answer**

## Part 2

In this second part of the assignment, the code smell you will be fixing is Long Method. 

To fix this code smell, you will Implement a `validateInput()` method in the following activities:

- `AddItemActivity`
- `EditItemActivity`
- `AddContactActivity`
- `EditContactActivity`

These four activities all contain “save” methods that consist of several lines of code for validating user input. The lines of code responsible for validating the input should be moved to the `validateInput()` method. This new method can then be called from inside the save method. 

**Answer**

The code is the in 