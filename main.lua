grid = {startPos={x=5, y=20},width=16, height = 13, tilesize=20, array={}} -- grid 

snake = {x=1, y=1, initialLength=3, array={},lastDirection={x=1, y=0}, direction={x=1, y=0}, speed=8}

food = {x=1,y=1}

age = 0
score = 0

function love.load()
	love.window.setMode( 330, 400 )
   init()
end

function love.draw()
    love.graphics.print("Score :"..score, 10, 10)
    drawGrid()
    drawCell(food.x, food.y, {r=255, g=0, b=0})-- draw food
    drawSnake()
end

function love.update(dt)
	if age > 1/snake.speed then
		updateSnake()
		age = 0
	end
   	age = age +dt
   	if snake.lastDirection.y == 0 then
	   	if love.keyboard.isDown( "down" ) then
	   		snake.direction = {x=0, y=1}
	   	end

	   	if love.keyboard.isDown( "up" ) then
	   		snake.direction = {x=0, y=-1}
	   	end
	end
	
   	if snake.lastDirection.x == 0 then
		if love.keyboard.isDown( "left" ) then
	   		snake.direction = {x=-1, y=0}
	   	end

	   	if love.keyboard.isDown( "right" ) then
	   		snake.direction = {x=1, y=0}
	   	end
	end

end

function init()
	---------------------- init grid -------------------------
	for i = 1, grid.width do
	    grid.array[i] = {}

	    for j = 1, grid.height do
	        grid.array[i][j] = 0 -- Fill the values here
	    end
	end

	---------------------- init snake -------------------------
	for i = 1, snake.initialLength do
	    snake.array[i] = {x=1+(snake.x + snake.direction.x*i-1)%(grid.width),
	    				y=1+(snake.y + snake.direction.y*i-1)%(grid.height)}
	end

	spawnFood()
end 

function drawSnake()
	for i=1, #snake.array do
		drawCell(snake.array[i].x, snake.array[i].y, {r=0, g=255, b=0})
	end
end 

function updateSnake()
	snake.lastDirection.x = snake.direction.x
	snake.lastDirection.y = snake.direction.y
	for i = 1, #snake.array-1 do
	    snake.array[i].x = snake.array[i+1].x
	    snake.array[i].y = snake.array[i+1].y
	end
	snake.array[#snake.array].x = 1+(snake.array[#snake.array].x + snake.direction.x-1)%(grid.width)
	snake.array[#snake.array].y = 1+(snake.array[#snake.array].y + snake.direction.y-1)%(grid.height)

	-- collide head with food
	if snake.array[#snake.array].x == food.x and snake.array[#snake.array].y == food.y then
		newPart = {x=snake.array[1].x + (snake.array[2].x - snake.array[1].x),y= snake.array[1].y  + (snake.array[2].y - snake.array[1].y)}
		table.insert(snake.array, 1, newPart)
		spawnFood()
		score = score +1
	end
end 


function drawGrid()
	for i = 1, #grid.array do

	    for j = 1, #grid.array[i] do
	        drawCell(i, j)
	    end
	end
end 

function drawCell(x, y, color)
	drawRectangle(grid.startPos.x + grid.tilesize*.1 + grid.tilesize*(x-1), grid.startPos.y + grid.tilesize*.1+grid.tilesize*(y-1), grid.tilesize*.8, grid.tilesize*.8, color)
end 

function spawnFood ()
	food.x = 1 + math.floor(love.math.random()*10)
	food.y = 1 + math.floor(love.math.random()*10)
end  
function drawRectangle(x, y, width, height, color)
	color = color or {r=255, g=255, b=255}
	love.graphics.setColor(color.r,color.g,color.b, 255)
	love.graphics.rectangle( "fill", x, y, width, height, 0, 0)
end 

----------------------- util -------------------------------
