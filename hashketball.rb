require "pry"
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

# Helper function to output an array, within which are hashes of each individual players on each team
def all_players(game_hash)
  game_hash[:home][:players] + game_hash[:away][:players]
end


def num_points_scored(player_name)
  # Returns the points scored for that player
  all_players(game_hash).each do |player|
    return player[:points] if player[:player_name] == player_name
  end
end


def shoe_size(player_name)
  # Returns the shoe size for that player
  all_players(game_hash).each do |player|
    return player[:shoe] if player[:player_name] == player_name
  end
end


def team_colors(team_name)
  # Returns an Array of that team's colors
  game_hash.each do |key, value|
    return value[:colors] if value[:team_name] == team_name
  end
end


def team_names
  # Returns an array of team names
  # .collect will return what you ask for in an array
  result = game_hash.collect do |key, value|
    value[:team_name]
  end
end


def player_numbers(team_name)
  # Returns an array of the jersey numbers for that team
  result = []
  
  game_hash.each do |key, value|
    if value[:team_name] == team_name
      value[:players].each { |player| result << player[:number] }
    end
  end
  
  result
end


def player_stats(player_name)
  # Returns a hash of that player's stats
  all_players(game_hash).each do |player|
    return player if player[:player_name] == player_name
  end
end

def big_shoe_rebounds
  # Returns the number of remounds of the player with the biggest shoe size
  biggest_shoe_size = nil
  player_number_rebounds = nil
  
  all_players(game_hash).each do |player|
    if biggest_shoe_size == nil || player[:shoe] > biggest_shoe_size
      biggest_shoe_size = player[:shoe]
      player_number_rebounds = player[:rebounds]
    end
  end
  
  player_number_rebounds
end