grid = {width=10, height = 10, array={}} -- grid 

snake = {x=1, y=1, initialLength=3, array={}, direction={x=1, y=0}}


num = 0

function love.load()
   init()
end

function love.draw()
    love.graphics.print("Hello World", 400, 300)
    love.graphics.print(".", num, 300)
    drawGrid()
    drawSnake()

end

function love.update(dt)
   if love.keyboard.isDown("up") then
      num = num + 10 * dt -- this would increment num by 100 per second
   end
      num = num + 10 * dt -- this would increment num by 100 per second

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
	    snake.array[i] = {x=snake.x + i*snake.direction.x ,y= snake.y + i*snake.direction.y}
	end

end 

function drawSnake()
	for i=1, #snake.array do
		drawCell(snake.array[i].x, snake.array[i].y, {r=0, g=255, b=0})
	end
end 

function drawCell(x, y, color)
	print(x,y)
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