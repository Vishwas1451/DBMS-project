import streamlit as st
import pandas as pd
from add_new_user_database import register_new_user
def add_user():
    col1, col2,col3 = st.columns(3)
    with col1:
        customer_id = st.text_input("customer_id")
        f_name = st.text_input("f_name")
        l_name = st.text_input("l_name")
        reg_date = st.date_input("register date")
    with col2:
        street = st.text_input("street")
        city = st.text_input("city")
        pin = st.text_input("pin")
        manager_id = st.selectbox("select manager",["1","2","3","4","5"])
    password = st.text_input("password")
    check_password = st.text_input("enter_password_again")
    if st.button("Register"):

              if password==check_password:
                register_new_user(customer_id,f_name,l_name,street,city,pin,reg_date,manager_id,password)
                st.success("Successfully registered : {}".format(f_name + ' ' + l_name))
              else:
                 st.error('invalid details')