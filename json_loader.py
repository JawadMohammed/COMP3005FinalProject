
'''
import psycopg2

# Connect to PostgreSQL
conn = psycopg2.connect(
    dbname="assignment2",
    user="postgres",
    password="postgres",
    host="localhost"
)
cursor = conn.cursor()

cursor.execute("""INSERT INTO authors(author_id, first_name,last_name,bio)
VALUES 
(10, 'Rick', 'Riordan', 'author of Percy Jackson')""")


# Read and parse JSON file
#with open('data.json', 'r') as file:
  #  data = json.load(file)

# Iterate through JSON data and insert into PostgreSQL table
#for item in data:
    # Assuming 'table_name' is the name of your PostgreSQL table
   # cursor.execute("""
       # INSERT INTO authors (column1, column2, column3)
        #VALUES (%s, %s, %s)
   # """, (item['key1'], item['key2'], item['key3']))

# Commit changes and close connection
conn.commit()
cursor.close()
conn.close()



#open-data/data/matches/11
'''
import os
import json

# Directory containing JSON files
laliga = 'open-data/data/matches/11'

prem = 'open-data/data/matches/2'

lineups = 'open-data/data/lineups'
events = 'open-data/data/events'

def importmatches(directory):
    # Loop through files in the directory
    for filename in os.listdir(directory):
        # Check if file is JSON

        if filename.endswith('.json'):
            filepath = os.path.join(directory, filename)
            print(filepath)

            with open(filepath, 'r', errors='replace') as file:
                # Read JSON data
                data = json.load(file)

                game_count=0
                for match in data:
                    print(game_count, match['match_id'])
                    for info in match:
                        print(info, match[info])
                    game_count+=1
importmatches()
'''

def add_match(data)

def add_team(data) 

def add_player(data) 

def add_event(data) 

def add_Ball_Receipt(data):
def add_Ball_Recovery(data):
def add_Dispossessed(data):
def add_Duel(data):
def add_Camera_On(data):
def add_Block(data):
def add_Offside(data):
def add_Clearance(data):
def add_Interception(data):
def add_Dribble(data):
def add_Shot(data):
def add_Pressure(data):
def add_Half_Start(data):
def add_Substitution(data):
def add_Own_Goal_Against(data):
def add_Foul_Won(data):
def add_Foul_Committed(data):
def add_Goal_Keeper(data):
def add_Bad_Behaviour(data):
def add_Own_Goal_For(data):
def add_Player_On(data):
def add_Player_Off(data):
def add_Shield(data):
def add_Pass(data):
def add_50_50(data):
def add_Half_End(data):
def add_Starting_XI(data):
def add_Tactical_Shift(data):
def add_Error(data):
def add_Miscontrol(data):
def add_Dribbled_Past(data):
def add_Injury_Stoppage(data):
def add_Referee_Ball_Drop(data):
def add_Carry(data):


'''
