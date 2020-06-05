# Write your code below game_hash

def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

# Write code here
def num_points_scored(player_name)
  player = player_hash(player_name)
  return player[:points]
end

def shoe_size(player_name)
  player = player_hash(player_name)
  return player[:shoe]
end

def team_colors(team_name)
  team = team_hash(team_name)
  return team[:colors]
end

def team_names
  data = game_hash
  home_name = data[:home][:team_name]
  away_name = data[:away][:team_name]
  return [home_name, away_name]
end

def player_numbers(team_name)
  players_array = team_players_array(team_name)
  return players_array.map {|player| player[:number]}
end

def player_stats(player_name)
  return player_hash(player_name)
end

def big_shoe_rebounds
  return player_max_stat(:shoe)[:rebounds]
end

def most_points_scored
  return player_max_stat(:points)[:player_name]
end

def winning_team
  data = game_hash()
  team_points = team_points_hash()
  home_points = team_points[:home]
  away_points = team_points[:away]
  
  if home_points > away_points
    return data[:home][:team_name]
  elsif away_points < home_points
    return data[:team_name]
  else
    return "It's a draw"
  end
end

def player_with_longest_name
  all_players = all_players_array()
  max_length = -1
  target_player = ""
  
  all_players.each do |player|
    cur_name_length = player[:player_name].length
    if cur_name_length > max_length
      max_length = cur_name_length
      target_player = player[:player_name]
    end
  end
 
  return target_player
end

def long_name_steals_a_ton?
  longest_name = player_with_longest_name()
  player_with_max_steals = player_max_stat(:steals)[:player_name]
  return longest_name == player_with_max_steals
end

# ### helper methods ### #
def home_players_array
  data = game_hash()
  return data[:home][:players]
end

def away_players_array
  data = game_hash()
  return data[:away][:players]
end

def all_players_array
  data = game_hash()
  home = data[:home][:players]
  away = data[:away][:players]
  return home.concat(away)
end

def team_players_array(team_name)
  data = game_hash()
  
  data.each do |top_key, hash|
    if data[top_key][:team_name] == team_name
      return data[top_key][:players]
    end
  end
  
  return nil
end

def team_hash(team_name)
  data = game_hash()
  
  data.each do |top_key, hash|
    if data[top_key][:team_name] == team_name
      return data[top_key]
    end
  end
  
  return nil
end

def team_points_hash
  home_players = home_players_array()
  away_players = away_players_array()
  
  home_points = home_players.reduce(0) {|acc, player| acc += player[:points]}
  away_points = away_players.reduce(0) {|acc, player| acc += player[:points]}
  
  return result = {
    home: home_points,
    away: away_points
  }
end

def player_hash(player_name)
  all_players = all_players_array()
  
  all_players_array.each do |player|
    if player[:player_name] == player_name
      return player
    end
  end
end

def player_max_stat(stat_key)
  max = -Float::INFINITY
  target_player = nil
  all_players = all_players_array()
  
  all_players.each do |player|
    if player[stat_key] > max
      max = player[stat_key]
      target_player = player
    end
  end
  
  return target_player
end