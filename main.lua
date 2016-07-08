grid = {width=10, height = 10, array={}} -- grid 

snake = {x=1, y=1, initialLength=3, array={}, direction={x=1, y=0}, speed=2}


age = 0

function love.load()
   init()
end

function love.draw()
    love.graphics.print("Hello World", 400, 300)
    love.graphics.print(".", num, 300)
    drawGrid()
    drawSnake()
    love.graphics.print("Current FPS: "..tostring(love.timer.getFPS( )), 10, 10)
end

function love.update(dt)
	if age > 1/snake.speed then
		updateSnake()
		age = 0
	end
   	-- love.timer.sleep(1/fps)
   	age = age +dt
   	if snake.direction.y == 0 then
	   	if love.keyboard.isDown( "down" ) then
	   		snake.direction = {x=0, y=1}
	   	end

	   	if love.keyboard.isDown( "up" ) then
	   		snake.direction = {x=0, y=-1}
	   	end
	end
	
   	if snake.direction.x == 0 then
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
	for i=1, #snake.array do
		print(i, snake.array[i].x, snake.array[i].y)
	end
	print("*************************")
end 

function drawSnake()
	for i=1, #snake.array do
		drawCell(snake.array[i].x, snake.array[i].y, {r=0, g=255, b=0})
	end
end 

function updateSnake()
	print("-----------------------")
	for i = 1, #snake.array-1 do
	    snake.array[i].x = snake.array[i+1].x
	    snake.array[i].y = snake.array[i+1].y
	end
	snake.array[#snake.array].x = 1+(snake.array[#snake.array].x + snake.direction.x-1)%(grid.width)
	snake.array[#snake.array].y = 1+(snake.array[#snake.array].y + snake.direction.y-1)%(grid.height)

	for i=1, #snake.array do
		print(i, snake.array[i].x, snake.array[i].y)
	end
end 

function drawCell(x, y, color)
	drawTriangle(5 + 50*x, 5+50*y, 40, 40, color)
end 

function drawGrid()
	for i = 1, #grid.array do

	    for j = 1, #grid.array[i] do
	        drawTriangle(5 + 50*i, 5+50*j, 40, 40)
	    end
	end
end 

function drawTriangle(x, y, width, height, color)
	color = color or {r=255, g=255, b=255}
	love.graphics.setColor(color.r,color.g,color.b, 255)
	love.graphics.rectangle( "fill", x, y, width, height, 0, 0)
end 

----------------------- util -------------------------------
