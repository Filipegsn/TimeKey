
local loader = require("AdvTiledLoader.Loader")

player = {
  charQuads = {},
  charImage = love.graphics.newImage("Imagens/char.png"),
  frame = 1,
  frametime = 0,
  xws = 0,
  yws = 0,
  xs = 0,
  ys = 0,
  x = 51,
  y = 28,
  speed = 4,
  dir = "down"
}

local hero_walk = {} --vetor de imagem
local hero_anim_frame = 1
local hero_pos_x = 100
local hero_pos_y = 255

function love.load()
  for x = 1, 16 ,1 do --carrega as imagens da animação
    hero_walk[x] = love.graphics.newImage("Hero_walk_"..x..".png")
  end
end

function love.update(dt)
  -- >>
  if love.keyboard.isDown("right") then
    hero_pos_x = hero_pos_x + (100 * dt) --mov o char
    hero_anim_frame = hero_anim_frame + 1 --incrementa animação

    if hero_anim_frame > 4 then --loop de animação
      hero_anim_frame = 1
    end
  end
  -- <<
    if love.keyboard.isDown("left") then
      hero_pos_x = hero_pos_x + (-100 * dt) --mov o char
      hero_anim_frame = hero_anim_frame + 1 --incrementa animação

      if hero_anim_frame > 8 then --loop de animação
        hero_anim_frame = 5
      end
    end
-- ^^
  if love.keyboard.isDown("up") then
    hero_pos_y = hero_pos_y + (-100 * dt) --mov o char
    hero_anim_frame = hero_anim_frame + 1 --incrementa animação

    if hero_anim_frame > 12 then --loop de animação
      hero_anim_frame = 9
    end
  end
-- baixo
    if love.keyboard.isDown("down") then
      hero_pos_y = hero_pos_y + (100 * dt) --mov o char
      hero_anim_frame = hero_anim_frame + 1 --incrementa animação

      if hero_anim_frame > 16 then --loop de animação
        hero_anim_frame = 13
      end
    end
end

function love.draw() --desenha o percuso do char usando o indice de animação
  love.graphics.draw(hero_walk[hero_anim_frame], hero_pos_x, hero_pos_y)
end
