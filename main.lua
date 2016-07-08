gridWidth = 10
gridHeight = 10
grid = {} -- grid 
snake = {}
snakeInitialLength = 3

num = 0

function love.load()
   init()
end

function love.draw()
    love.graphics.print("Hello World", 400, 300)
    love.graphics.print(".", num, 300)
    drawGrid()

end

function love.update(dt)
   if love.keyboard.isDown("up") then
      num = num + 10 * dt -- this would increment num by 100 per second
   end
      num = num + 10 * dt -- this would increment num by 100 per second

end

function init()
	for i = 1, gridWidth do
	    grid[i] = {}

	    for j = 1, gridHeight do
	        grid[i][j] = 0 -- Fill the values here
	    end
	end

end 

function drawGrid()
	for i = 1, #grid do

	    for j = 1, #grid[i] do
	        drawTriangle(5 + 50*i, 5+50*j, 40, 40)
	    end
	end
end 

function drawTriangle(x, y, width, height)
	love.graphics.rectangle( "fill", x, y, width, height, 0, 0)
end 