import mysql.connector
import streamlit as st
mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    database="my_project"
)
c = mydb.cursor()

def register_new_user(customer_id,f_name,l_name,street,city,pin,reg_date,manager_id,password):
    c.execute('INSERT INTO customer(customer_id,f_name,l_name,street,city,pin,reg_date,manager_id,password) VALUES ("{}","{}","{}",'
              '"{}","{}","{}","{}","{}","{}")'.format(customer_id,f_name,l_name,street,city,pin,reg_date,manager_id,password))
    mydb.commit()