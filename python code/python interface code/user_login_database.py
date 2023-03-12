# pip install mysql-connector-python
import mysql.connector

mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    database="my_project"
)
c = mydb.cursor()

def customer_info(username1,username2,customer_id):
    c.execute('select customer_id,f_name,l_name,street,city,pin,reg_date,manager_id from `customer` where f_name="{}" and l_name="{}" and customer_id="{}"'.format(username1, username2,customer_id))
    data = c.fetchall()
    return data

def check_login(username1,username2,password):
    c.execute('SELECT f_name,l_name, password from `customer` where f_name=%s and l_name=%s and password=%s',
              (username1,username2,password))
    data = c.fetchall()
    try:
        if data[0][2]==password and username1==data[0][0] and username2==data[0][1]:
              return 1
        else:
              return 0
    except IndexError:
        return 0
def get_customer_id(username1,username2):
    c.execute('select customer_id from `customer` where f_name=%s and l_name=%s',(username1,username2))
    data = c.fetchone()
    return data[0]
def check_issued_books(customer_id):
    c.execute('select books.title,issue_return.ISBN,books.price from `issue_return` INNER join `books` on issue_return.ISBN=books.ISBN where customer_id="{}"'.format(customer_id))
    data=c.fetchall()
    return data
def display_all_books():
    c.execute('SELECT * FROM `books`')
    data = c.fetchall()
    return data

def get_book_by_name(book_name):
    c.execute('Select title from `books` where title="{}"'.format(book_name))
    data = c.fetchall()
    if data:
        return 1
    else:
        return 0
def get_author_by_name(f_name,l_name):
    c.execute('select ISBN,price,category,status,title from `books` where books.title in (Select name from `book_names` natural join `author_names` where author_names.f_name=%s and author_names.l_name=%s)',(f_name,l_name))
    data = c.fetchall()
    return data

def get_book_by_category(category):
    c.execute('select ISBN,price,status,title from `books` where books.category="{}"'.format(category))
    data = c.fetchall()
    return data

def user_change_password(password,customer_id):
    c.execute('update `customer` set password="{}" where customer_id="{}"'.format(password,customer_id))
    mydb.commit()


