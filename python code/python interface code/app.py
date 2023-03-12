# Importing pakages
import streamlit as st
import mysql.connector

from user_login_create import create
from manager_login_create import manager_login
from add_new_user import add_user
from admin_login_page import admin_login
from user_login_read import read
# from user_login_update import update

# mydb = mysql.connector.connect(
#     host="localhost",
#     user="root",
#     password=""
# )
# c = mydb.cursor()
#
# c.execute("CREATE DATABASE pycharm_lab10_assignment_pes2ug20cs390")
#
#
def main():
    st.title("Library management system App")
    menu = ["User login", "Manager Login", "Admin login", "New user"]
    choice = st.sidebar.selectbox("Menu", menu)

    if choice == "User login":
        st.subheader("Enter User Details:")
        create()

    elif choice == "Manager Login":
        st.subheader("Enter Manager details: ")
        manager_login()

    elif choice == "Admin login":
        st.subheader("Enter Admin Details: ")
        admin_login()

    elif choice == "New user":
        st.subheader("Create new account: ")
        add_user()

    else:
        st.subheader("About tasks")


if __name__ == '__main__':
    main()
