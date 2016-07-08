-- grid 
grid = {}
for i = 10, 10 do
    grid[i] = {}

    for j = 1, 5 do
        grid[i][j] = 0 -- Fill the values here
    end
end

num = 0
function love.draw()
    love.graphics.print("Hello World", 400, 300)
    love.graphics.print(".", num, 300)
    drawTriangle(0, 0, 100, 100)
end

function love.update(dt)
   if love.keyboard.isDown("up") then
      num = num + 10 * dt -- this would increment num by 100 per second
   end
      num = num + 10 * dt -- this would increment num by 100 per second

end

function drawTriangle(x, y, width, height)
	love.graphics.rectangle( "fill", x, y, width, height, 0, 0)
end 