CREATE TABLE IF NOT EXISTS matches (
    match_id SERIAL PRIMARY KEY,
    kick_off TIME,
    competition_id INT,
    competition_name TEXT,
    season_id INT,
    season_name TEXT,
    home_team TEXT,
    away_team TEXT,
    home_score INT,
    away_score INT,
    match_status TEXT,
    match_status_360 TEXT,
    last_updated TEXT,
    last_updated_360 TEXT,
    metadata TEXT,
    match_week INT,
    competition_stage_id INT,
    competition_stage_name TEXT,
    stadium TEXT,
    referee TEXT
);

CREATE TABLE IF NOT EXISTS team (
    match_id INT PRIMARY KEY,
    team_id INT,
    team_name TEXT,
    lineup INT[]
);

CREATE TABLE IF NOT EXISTS player (
    player_id INT PRIMARY KEY,
    matches INT[],
    player_nickname TEXT,
    jersey_number INT,
    country TEXT,
    cards TEXT,
    positions TEXT
);

CREATE TABLE IF NOT EXISTS event (
    event_id UUID PRIMARY KEY,
    match_id INT,
    index INT,
    period INT,
    timestamp TIMESTAMP,
    minute INT,
    second INT,
    type_id INT,
    type_name TEXT,
    possession INT,
    possession_team_id INT,
    possession_team_name TEXT,
    play_pattern_id INT,
    play_pattern_name TEXT,
    team_id INT,
    team_name TEXT,
    player_id INT,
    player_name TEXT,
    position_id INT,
    position_name TEXT,
    location_0 INT,
    location_1 INT,
    duration FLOAT,
    under_pressure BOOLEAN,
    related_events UUID[]
);

CREATE TABLE IF NOT EXISTS Ball_Receipt (
    event_id UUID PRIMARY KEY,
    outcome TEXT DEFAULT 'Incomplete'
);

CREATE TABLE IF NOT EXISTS Ball_Recovery (
    event_id UUID PRIMARY KEY,
    offensive BOOLEAN DEFAULT TRUE,
    recovery_failure BOOLEAN DEFAULT TRUE
);

CREATE TABLE IF NOT EXISTS Dispossessed (
    event_id UUID PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS Duel (
    event_id UUID PRIMARY KEY,
    counterpress BOOLEAN DEFAULT TRUE,
    type_id INT,
    type_name TEXT,
    outcome_id INT,
    outcome_name TEXT
);

CREATE TABLE IF NOT EXISTS Camera_On (
    event_id UUID PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS Block (
    event_id UUID PRIMARY KEY,
    counterpress BOOLEAN DEFAULT TRUE,
    deflection BOOLEAN DEFAULT TRUE,
    offensive BOOLEAN DEFAULT TRUE,
    save_block BOOLEAN DEFAULT TRUE
);

CREATE TABLE IF NOT EXISTS Offside (
   event_id UUID PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS Clearance (
    event_id UUID PRIMARY KEY,
    aerial_won BOOLEAN DEFAULT TRUE,
    bodypart_id INT,
    bodypart_name TEXT DEFAULT 'head'
);

CREATE TABLE IF NOT EXISTS Interception (
    event_id UUID PRIMARY KEY,
    outcome_id INT,
    outcome_name TEXT
);

CREATE TABLE IF NOT EXISTS Dribble (
    event_id UUID PRIMARY KEY,
    outcome TEXT,
    nutmeg BOOLEAN DEFAULT TRUE,
    overrun BOOLEAN DEFAULT TRUE,
    no_touch BOOLEAN DEFAULT TRUE
);

CREATE TABLE IF NOT EXISTS Shot (
    event_id UUID PRIMARY KEY,
    key_pass_id UUID,
    end_location INT[],
    aerial_won BOOLEAN,
    follows_dribble BOOLEAN,
    first_time BOOLEAN,
    freeze_frame TEXT[],
    open_goal BOOLEAN,
    statsbomb_xg DECIMAL,
    deflected BOOLEAN,
    technique_id INT,
    technique_name TEXT,
    body_part_id INT,
    body_part_name TEXT,
    type_id INT,
    type_name TEXT,
    outcome_id INT,
    outcome_name TEXT
);

CREATE TABLE IF NOT EXISTS Pressure (
    event_id UUID PRIMARY KEY,
    counterpress BOOLEAN
);

CREATE TABLE IF NOT EXISTS Half_Start (
    event_id UUID PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS Substitution (
     event_id UUID PRIMARY KEY,
    replacement_id INT,
    replacement_name TEXT,
    outcome_id INT,
    outcome_name TEXT
);

CREATE TABLE IF NOT EXISTS Own_Goal_Against (
    event_id UUID PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS Foul_Won (
    event_id UUID PRIMARY KEY,
    advantage BOOLEAN DEFAULT TRUE,
    defensive BOOLEAN DEFAULT TRUE,
    penalty BOOLEAN DEFAULT TRUE
);

CREATE TABLE IF NOT EXISTS Foul_Committed (
    event_id UUID PRIMARY KEY,
    advantage BOOLEAN DEFAULT TRUE,
    counterpress BOOLEAN DEFAULT TRUE,
    offensive BOOLEAN DEFAULT TRUE,
    penalty BOOLEAN DEFAULT TRUE,
    card_id INT,
    card_name TEXT,
    type_id INT,
    type_name TEXT
);

CREATE TABLE IF NOT EXISTS Goal_Keeper (
    event_id UUID PRIMARY KEY,
    position_id INT,
    position_name TEXT,
    technique_id INT,
    technique_name TEXT,
    bodypart_id INT,
    bodypart_name TEXT,
    type_id INT,
    type_name TEXT,
    outcome_int INTEGER,
    outcome_name TEXT
);

CREATE TABLE IF NOT EXISTS Bad_Behaviour (
    event_id UUID PRIMARY KEY,
    card_id INT,
    card_name TEXT
);

CREATE TABLE IF NOT EXISTS Own_Goal_For (
     event_id UUID PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS Player_On (
    event_id UUID PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS Player_Off (
    event_id UUID PRIMARY KEY,
    permanent BOOLEAN
);

CREATE TABLE IF NOT EXISTS Shield (
     event_id UUID PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS Pass (
    event_id UUID PRIMARY KEY,
    recipient_id INT,
    recipient_name TEXT,
    _length DECIMAL,
    angle DECIMAL,
    height_id INT,
    height_name TEXT,
    end_location INT[],
    assisted_shot_id UUID,
    backsheet BOOLEAN,
    deflected BOOLEAN,
    miscommunication BOOLEAN,
    _cross BOOLEAN,
    cut_back BOOLEAN,
    switch BOOLEAN,
    shot_assist BOOLEAN,
    goal_assist BOOLEAN,
    bodypart_id INT,
    bodypart_name TEXT,
    type_id INT,
    type_name TEXT,
    outcome_id INT,
    outcome_name TEXT,
    technique_id INT,
    technique_name TEXT
);

CREATE TABLE IF NOT EXISTS fifty_fifty (
    event_id UUID PRIMARY KEY,
    outcome_id INT,
    outcome_name TEXT,
    counterpress BOOLEAN
);

CREATE TABLE IF NOT EXISTS Half_End (
    event_id UUID PRIMARY KEY,
    early_video_end BOOLEAN DEFAULT NULL,
    match_suspended BOOLEAN DEFAULT NULL,
    late_video_start BOOLEAN DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS Starting_XI (
    event_id UUID PRIMARY KEY,
    tactics_formation INT,
    tactics_lineup TEXT[]
);

CREATE TABLE IF NOT EXISTS Tactical_Shift (
    event_id UUID PRIMARY KEY,
    tactics_formation INT,
    tactics_lineup TEXT[]
);

CREATE TABLE IF NOT EXISTS Error (
     event_id UUID PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS Miscontrol (
    event_id UUID PRIMARY KEY,
    aerial_won BOOLEAN DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS Dribbled_Past (
    event_id UUID PRIMARY KEY,
    counterpress BOOLEAN DEFAULT TRUE
);

CREATE TABLE IF NOT EXISTS Injury_Stoppage (
    event_id UUID PRIMARY KEY,
    in_chain BOOLEAN DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS Referee_Ball_Drop (
    event_id UUID PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS Carry (
    event_id UUID PRIMARY KEY,
    end_location INT[]
);
