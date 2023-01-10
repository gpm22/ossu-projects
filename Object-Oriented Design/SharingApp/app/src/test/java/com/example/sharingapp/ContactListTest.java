package com.example.sharingapp;

import junit.framework.Assert;

import org.junit.Before;
import org.junit.Test;

import java.util.ArrayList;
import java.util.Arrays;

public class ContactListTest {

    private ArrayList<Contact> contacts;
    private  ContactList contactList;

    @Before
    public void init(){

        Contact contact1 = new Contact("a", "a", "a");
        Contact contact2 = new Contact("b", "b", "b");
        contacts = new ArrayList<>(Arrays.asList(contact1, contact2));

        contactList = new ContactList();
    }

    @Test
    public void testSetAndGetContacts() {

        contactList.setContacts(contacts);
        Assert.assertEquals(contactList.getContacts(), contacts);
    }

    @Test
    public void testGetAllUsernames() {

        Assert.assertEquals(new ArrayList<>(), contactList.getAllUsernames());
        contactList.setContacts(contacts);
        Assert.assertEquals(new ArrayList<>(Arrays.asList("a", "b")), contactList.getAllUsernames());

    }

    @Test
    public void testAddContactAndGetContactByUsername() {
        Contact contact = new Contact("c", "c", "c");
        contactList.addContact(contact);
        Assert.assertEquals(contact,contactList.getContactByUsername("c"));
    }

    @Test
    public void testDeleteContact() {
        contactList.setContacts(contacts);

        Assert.assertEquals(contacts,contactList.getContacts());

        contactList.deleteContact(contactList.getContactByUsername("a"));
        contactList.deleteContact(contactList.getContactByUsername("b"));

        Assert.assertEquals(new ArrayList<Contact>(), contactList.getContacts());
    }

    @Test
    public void testGetContact() {
        contactList.setContacts(contacts);

        Assert.assertEquals(contactList.getContactByUsername("a"), contactList.getContact(0));
    }

    @Test
    public void testGetSize() {
        Assert.assertEquals(0, contactList.getSize());
        contactList.setContacts(contacts);
        Assert.assertEquals(2, contactList.getSize());
    }

    @Test
    public void testGetIndex() {
        Contact contact = new Contact("c", "c", "c");
        Assert.assertEquals(-1, contactList.getIndex(contact));
        contacts.add(contact);
        contactList.setContacts(contacts);
        Assert.assertEquals(2, contactList.getIndex(contact));
    }

    @Test
    public void testHasContact() {

        Contact contact = new Contact("c", "c", "c");
        Assert.assertEquals(false, contactList.hasContact(contact));
        contacts.add(contact);
        contactList.setContacts(contacts);
        Assert.assertEquals(true, contactList.hasContact(contact));
    }

    @Test
    public void testIsUsernameAvailable() {
        Assert.assertEquals(true, contactList.isUsernameAvailable("a"));
        contactList.setContacts(contacts);
        Assert.assertEquals(false, contactList.isUsernameAvailable("a"));
    }
}