
KNIGHT_JUMPS = [[2, 1], [2, -1], [1, -2], [-1, -2], [-2, -1], [-2, 1], [-1, 2], [1, 2]]

def knightGraph # create a graph of all possible connections between nodes

    knight_graph = {}
    
    for row in 0..7 do
        for col in 0..7 do
            node_id = coord_to_num(row, col) # turn [x, y] coordinates into unique ID
            possible_moves = []
            KNIGHT_JUMPS.each { |jump| possible_moves << [jump[0] + row, jump[1] + col]} # make each knight move from every individual field on the board
            new_positions = possible_moves.filter { |move| not_out_of_bounds(move)} # filter out moves which are outside of the board
            new_positions = new_positions.map { |pos| coord_to_num(pos[0], pos[1])} # change the coordinates of the valid moves to an ID            
            knight_graph[node_id] = new_positions # assign valid moves (array) to the ID
        end
    end

    knight_graph
end

def coord_to_num(x, y) 
    id = 0
    id += y * 8
    id += x
    id
end

def num_to_coord(id)
    x = id % 8
    y = (id - x) / 8
    [x,y]
end

def not_out_of_bounds(coords)

    return false if (coords[0] < 0 || coords[1] < 0) || (coords[0] > 7 || coords[1] > 7)

    true
end

def knight_moves(start, stop) # knight traversal from starting point to target point
    graph = knightGraph # create a graph of valid knight moves
    start_id = coord_to_num(start[0], start[1])
    stop_id = coord_to_num(stop[0], stop[1])
    path_list = [[start_id]] # create a queue where nodes will be added
    path_index = 0 # create counter to keep track of the length of the path
    previous_nodes = [start_id] # keep track of visited nodes

    if start_id == stop_id # if the start is the same as the stop we can just return
        
        return path_list[0] 
    end
    
    while path_index < path_list.size # search for nodes while the length of the path is less than the number of nodes still to be visited
        current_path = path_list[path_index] 
        last_node = current_path[-1]
        next_nodes = graph[last_node] # get list of connected nodes

        if next_nodes.include?(stop_id) # if the target node is included in the list of nodes to be visited stop
            current_path << stop_id # add target node ID to list of visited path
            return current_path  # return path
        end

        for next_node in next_nodes # for every node in the list of connected nodes
            if !previous_nodes.include?(next_node) # check if node is alteady in the list 
                new_path = current_path[0..] # create a copy of the current path
                new_path << next_node # add node to new path
                path_list << new_path # add new path to list of paths
                previous_nodes << next_node # add node to list of nodes
                
            end
        end
        
        path_index += 1 # increase the length of the path by one
    end

    return [] # return empty list of traversal is not possible
        
end



