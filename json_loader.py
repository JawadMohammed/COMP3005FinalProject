

import psycopg2

#open-data/data/matches/11

import os
import json



def add_match(data,cursor):
    cursor.execute("""
        INSERT INTO matches (
            match_id,
            kick_off,
            competition_id,
            competition_name,
            season_id,
            season_name,
            home_team,
            away_team,
            home_score,
            away_score,
            match_status,
            match_status_360,
            last_updated,
            last_updated_360,
            metadata,
            match_week,
            competition_stage_id,
            competition_stage_name,
            stadium,
            referee
        ) VALUES (
            data['match_id'],
            data['kick_off'],
            data['competition']['competition_id'],
            data['competition']['competition_name'],
            data['season']['season_id'],
            data['season']['season_name'],
            data['home_team']['home_team_name'],
            data['away_team']['away_team_name'],
            data['home_score'],
            data['away_score'],
            data['match_status'],
            data['match_status_360'],
            data['last_updated'],
            data['last_updated_360'],
            json.dumps(data['metadata']),
            data['match_week'],
            data['competition_stage']['id'],
            data['competition_stage']['name'],
            ata['stadium']['name'],
            data['referee']['name']
                );
    """)

conn = psycopg2.connect(
    dbname="project_database",
    user="postgres",
    password="postgres",
    host="localhost"
   )
cursor = conn.cursor()
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


            with open(filepath, 'r', errors='replace') as file:
                 # Read JSON data
                data = json.load(file)

                for match in data:

                    add_match(data,cursor)



importmatches(laliga)

conn.commit()
cursor.close()
conn.close()

'''
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
