import pandas as pd
import streamlit as st
from user_login_database import get_customer_id,display_all_books,check_issued_books


def read(username1,username2):
    customer_id = get_customer_id(username1, username2)
    result = check_issued_books(customer_id)
    df = pd.DataFrame(result, columns=['book name', 'ISBN', 'price'])
    st.subheader('Issued Books:')
    with st.expander("Issued Books"):
        st.dataframe(df)
    result1 = display_all_books()
    st.subheader('All Books:')
    df1 = pd.DataFrame(result1, columns=['ISBN', 'Price', 'category', 'status', 'title', 'admin id', 'publisher id'])
    with st.expander("all books"):
        st.dataframe(df1)


