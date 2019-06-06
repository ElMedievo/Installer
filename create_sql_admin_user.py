import MySQLdb

print("--- SQL Login ---")
sql_host = raw_input("<- Host: ")
sql_user = raw_input("<- User: ")
sql_password = raw_input("<- Password: ")
print("-----------------")

database = MySQLdb.connect(sql_host, sql_user, sql_password)
cursor = database.cursor()

print("--- New SQL Admin User ---")
user = raw_input("<- New SQL Username: ")
password = raw_input("<- User's pass: ")
print("--------------------------")

create_user_sql = "CREATE USER '" + user + "'@'" + "' IDENTIFIED BY '" + password + "';"
grant_perms_sql = "GRANT ALL PRIVILEGES ON * . * TO '" + user + "'@'""';"

cursor.execute(create_user_sql)
cursor.execute(grant_perms_sql)
cursor.execute("FLUSH PRIVILEGES;")
