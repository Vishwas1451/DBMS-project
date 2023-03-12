import mysql.connector
import random
import streamlit as st
mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    database="my_project"
)
c = mydb.cursor()

def admin_login_check(username1,username2,password):
    c.execute('SELECT f_name,l_name, password from `admins` where f_name="{}" and l_name="{}" and password="{}"'.format(username1, username2, password))
    data =  c.fetchall()
    try:
        if data[0][2] == password and username1==data[0][0] and username2==data[0][1]:
            return 1
        else:
            return 0
    except IndexError:
        return 0

def admin_info(username1,username2,customer_id):
    c.execute('select manager_id,f_name,l_name,contact_no,state,city,street,pin from `branch` where f_name="{}" and l_name="{}" and manager_id="{}"'.format(username1, username2,customer_id))
    data = c.fetchall()
    return data

def admin_id(username1,username2):
    c.execute('select admin_id from admins where f_name="{}" and l_name="{}"'.format(username1,username2))
    data = c.fetchall()
    return data[0][0]

def view_publisher_id():
    c.execute('select publisher_id from publisher')
    data = c.fetchall()
    return data

def add_book(ISBN,price,category,status,title,admin,publisher_id,authors):
    c.execute('select * from books where ISBN="{}"'.format(ISBN))
    data = c.fetchall()
    l=[]
    if data ==l:
        c.execute('Insert into books(ISBN,price,category,status,title,admin_id,publisher_id) values("{}","{}","{}","{}","{}","{}","{}")'.format(ISBN, price, category, status, title, admin, publisher_id))
        for i in range(len(authors)):
                  data1 = random.randint(220,1000)
                  l.append(data1)
                  c.execute('insert into author(author_id) values("{}")'.format(data1))

        for i in range(0,len(authors)):
                 u = authors[i].split(" ")
                 c.execute('insert into author_names(f_name,l_name,author_id) values("{}","{}","{}")'.format(u[0],u[1],l[i]))
        for i in range(0,len(authors)):
             c.execute('insert into book_names(name,author_id) values("{}","{}")'.format(title,l[i]))

        mydb.commit()
        return 1
    else:
        return 0

def get_all_books(admin):
    c.execute('select title from `books` where admin_id="{}"'.format(admin))
    data=c.fetchall()
    l=[]
    for i in range(0,len(data)):
        l.append(data[i][0])
    return l

def delete_book(book):
    c.execute('delete from books where title="{}"'.format(book))
    c.execute('delete from book_names where name="{}"'.format(book))
    mydb.commit()

def book_issue(customer_id,ISBN1,issue_date,return_date,admin):
    c.execute('SET foreign_key_checks = 0')
    c.execute('insert into issue_return(customer_id,admin_id,ISBN,issue_date,return_date) values("{}","{}","{}","{}","{}")'.format(customer_id,admin,ISBN1,issue_date,return_date))
    c.execute('SET foreign_key_checks = 1')
    mydb.commit()

def get_books_assigned_admin(admin):
    c.execute('select ISBN from issue_return where admin_id="{}"'.format(admin))
    data=c.fetchall()
    l = []
    for i in range(0, len(data)):
        l.append(data[i][0])
    return l

def get_customer_got_assigned_by_admin(admin,returned):
    c.execute('select customer_id from issue_return where admin_id="{}" and ISBN="{}"'.format(admin,returned))
    data = c.fetchall()
    l = []
    for i in range(0, len(data)):
        l.append(data[i][0])
    s=[]
    for i in range(0,len(l)):
          c.execute('select f_name from customer where customer_id="{}"'.format(l[i]))
          data=c.fetchall()
          s.append(data[0][0])

    return s

def book_returned(ISBN,admin,customer):
    c.execute('SET foreign_key_checks = 0')
    c.execute('select customer_id from customer where f_name="{}"'.format(customer))
    data=c.fetchall()
    c.execute('delete from issue_return where customer_id="{}" and admin_id="{}" and ISBN="{}"'.format(data[0][0],admin,ISBN))
    c.execute('SET foreign_key_checks = 1')
    mydb.commit()

