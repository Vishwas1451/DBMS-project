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

def manager_info(username1,username2,customer_id):
    c.execute('select manager_id,f_name,l_name,contact_no,state,city,street,pin from `branch` where f_name="{}" and l_name="{}" and manager_id="{}"'.format(username1, username2,customer_id))
    data = c.fetchall()
    return data

def manager_login_check(username1,username2,password):
    c.execute('SELECT f_name,l_name, password from `branch` where f_name=%s and l_name=%s and password=%s',
              (username1, username2, password))
    data = c.fetchall()
    try:
        if data[0][2] == password and username1==data[0][0] and username2==data[0][1]:
            return 1
        else:
            return 0
    except IndexError:
        return 0

def find_manager_id(f_name,l_name):
    c.execute('SELECT manager_id from `branch` where f_name=%s and l_name=%s',
              (f_name,l_name))
    data=c.fetchall()
    return data[0][0]

def admins_check(cust_id):
    c.execute('select admins.admin_id,admins.f_name,admins.l_name,admins.salary from `branch` inner join `admins` where branch.manager_id=admins.manager_id and branch.manager_id="{}"'.format(cust_id))
    data=c.fetchall()
    return data

def add_admin(admin_id,salary,f_name,l_name,manager_id):
    c.execute('INSERT INTO admins(admin_id,salary,f_name,l_name,manager_id,password) VALUES ("{}","{}","{}",'
              '"{}","{}","{}")'.format(admin_id,salary,f_name,l_name,manager_id,f_name))
    mydb.commit()

def view_only_admin_id(man_id):
    c.execute('select admin_id from `admins` where manager_id="{}"'.format(man_id))
    data = c.fetchall()
    return data

def delete_admin(admin_id):
    c.execute('select admin_id from `admins` where admin_id!="{}"'.format(admin_id))
    data = c.fetchall()
    c.execute('SET foreign_key_checks = 0')
    c.execute('update `books` set admin_id="{}" where admin_id = "{}"'.format(random.choice(data[0]),admin_id))
    c.execute('update `issue_return` set admin_id="{}" where admin_id = "{}"'.format(random.choice(data[0]), admin_id))
    c.execute('delete from admins where admin_id="{}"'.format(admin_id))
    c.execute('SET foreign_key_checks = 1')
    mydb.commit()

def view_only_cust_id():
    c.execute('select customer_id from customer')
    data=c.fetchall()
    return data
def delete_user(cust_id):
    c.execute('SET foreign_key_checks = 0')
    c.execute('delete from issue_return where customer_id="{}"'.format(cust_id))
    c.execute('delete from customer where customer_id="{}"'.format(cust_id))
    c.execute('SET foreign_key_checks = 1')
    mydb.commit()
