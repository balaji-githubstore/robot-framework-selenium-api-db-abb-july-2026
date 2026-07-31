*** Comments ***
Host: sql12.freesqldatabase.com
Database name: sql12834232
Database user: sql12834232
Database password: PYd7ZZgjH9
Port number: 3306

Table - Persons 
Columns - PersonID, LastName,FistName,Address, City 



*** Settings ***
Library    DatabaseLibrary

Suite Setup    Connect To Database    db_module=pymysql      db_name=sql12834232    db_user=sql12834232    
    ...    db_password=PYd7ZZgjH9    db_host=sql12.freesqldatabase.com    db_port=3306  alias=mysqldb

Suite Teardown    Disconnect From Database


*** Test Cases ***
TC1
    Table Must Exist    Persons
    
TC2
    ${row_count}    Row Count    select * from Persons
    Log     ${row_count}
    
TC3 Insert Update Delete Record
    ${person_id}    Set Variable    1005
    Execute Sql String    INSERT INTO Persons (PersonID, LastName, FirstName, Address, City) VALUES (${person_id}, 'Smith', 'John', '123 Main Street', 'London')
    Check Row Count    select * from Persons where PersonID=1005 and FirstName==John    ==    1

TC4 Insert Update Delete Record
    ${person_id}    Set Variable    1005
    Execute Sql String    UPDATE Persons SET LastName = 'John' WHERE personID = 1005
    Check Row Count    select * from Persons where PersonID=1005 and LastName='John'    ==    1
   
TC5 Switch DB
    Connect To Database Using Custom Connection String    sqllite3    database=demo.db   alias=sqllitedb
    Table Must Exist    Persons
    Switch Database    alias=mysqldb
    Table Must Exist    Persons
    Switch Database    alias=sqllitedb

TC6 Select 
    ${query}    Query    select * from Persons where PersonID<=3
    Log    ${query}
    Log    ${query}[0]
    Log    ${query}[0][0]
    Log    ${query}[0][1]
    
    