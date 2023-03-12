import streamlit as st

from admin_login_database import admin_login_check,view_publisher_id,admin_id,add_book,get_all_books,delete_book,book_issue,get_books_assigned_admin,get_customer_got_assigned_by_admin,book_returned

def callback():
  st.session_state.button_clicked=True

def admin_login():
    if 'button_clicked' not in st.session_state:
        st.session_state.login=False
    username = st.text_input("username").split(' ')
    password = st.text_input("password")
    if st.button("login",on_click=callback) or st.session_state.button_clicked:
        if admin_login_check(username[0], username[1], password):
            st.success("Successfully logged in: {}".format(username[0] + ' ' + username[1]))
            st.subheader('\t\tWELCOME TO PES LIBRARY!!!')
            st.subheader('Add Books:')
            col1,col2 =st.columns(2)
            pub =  [i[0] for i in view_publisher_id()]
            admin = admin_id(username[0],username[1])
            with col1:
                ISBN = st.text_input("ISBN")
                price = st.text_input("price")
                category = st.selectbox("category",['novel','fiction','academics','kids'])
            with col2:
                status = st.selectbox("status",["yes","no"])
                title = st.text_input("TItle")
                publisher_id = st.selectbox('publisher',pub)
            Authors = st.text_input('Author names:').split(",")
            if st.button("add book"):
                    if add_book(ISBN,price,category,status,title,admin,publisher_id,Authors):
                        st.success("successfully added the book {}".format(title))
                    else:
                        st.error("failed to update:(")
            st.subheader('Delete Book:')
            result = get_all_books(admin)
            selected_book = st.selectbox('Books',result)
            if st.button("Delete book"):
                    delete_book(selected_book)
                    st.success("successfully deleted the book {}".format(title))
            st.subheader('Issue books:')
            col1,col2 = st.columns(2)
            with col1:
                customer_id = st.text_input('Customer ID')
                ISBN1 = st.text_input('ISBN of the book')
            with col2:
                issue_date = st.date_input('Issue Date:')
                return_date = st.date_input('Return Date:')
            if st.button('Issue Book'):
                book_issue(customer_id,ISBN1,issue_date,return_date,admin)
                st.success("Book Issued")
            st.subheader('Book Returned:')
            returned = get_books_assigned_admin(admin)
            returned_book = st.selectbox('Returned Book',returned)
            ret_cust = get_customer_got_assigned_by_admin(admin,returned_book)
            returned_customer = st.selectbox('Returned Customer',ret_cust)
            if st.button("Returned "):
                book_returned(returned_book,admin,returned_customer)
                st.success('Book Returned Successfully')
        else:
            st.error('invalid admin details ')
