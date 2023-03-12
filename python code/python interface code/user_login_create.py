import streamlit as st
import pandas as pd
from user_login_read import read
from user_login_database import check_login,check_issued_books,get_customer_id,display_all_books,get_book_by_name,get_author_by_name,get_book_by_category,customer_info,user_change_password

def callback():
  st.session_state.button_clicked=True
def create():
    if 'button_clicked' not in st.session_state:
        st.session_state.login=False
    username = st.text_input("username").split(' ')
    password = st.text_input("password",type='password')
    if st.button("login",on_click=callback) or st.session_state.button_clicked:
            if check_login(username[0],username[1],password):
               st.success("Successfully logged in: {}".format(username[0]+' '+username[1]))
               st.subheader('\t\tWELCOME TO PES LIBRARY!!!')
               st.subheader('Personal info:')
               customer_id = get_customer_id(username[0], username[1])
               result2 = customer_info(username[0], username[1],customer_id)
               df3 = pd.DataFrame(result2,columns=['customer_id','f_name', 'l_name', 'contact_no', 'state', 'city', 'street','pin'])
               st.dataframe(df3)
               read(username[0],username[1])
               st.subheader('Check Book By Book Name:')
               book = st.text_input("book_name")
               if st.button('check book'):
                   if get_book_by_name(book):
                       st.success("{} exists in library".format(book))
                   else:
                       st.error("book does not exist")
               st.subheader('Check Book By Author Name:')
               author = st.text_input("author_name").split(' ')
               if st.button('check author'):
                   try:
                       result3= get_author_by_name(author[0],author[1])

                       if result3:
                           df1 = pd.DataFrame(result3, columns=['ISBN', 'Price', 'category', 'status', 'title'])
                           with st.expander("all books"):
                               st.dataframe(df1)
                       else:
                           st.error('invalid author\'s name')
                   except IndexError:
                        st.error("Enter full name of the author")
               st.subheader('Check Book Based On Category:')
               category = st.selectbox("category",["kids","academics","novel","fiction"])
               if st.button('find'):
                   result3 = get_book_by_category(category)
                   df1 = pd.DataFrame(result3, columns=['ISBN', 'Price','status', 'title'])
                   with st.expander("all books"):
                       st.dataframe(df1)
               st.subheader("Change Password")
               password = st.text_input('New Password')
               new_password = st.text_input('Retype Password')
               if st.button('Change'):
                   if password == new_password:
                       user_change_password(password,customer_id)
                       st.success("Password changed")
                   else:
                       st.error("error occurred :(")
            else:
                st.error('invalid user')




