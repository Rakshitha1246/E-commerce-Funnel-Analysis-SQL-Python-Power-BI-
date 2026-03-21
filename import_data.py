import pandas as pd
import mysql.connector

# Load data
df = pd.read_csv("C:/Users/savarkar/Downloads/events_cleaned.csv")

# Connect to MySQL
conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="raksh1246",
    database="ecommerce_project"
)

cursor = conn.cursor()

# Insert data
for _, row in df.iterrows():
    cursor.execute("""
        INSERT INTO ecommerce_funnel (user_id, event, item_id, timestamp)
        VALUES (%s, %s, %s, %s)
    """, tuple(row))

conn.commit()

print("Data Imported Successfully ✅")