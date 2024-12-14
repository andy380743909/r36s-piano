-- Scoreless Music Piano (SMPiano) by Joash Chee, Started on 2024

require "love-ansi"

-- load scene files here
scene = {}
scene[100] = require "scene-100" -- SMPiano
scene[999] = require "scene-999" -- SMPiano


-- define local variables here [start]
scene.current = 100
scene.previous = 100


-- define global variables used in all scenes
bgart = {}
sfx = {}
help = {}
local helpTextBackDrop = love.graphics.newImage("bgart/helptext-backdrop.png")


-- define global variables, used in scene-997
triggerReport = ""
frameElapsed = 0 -- to check on love.update

-- input states [start]
dpadState = {}
fbtnState = {}
lstkState = {}
rstkState = {}
bbtnState = {}
miscState = {}
for i = 1,4 do
	dpadState[i] = ".."
	fbtnState[i] = ".."
	lstkState[i] = ".."
	rstkState[i] = ".."
	bbtnState[i] = ".."
	miscState[i] = ".."
end
-- L3 and R3 buttons added (requires manual edit on gptokeyb file on console)
miscState[5] = ".."
miscState[6] = ".."
-- input states [end]

-- define variables here [end]


-- one-time setup of game / app, loading assets
function love.load()
    mainFont = love.graphics.newFont("menlo.ttf", 18)
    -- initialise all scenes
	scene[100].init()
	scene[999].init()
end


-- load 1st scene input schema here
scene[scene.current].input()








function love.quit()
  	-- This will be printed to the console on quit
  	print("Closing app normally with ESC")
end


-- to make game state changes frame-to-frame
function love.update(dt)
    frameElapsed = frameElapsed + 1
end


-- to render game state onto the screen, 60 fps
function love.draw()
	-- load scene draw state here
	if love.keyboard.isDown("escape") then
		love.graphics.draw(helpTextBackDrop, 0, 0) -- SELECT shows scene help
	else
		love.graphics.draw(bgart[scene.current], 0, 0) -- draw regular scene background
	end
	scene[scene.current].draw()
end