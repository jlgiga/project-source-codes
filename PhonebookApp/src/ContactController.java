
import java.sql.*;
import java.util.ArrayList;
import java.util.List;


import org.euniceruiz.dbConnection.DatabaseConnection;
import org.euniceruiz.phonebook.Contact;

public class ContactController {
	private Connection connection = null;
	private ResultSet resultSet = null;
	private Statement statement = null;
	
	public void addContact(Contact contact) {
		String name, email, contactNum, query;
		
		name = contact.getName();
		email = contact.getEmail();
		contactNum = contact.getContactNum();
		
		query = "INSERT INTO contacts(name, email, contactnum) " +
				"VALUES('" +name+ "', '" +email+ "', '" +contactNum+ "')";
		
		try{
			connection = DatabaseConnection.getConnection();
			statement = connection.createStatement();
			statement.executeUpdate(query);
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void deleteContact(int id) {
		String query;
		
		query = "delete from contacts where id = '" +id+ "'";
		try{
			connection = DatabaseConnection.getConnection();
			statement = connection.createStatement();
			statement.executeUpdate(query);
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public List<Contact> displayAll(){
		List<Contact> contacts = new ArrayList<Contact>();
		String query;
		
		query = "Select * from contacts";
		
		try{
			connection =DatabaseConnection.getConnection();
			statement = connection.createStatement();
			resultSet = statement.executeQuery(query);
		
			while (resultSet.next()) {
				Contact contact = new Contact();
				
				contact.setId(resultSet.getInt("id"));
				contact.setName(resultSet.getString("name"));
				contact.setContactNum(resultSet.getString("contactNum"));
				contact.setEmail(resultSet.getString("email"));
				contacts.add(contact);
			}
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		
		return contacts;

	}
	
	public void updateContact(Contact contact) {
		String name, email, contactNum, query;
		int id;
		
		name = contact.getName();
		email = contact.getEmail();
		contactNum = contact.getContactNum();
		id = contact.getId();
		
		query = "Update contacts set name='" +name+ "', email = '" +email+ "'," +
				" contactnum = '" +contactNum+ "' where id='" +id+ "'";
		
		try{
			connection = DatabaseConnection.getConnection();
			statement = connection.createStatement();
			statement.executeUpdate(query);
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public Contact getContactById(int id) {
		Contact contact = new Contact();
		String query; 
		
		query = "select * from contacts where id = '" + id + "'";
		
		try {
			connection = DatabaseConnection.getConnection();
			statement = connection.createStatement();
			resultSet = statement.executeQuery(query);
			
			if (resultSet.next()) {
				contact.setId(resultSet.getInt("id"));
				contact.setName(resultSet.getString("name"));
				contact.setContactNum(resultSet.getString("contactNum"));
				contact.setEmail(resultSet.getString("email"));
			}
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}

		return contact;
	}
	
	public List<Contact> searchByName(String name){
		List<Contact> contacts = new ArrayList<Contact>();
		String query;
		
		query = "Select * from contacts where name='" + name + "'";
		
		try{
			connection =DatabaseConnection.getConnection();
			statement = connection.createStatement();
			resultSet = statement.executeQuery(query);
		
			while (resultSet.next()) {
				Contact contact = new Contact();
				
				contact.setId(resultSet.getInt("id"));
				contact.setName(resultSet.getString("name"));
				contact.setContactNum(resultSet.getString("contactNum"));
				contact.setEmail(resultSet.getString("email"));
				contacts.add(contact);
			}
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		
		return contacts;
	}

}
