class Game
  require_relative "combination"
  require_relative "hint"

  def initialize
    puts "Computer will pick the solution randomly..."
    sleep 0.5
    @solution = Solution.new
    puts "The solution has been picked."
    play
  end

  def play    # Exectues the actual game
    count = 1
    while count <= 12
      puts "\nType your guess number #{count}:"
      guess = Guess.new(get_colors)
      if check_solution(guess)
        puts "You found the right combination, well done!"
        puts "The solution was #{@solution.to_string}"
        break
      end
      hint = Hint.new(create_hint(guess))
      puts "Hints:"
      puts hint.to_string
      count += 1
    end
    if count == 13
      puts "Game over!"
      puts "The solution was #{@solution.to_string}"
    end
  end

  private

  def get_colors  # Asks for a guess from the user
    str = gets.chomp
    while !str.match?(/[a-z]{3,6}, [a-z]{3,6}, [a-z]{3,6}, [a-z]{3,6}/)
      puts "Wrong format, remember to type the colors separated by a comma and a space (, )"
      str = gets.chomp
    end
    return str_arr = str.split(", ")
  end

  def check_solution(guess)   # Checks if the guess equals the solution
    if guess.colors == @solution.colors
      return true
    else
      return false
    end
  end

  def create_hint(guess)    # Compares the guess to the solution and returns an array
    arr = [0, 0, 0, 0]
    already_used = [false, false, false, false]
    for i in 0..3   # Adds blacks
      if guess.colors[i] == @solution.colors[i]
        arr[i] = 1
        already_used[i] = true
      end
    end
    for guess_index in 0..3   # Adds whites
      if !already_used[guess_index]
        for solution_index in 0..3
          if arr[solution_index] == 0 && guess.colors[guess_index] == @solution.colors[solution_index]
            arr[solution_index] = 2
            break
          end
        end
      end
    end
    return arr
  end
end
