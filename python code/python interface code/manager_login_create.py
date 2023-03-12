import streamlit as st
import pandas as pd
from manager_login_database import manager_login_check,find_manager_id,admins_check,manager_info,add_admin,view_only_admin_id,delete_admin,view_only_cust_id,delete_user

def callback():
  st.session_state.button_clicked=True

def manager_login():
    if 'button_clicked' not in st.session_state:
        st.session_state.login=False
    username = st.text_input("username").split(' ')
    password = st.text_input("password")
    if st.button("login",on_click=callback) or st.session_state.button_clicked:
            if manager_login_check(username[0],username[1],password):
               st.success("Successfully logged in: {}".format(username[0]+' '+username[1]))
               st.subheader('\t\tWELCOME TO PES LIBRARY!!!')
               st.subheader('Personal info:')
               manager_id = find_manager_id(username[0], username[1])
               result2 = manager_info(username[0],username[1],manager_id)
               df3 = pd.DataFrame(result2,columns=['manager_id','f_name','l_name','contact_no','state','city','street','pin'])
               st.dataframe(df3)
               st.subheader("check admins: ")
               result3 = admins_check(manager_id)
               if result3:
                    df1 = pd.DataFrame(result3, columns=['admin_id','f_name','l_name','salary'])
                    with st.expander("admins"):
                           st.dataframe(df1)
               else:
                    st.error("admins dosen\'t exist")
               st.subheader('Add admins:')
               col1,col2 =st.columns(2)
               with col1:
                      admin_id = st.text_input("admin_id")
                      salary = st.text_input("salary")
               with col2:
                      f_name = st.text_input("f_name")
                      l_name = st.text_input("l_name")
               if st.button("Add Admin"):
                      add_admin(admin_id,salary,f_name,l_name,manager_id)
                      st.success("Successfully added Admin: {}".format(f_name+' '+l_name))
               st.subheader('delete')
               result4 = [i[0] for i in view_only_admin_id(manager_id)]
               selected_admin = st.selectbox("Admin to Delete", result4)
               st.warning("Do you want to delete :{}".format(selected_admin))
               if st.button("Delete Admin"):
                   delete_admin(selected_admin)
                   st.success("successfully deleted admin {}".format(selected_admin))

               st.subheader('Delete Customers:')
               result5 = [i[0] for i in view_only_cust_id()]
               selected_user = st.selectbox('Customer to delete',result5)
               st.warning("Do you want to delete: {}".format(selected_user))
               if st.button("Delete User"):
                   delete_user(selected_user)
                   st.success("successfully deleted user {}".format(selected_user))


            else:
                st.error('invalid details ')