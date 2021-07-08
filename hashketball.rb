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

def all_players
  game_hash[:home][:players].concat(game_hash[:away][:players])
end

def num_points_scored(player_name)
  all_players.each { |player|
    if player_name == player[:player_name]
      return player[:points]
    end
  }
end

def shoe_size(player_name)
  all_players.each { |player_hash|
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

#flat_map

def player_stats(player_name)
  all_players.each { |player_hash|
    if player_hash[:player_name] == player_name
      return player_hash
    end
  }
end

def big_shoe_rebounds
  big_shoe = 0
  rebounds = 0
  all_players.each { |player_hash|
    if player_hash[:shoe] > big_shoe
      big_shoe = player_hash[:shoe]
      rebounds = player_hash[:rebounds]
    end
  }  
  rebounds
end

def most_points_scored
  points = 0
  player = ""
  all_players.each { |player_hash|
    if player_hash[:points] > points
      points = player_hash[:points]
      player = player_hash[:player_name]
    end
  }
  player
end

def winning_team
  home_points = 0
  away_points = 0

  game_hash.each { |home_or_away, data|
    i = 0
    if home_or_away == :home
      until i == game_hash[:home][:players].length
        home_points += game_hash[:home][:players][i][:points]
        i += 1
      end
    elsif home_or_away == :away
      until i == game_hash[:away][:players].length
        away_points += game_hash[:away][:players][i][:points]
        i += 1
      end
    end
  }
  
  home_points > away_points ? game_hash[:home][:team_name] : game_hash[:away][:team_name]
end

def player_with_longest_name
  name = ""

  all_players.each { |player_hash|
    if player_hash[:player_name].length > name.length
      name = player_hash[:player_name]
    end
  }
  name
end

def long_name_steals_a_ton?
  player_with_most_steals = ""
  steals = 0

  all_players.each { |player_hash|
    if player_hash[:steals] > steals
      steals = player_hash[:steals]
      player_with_most_steals = player_hash[:player_name]
    end
  }
  player_with_longest_name == player_with_most_steals
end

team_colors("Brooklyn Nets")