import mysql.connector
from datetime import date, datetime
import os
print('\t\t\t\tLibrary database')
print('1.Existing User')
print('2.Manager')
print('3.Admin')
print('4.New User')
issue_date= date.today
n=int(input())
if n==1:
    while(3):
        username=input('\nUsername: ').split(' ')
        password=input('Password: ')
        conn = mysql.connector.connect(host='localhost',
                                         database='my_project',
                                         user='root',
                                         password='')
        cursor = conn.cursor()                                     
        cursor.execute('Select * from `customer` where f_name= %s AND l_name= %s AND password = %s ',(username[0],username[1],password,))  
        pc = cursor.fetchone()
        if pc:
            while(True):
                print('\t\t\t\tWelcome to pes library!!!')
                print('1.Issued books')
                print('2.check books')
                print('3.quit')
                x=int(input())
                if x==1:
                    book_name=str(input('enter name of the book: '))
                    cursor.execute('select customer_id from `customer` where f_name=%s and l_name=%s',(username[0],username[1]))
                    customer_id = cursor.fetchall()[0][0]
                    cursor.execute('select admin_id ,ISBN from `books` where title=%s',(book_name))
                    admin_id=cursor.fetchall()[0][0]
                    ISBN = cursor.fetchall()[0][1]
                    issue_date= date.today
                    print(admin_id,ISBN,issue_date)                 
                    # try:
                    #     cursor.execute('insert into issue_return values(',(book_name)) 
                    # print('issued')
                if x==2:
                    print('1.See all the books')
                    print('2.check by name of the book')
                    print('3.check by author\'s name')
                    q=int(input())
                    if q==1:
                        cursor.execute('Select * from `books`')
                        result = cursor.fetchall()
                        for row in result:
                            print(row, '\n')
                    if q==2:
                        book_name=[input('enter name of the book: ')]
                        cursor.execute('Select ISBN,price,category,status,title from `books` where title=%s and status=%s',(book_name[0],"yes"))
                        result = cursor.fetchone()
                        if (result):
                            print("ISBN - "+result[0])
                            print("Price- "+str(result[1]))
                            print("Category - "+result[2])
                            print("Status - "+result[3])
                            print("Title - "+result[4])
                        else:
                            print('invalid book name')    
                    if q==3:
                        author_name=input('enter name of the author: ').split(' ')
                        cursor.execute('select ISBN,price,category,status,title from `books` where books.title in (Select name from `book_names` natural join `author_names` where author_names.f_name=%s and author_names.l_name=%s)',(author_name[0],author_name[1]))
                        result = cursor.fetchall()
                        for row in result:
                            print("ISBN - "+row[0])
                            print("Price- "+str(row[1]))
                            print("Category - "+row[2])
                            print("Status - "+row[3])
                            print("Title - "+row[4])  
                            print('\n')      

                if x==3:
                    break  
            break              
        else:
            print('invalid user details')                                       
elif n==2:
    username=input('\nUsername: ')
    password=input('\nPassword: ')  
elif n==3:
    username=input('\nUsername: ')
    password=input('\nPassword: ')
elif n==4:
    username=input('\nNew Username: ')
    password=input('\nNew Password: ')        
