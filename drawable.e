note
	description: "Summary description for {DRAWABLE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	DRAWABLE

feature -- Access

	image:GAME_TEXTURE
		attribute check False then end end

	x:INTEGER assign set_x

	y:INTEGER assign set_y

	angle:REAL_64

	set_x(a_x:INTEGER)
		do
			x := a_x
		end

	set_y(a_y:INTEGER)
		do
			y := a_y
		end

	draw(a_renderer:GAME_RENDERER)
		do
			a_renderer.draw_sub_texture_with_scale_rotation_and_mirror (
					image, 0, 0, image.width, image.height, x, y, image.width,
					image.height, image.width // 2, image.height // 2, angle,
					False, False
				)
		end



end
