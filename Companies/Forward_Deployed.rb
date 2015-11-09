
require 'set'

# Given a board determine if it is a valid crossword.
Struct.new("Coor",:i_cor, :j_cor)

def neighboring(mat,coor,visited)
	neighbors = []
	if mat[coor.i_cor + 1] != nil then
		if mat[coor.i_cor + 1][coor.j_cor] == 1 && !visited.include?( (coor.i_cor+1).to_s + "," +coor.j_cor.to_s ) then
			a_neighbor = Struct::Coor.new(coor.i_cor + 1,coor.j_cor)
			neighbors.push(a_neighbor)
			visited.add((coor.i_cor+1).to_s + ","+ coor.j_cor.to_s)
		end
		if mat[coor.i_cor+1][coor.j_cor+1] == 1 && !visited.include?((coor.i_cor+1).to_s + ","+ (coor.j_cor+1).to_s) then
			a_neighbor = Struct::Coor.new(coor.i_cor + 1,coor.j_cor+1)
			neighbors.push(a_neighbor)
			visited.add((coor.i_cor+1).to_s + "," +(coor.j_cor+1).to_s)
		end
		if mat[coor.i_cor+1][coor.j_cor-1] == 1 && !visited.include?((coor.i_cor+1).to_s + ","+ (coor.j_cor-1).to_s) then
			a_neighbor = Struct::Coor.new(coor.i_cor + 1,coor.j_cor-1)
			neighbors.push(a_neighbor)
			visited.add((coor.i_cor+1).to_s + ","+ (coor.j_cor-1).to_s)
		end
	end
	if mat[coor.i_cor-1] != nil && coor.i_cor-1 != -1 then
		if mat[coor.i_cor-1][coor.j_cor-1] == 1 && !visited.include?((coor.i_cor-1).to_s + ","+ (coor.j_cor-1).to_s) then
			a_neighbor = Struct::Coor.new(coor.i_cor - 1,coor.j_cor-1)
			neighbors.push(a_neighbor)
			visited.add((coor.i_cor-1).to_s + "," +(coor.j_cor-1).to_s)
		end
		if mat[coor.i_cor-1][coor.j_cor+1] == 1 && !visited.include?((coor.i_cor-1).to_s + ","+ (coor.j_cor+1).to_s) then
			a_neighbor = Struct::Coor.new(coor.i_cor - 1,coor.j_cor+1)
			neighbors.push(a_neighbor)
			visited.add((coor.i_cor-1).to_s + ","+ (coor.j_cor+1).to_s)
		end
		if mat[coor.i_cor - 1][coor.j_cor] == 1 && !visited.include?((coor.i_cor-1).to_s + ","+ coor.j_cor.to_s) then
			a_neighbor = Struct::Coor.new(coor.i_cor - 1,coor.j_cor)
			neighbors.push(a_neighbor)
			visited.add((coor.i_cor-1).to_s + ","+ coor.j_cor.to_s)
		end
	end
	if mat[coor.i_cor][coor.j_cor+1] == 1 && !visited.include?(coor.i_cor.to_s + ","+ (coor.j_cor+1).to_s) then
		a_neighbor = Struct::Coor.new(coor.i_cor,coor.j_cor+1)
		neighbors.push(a_neighbor)
		visited.add(coor.i_cor.to_s + ","+ (coor.j_cor+1).to_s)
	end
	if mat[coor.i_cor][coor.j_cor-1] == 1 && !visited.include?(coor.i_cor.to_s + ","+ (coor.j_cor-1).to_s) then
		a_neighbor = Struct::Coor.new(coor.i_cor,coor.j_cor-1)
		neighbors.push(a_neighbor)
		visited.add(coor.i_cor.to_s + ","+ (coor.j_cor-1).to_s)
	end

	neighbors
end

def bfs(mat,neighbors,visited)
	ans = 1
	while neighbors.size != 0 do
		puts(ans)
		temp = neighbors.pop
		temp_neighbors = neighboring(mat,temp,visited)
		ans += temp_neighbors.size
		neighbors.unshift(temp_neighbors)
		neighbors = neighbors.flatten
	end
	return ans
end

def valid_crossword(board)
	total_count = 0
	(0..board.size-1).each do |i|
		(0..board[0].size-1).each do |j|
			total_count += 1 if board[i][j] == 1
		end
	end
	visited = Set.new []
	(0..board.size-1).each do |i|
		(0..board[0].size-1).each do |j|
			if board[i][j] == 1 then
				puts(i.to_s+","+j.to_s)
				visited.add(i.to_s+","+j.to_s)
				return bfs(board,[Struct::Coor.new(i,j)],visited) == total_count
			end 
		end
	end
end
###############################################################