
import mysql.connector
from tabulate import tabulate
connection = mysql.connector.connect(host="localhost", user="root", password="M0559647062o", database="library")
cursor = connection.cursor()

query = """
SELECT bb.borrow_id, u.name AS borrower_name, b.title AS book_title, 
       bb.borrowed_date, bb.returned_date
FROM borrowed_books bb
INNER JOIN users u ON bb.user_id = u.user_id
INNER JOIN books b ON bb.book_id = b.book_id;
"""
cursor.execute(query)
rows = cursor.fetchall()

for row in rows:
  print(row)
