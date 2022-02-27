import psycopg2
  
# connection establishment
conn = psycopg2.connect(
   database="postgres",
    user='postgres',
    password='3124',
    host='localhost',
    port= '5432'
)
  
conn.autocommit = True
  
# Creating a cursor object
cursor = conn.cursor()
  
# query to create a database 
sql = ''' CREATE database college_employer '''
  
# executing above query
cursor.execute(sql)
print("Database has been created successfully !!")
  
# Closing the connection
conn.close()

conn = psycopg2.connect(
   database="college_employer",
    user='postgres',
    password='3124',
    host='localhost',
    port= '5432'
)

conn.autocommit = True

cursor = conn.cursor()

