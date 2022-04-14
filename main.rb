
require './board.rb'
require './knight.rb'

def get_coordinates(position)
    coordinates = [-1, -1]

    while !coordinates.all? { |num| num > -1 && num < 8}
        puts "Please enter #{position} coordinates (two numbers between 0 and 7 separated by a comma)."
        coordinates = gets.chomp.split(',').map! {|a| a.to_i}
    end

    return coordinates
end

def main
    board = Board.new
    start = nil
    stop = nil

    while !start || !stop
        start = get_coordinates("start")
        stop = get_coordinates("stop")
    end

    puts "Thank you. Start is #{start} and stop is #{stop}"
    sleep(2)
    puts `clear`
    moves = knight_moves(start, stop)
    
    puts "You made it in #{moves.size - 1} moves!. Here's your path:"
    moves.each do |move| 
        coords = num_to_coord(move)
        puts "#{coords}"
        board.put_character(coords, "b_knight")
    end

    
end


main