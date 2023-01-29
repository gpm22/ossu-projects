package com.example.sharingapp;

import android.content.Context;
import android.support.annotation.NonNull;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.TextView;

import java.util.ArrayList;

/**
 * ContactAdapter is responsible setting for what information is displayed in ListView entries.
 */
public class ContactAdapter extends ArrayAdapter<Contact> {

    final private Context context;

    public ContactAdapter(Context context, ArrayList<Contact> contacts) {
        super(context, 0, contacts);
        this.context = context;
    }

    @Override
    public View getView(int position, View convertView, @NonNull ViewGroup parent) {

        // getItem(position) gets the "contact" at "position" in the "contacts" ArrayList
        // (where "contacts" is a parameter in the ContactAdapter creator as seen above ^^)
        Contact contact = getItem(position);

        assert contact != null;
        String username = "Username: " + contact.getUsername();
        String email = "Email: " + contact.getEmail();

        // Check if an existing view is being reused, otherwise inflate the view.
        if (convertView == null) {
            convertView = LayoutInflater.from(context).inflate(R.layout.contactlist_contact, parent, false);
        }

        TextView username_tv = convertView.findViewById(R.id.username_tv);
        TextView email_tv = convertView.findViewById(R.id.email_tv);
        ImageView photo = convertView.findViewById(R.id.contacts_image_view);

        photo.setImageResource(android.R.drawable.ic_menu_gallery);

        username_tv.setText(username);
        email_tv.setText(email);

        return convertView;
    }
}
