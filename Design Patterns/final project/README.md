# Final Project

## Part 1

Use the given code base to identify two code smells that are described in the Anti Patterns & Code Smells lecture -- **excluding Long Method**.

For each of the two code smells you have identified:

- Document them by clearly stating where the code smell is (which class, which method, etc.)
- Which code smell from the lecture it is, and why you think the code fits the description of the code smell.
- Give your reasoning on why each code smell is a problem and should be fixed.
- Suggest a solution to fix the code smell.

**Answer**

### Code Smell 1: Comments

The methods `EditContactActivity.saveContact` and `EditItemActivity.toggleSwitch`  have a lot of unnecessary comments. 

This a problem, as comments might get out of sync as the code changes.

The solution is remove the unnecessary comments and create methods with an explicit name to be used in the place, as an example:

We would change from 

```java
public void toggleSwitch(View view){
	if (status.isChecked()) {
    	// Means was previously borrowed, switch was toggled to available
        ...
```

to

```java
private boolean isItemPreviousBorrowed(){
    return status.isChecked();
}

public void toggleSwitch(View view){
	if (isItemPreviousBorrowed()) {
        ...
```



### Code Smell 2: Duplicated Code

The methods `ContactList.loadContacts` and `ContactList.loadItems` are respectively duplicated code of the methods `ItemList.loadContacts` and `ItemList.loadItems`:

```java
//ContactList class
public void loadContacts(Context context){

    try {
        FileInputStream fis = context.openFileInput(FILENAME);
        InputStreamReader isr = new InputStreamReader(fis);
        Gson gson = new Gson();
        Type listType = new TypeToken<ArrayList<Contact>>() {}.getType();
        contacts = gson.fromJson(isr, listType); // temporary
        fis.close();
    } catch (IOException e) {
        contacts = new ArrayList<>();
    }
}

public void saveContacts(Context context){

    try {
        FileOutputStream fos = context.openFileOutput(FILENAME, 0);
        OutputStreamWriter osw = new OutputStreamWriter(fos);
        Gson gson = new Gson();
        gson.toJson(contacts, osw);
        osw.flush();
        fos.close();
    } catch (IOException e) {
        e.printStackTrace();
    }
}

//ItemList class
    public void loadItems(Context context) {

        try {
            FileInputStream fis = context.openFileInput(FILENAME);
            InputStreamReader isr = new InputStreamReader(fis);
            Gson gson = new Gson();
            Type listType = new TypeToken<ArrayList<Item>>() {}.getType();
            items = gson.fromJson(isr, listType); // temporary
            fis.close();
        } catch (IOException e) {
            items = new ArrayList<>();
        }
    }

    public void saveItems(Context context) {
        try {
            FileOutputStream fos = context.openFileOutput(FILENAME, 0);
            OutputStreamWriter osw = new OutputStreamWriter(fos);
            Gson gson = new Gson();
            gson.toJson(items, osw);
            osw.flush();
            fos.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
```

The codes are the same, so a difference in one of them would have to be replicated in the other one.

The solution is to extract the logic of both methods in a management storage class.

## Part 2

In this second part of the assignment, the code smell you will be fixing is Long Method. 

To fix this code smell, you will Implement a `validateInput()` method in the following activities:

- `AddItemActivity`
- `EditItemActivity`
- `AddContactActivity`
- `EditContactActivity`

These four activities all contain “save” methods that consist of several lines of code for validating user input. The lines of code responsible for validating the input should be moved to the `validateInput()` method. This new method can then be called from inside the save method. 

**Answer**

The code is on [SharingApp](https://github.com/gpm22/ossu-projects/tree/main/Design%20Patterns/final%20project/SharingApp).

