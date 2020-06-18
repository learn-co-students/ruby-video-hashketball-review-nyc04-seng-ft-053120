require "pry"

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

def players
  game_hash[:home][:players].concat(game_hash[:away][:players])
end

def num_points_scored(player_name)
  players.each { |player|
    if player_name == player[:player_name]
      return player[:points]
    end
  }
end

def shoe_size(player_name)
  players.each { |player_hash|
    if player_hash[:player_name] == player_name
      return player_hash[:shoe]
    end
  }
end

def team_colors(team_name)
  if team_name == game_hash[:home][:team_name]
    game_hash[:home][:colors]
  else
    game_hash[:away][:colors]
  end
end

def team_names
  game_hash.map { |location, team_data|
    team_data[:team_name]
  }
end

def player_numbers(team_name)
  if team_name == game_hash[:home][:team_name]
    game_hash[:home][:players].map { |player_hash|
      player_hash[:number]
    }
  else 
    game_hash[:away][:players].map { |player_hash|
      player_hash[:number]
    }
  end
end

def player_stats(player_name)
  players.each { |player_hash|
    if player_hash[:player_name] == player_name
      return player_hash
    end
  }
end

def big_shoe_rebounds
  big_shoe = 0
  players.each { |player_hash|
    if player_hash[:shoe] > big_shoe
      big_shoe = player_hash[:shoe]
    end
  }  
  players.each { |player_hash|
    if player_hash[:shoe] == big_shoe
      return player_hash[:rebounds]
    end
  }
end

# Bonus Questions:

# If you would like to take on a few more challenges, there are a few more things you can do. There are not tests for this content - these are provide for additional practice working with hash data.

# Define methods to return the answer to the following questions:

# Which player has the most points? Call the method most_points_scored.

# Which team has the most points? Call the method winning_team.

# Which player has the longest name? Call the method player_with_longest_name.

# Super Bonus:

# Write a method that returns true if the player with the longest name had the most steals. Call the method long_name_steals_a_ton?.