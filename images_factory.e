note
	description: "Summary description for {IMAGES_FACTORY}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	IMAGES_FACTORY

create
	make

feature {NONE} -- Initialization

	make(a_renderer:GAME_RENDERER)
		do
			has_error := False
			renderer := a_renderer
		end

feature -- Access

	background_easy:GAME_TEXTURE
		do
			Result := open_texture("Images/backeasy.png")
		end

	background_normal:GAME_TEXTURE
		do
			Result := open_texture("Images/backnormal.png")
		end

	background_hard:GAME_TEXTURE
		do
			Result := open_texture("Images/backhard.png")
		end

	background_too_much:GAME_TEXTURE
		do
			Result := open_texture("Images/backtoomuch.png")
		end

	default_image:GAME_TEXTURE
		do
			create Result.make_not_lockable (renderer, default_format, 1, 1)
		end

feature -- Status report

	has_error:BOOLEAN

feature {NONE} -- Implementation

	renderer:GAME_RENDERER

	open_texture(a_name:STRING):GAME_TEXTURE
		local
			l_image:IMG_IMAGE_FILE
		do
			create l_image.make (a_name)
			if l_image.is_openable then
				l_image.open
				if l_image.is_open then
					create Result.make_from_image (renderer, l_image)
				else
					create Result.make_not_lockable (renderer, default_format, 1, 1)
					has_error := True
				end
			else
				create Result.make_not_lockable (renderer, default_format, 1, 1)
				has_error := True
			end
		end

	default_format:GAME_PIXEL_FORMAT
		do
			create Result
			Result.set_index1lsb
		end

end
