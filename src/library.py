
import mysql.connector

connection = mysql.connector.connect(host="localhost", user="root", password="M0559647062o", database="library")
cursor = connection.cursor()

def add_book(title, author, year):

    query = f"INSERT INTO books (title, author, year) VALUES ('{title}', '{author}', {year})"
    cursor.execute(query)
    connection.commit()

def add_user(name, email, phone_number, address):

    query = f"INSERT INTO users (name, email, phone_number, address) VALUES ('{name}', '{email}', '{phone_number}', '{address}')"
    cursor.execute(query)
    connection.commit()

def extend_borrowing(borrow_id):

    query = f"UPDATE borrowed_books SET returned_date = NULL WHERE borrow_id = {borrow_id}"
    cursor.execute(query)
    connection.commit()

def return_book(borrow_id):
    
    query = f"UPDATE borrowed_books SET returned_date = CURDATE() WHERE borrow_id = {borrow_id}"
    cursor.execute(query)
    connection.commit()
    
def check_book_availability(book_id):

    query = f"SELECT COUNT(*) FROM borrowed_books WHERE book_id = {book_id} AND returned_date IS NULL"
    cursor.execute(query)
    available_count = cursor.fetchone()[0]
    return available_count

def add_book_quantity(book_id, quantity):
    
    query = f"UPDATE books SET quantity = quantity + {quantity} WHERE book_id = {book_id}"
    cursor.execute(query)
    connection.commit()

def get_remaining_quantity(book_id):
    
    query = f"SELECT quantity FROM books WHERE book_id = {book_id}"
    cursor.execute(query)
    remaining_quantity = cursor.fetchone()[0]
    return remaining_quantity
