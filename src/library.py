
import mysql.connector

def connect_to_db(host, user, password, database):
  
  try:
    connection = mysql.connector.connect(
      host=host,
      user=user,
      password=password,
      database=database
    )
    return connection
  except mysql.connector.Error as err:
    print(f"Error connecting to database: {err}")
    return None

def close_connection(connection):

  if connection:
    connection.close()

def add_book(connection, title, author, year, quantity=1):

  cursor = connection.cursor()
  query = "INSERT INTO books (title, author, year, quantity) VALUES (%s, %s, %s, %s)"
  values = (title, author, year, quantity)
  try:
    cursor.execute(query, values)
    connection.commit()
  except mysql.connector.Error as err:
    print(f"Error adding book: {err}")
  finally:
    cursor.close()

def add_user(connection, name, email, phone_number, address):

  cursor = connection.cursor()
  query = "INSERT INTO users (name, email, phone_number, address) VALUES (%s, %s, %s, %s)"
  values = (name, email, phone_number, address)
  try:
    cursor.execute(query, values)
    connection.commit()
  except mysql.connector.Error as err:
    print(f"Error adding user: {err}")
  finally:
    cursor.close()
    
def borrow_book(connection, user_id, book_id):
    cursor = connection.cursor()

    
    if not check_book_availability(connection, book_id):
        raise Exception("Book is already borrowed")

    
    borrow_query = """
        INSERT INTO borrowed_books (user_id, book_id, borrowed_date)
        VALUES (%s, %s, NOW())
    """
    values = (user_id, book_id)
    cursor.execute(borrow_query, values)
    connection.commit()

    cursor.close()

def extend_borrowing(connection, borrow_id):
 
  cursor = connection.cursor()
  query = "UPDATE borrowed_books SET returned_date = NULL WHERE borrow_id = %s"
  values = (borrow_id,)
  try:
    cursor.execute(query, values)
    connection.commit()
  except mysql.connector.Error as err:
    print(f"Error extending borrowing: {err}")
  finally:
    cursor.close()

def return_book(connection, borrow_id):

  cursor = connection.cursor()
  query = "UPDATE borrowed_books SET returned_date = CURDATE() WHERE borrow_id = %s"
  values = (borrow_id,)
  try:
    cursor.execute(query, values)
    connection.commit()
  except mysql.connector.Error as err:
    print(f"Error returning book: {err}")
  finally:
    cursor.close()

def check_book_availability(connection, book_id):

  cursor = connection.cursor()
  query = "SELECT COUNT(*) FROM borrowed_books WHERE book_id = %s AND returned_date IS NULL"
  values = (book_id,)
  cursor.execute(query, values)
  available_count = cursor.fetchone()[0]
  return available_count == 0

def add_book_quantity(connection, book_id, quantity):
  
  cursor = connection.cursor()
  query = "UPDATE books SET quantity = quantity + %s WHERE book_id = %s"
  values = (quantity, book_id)
  try:
    cursor.execute(query, values)
    connection.commit()
  except mysql.connector.Error as err:
    print(f"Error adding book quantity: {err}")
  finally:
    cursor.close()

def get_remaining_quantity(connection, book_id):
 
  cursor = connection.cursor()
  query = "SELECT quantity FROM books WHERE book_id = %s"
  values = (book_id,)
  cursor.execute(query, values)
  result = cursor.fetchone()
  return result[0] if result else 0

def show_borrowed_books(connection):
 
  cursor = connection.cursor()
  query = """
  SELECT bb.borrow_id, u.name, b.title, bb.borrowed_date, bb.returned_date
  FROM
    borrowed_books bb
  INNER JOIN users u ON bb.user_id = u.user_id
  INNER JOIN books b ON bb.book_id = b.book_id;
  """
  cursor.execute(query)
  rows = cursor.fetchall()
  return rows

def show_borrowed_user(connection, user_id):
    cursor = connection.cursor()
    query = """
        SELECT b.title, bb.borrowed_date, bb.returned_date
        FROM borrowed_books bb
        INNER JOIN books b ON bb.book_id = b.book_id
        INNER JOIN users u ON bb.user_id = u.user_id 
        WHERE u.user_id = %s  
    """
    cursor.execute(query, (user_id,))
    borrowed_books = cursor.fetchall()


    cursor.execute("SELECT name FROM users WHERE user_id = %s", (user_id,))
    user_name = cursor.fetchone()[0]

    cursor.close()

    return user_name, borrowed_books

connection = connect_to_db(host="localhost", user="root", password="M0559647062o", database="library")
# print(show_borrowed_books(connection))
# borrow_book(connection, 1, 4)
print(show_borrowed_user(connection,1))
