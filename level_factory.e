note
	description: "Summary description for {LEVEL_FACTORY}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	LEVEL_FACTORY

create
	make

feature {NONE} -- Initialization

	make(a_images_factory:IMAGES_FACTORY; a_renderer:GAME_RENDERER)
		do
			images_factory := a_images_factory
			renderer := a_renderer
		end


feature -- Access

	level_easy:LEVEL
		local
			l_texture:GAME_TEXTURE
		do
			l_texture := open_texture("Images/backeasy.png")
			create Result.make (l_texture, level_easy_obstacles)
		end

	level_easy_obstacles:LIST[OBSTACLE]
		do
			create {ARRAYED_LIST[OBSTACLE]}Result.make (4)
			Result.extend (create {OBSTACLE}.make_from_two_points(0,   0, 576,  32))
			Result.extend (create {OBSTACLE}.make_from_two_points(0,   0,  32, 576))
			Result.extend (create {OBSTACLE}.make_from_two_points(0, 544, 576,  32))
			Result.extend (create {OBSTACLE}.make_from_two_points(544,   0,  32, 576))
		end

	level_normal:LEVEL
		local
			l_texture:GAME_TEXTURE
		do
			l_texture := open_texture("Images/backnormal.png")
			create Result.make (l_texture, level_easy_obstacles)
		end

	level_normal_obstacles:LIST[OBSTACLE]
		do
			Result := level_easy_obstacles
			Result.extend (create {OBSTACLE}.make_from_two_points(96, 224, 160,  64))
			Result.extend (create {OBSTACLE}.make_from_two_points(96, 288, 192,  64))
		end

	level_hard:LEVEL
		local
			l_texture:GAME_TEXTURE
		do
			l_texture := open_texture("Images/backhard.png")
			create Result.make (l_texture, level_easy_obstacles)
		end

	level_hard_obstacles:LIST[OBSTACLE]
		do
			Result := level_easy_obstacles
			Result.extend (create {OBSTACLE}.make_from_two_points(32, 224, 160,  64))
			Result.extend (create {OBSTACLE}.make_from_two_points(32, 288, 192,  64))
			Result.extend (create {OBSTACLE}.make_from_two_points(384, 224, 160, 64))
			Result.extend (create {OBSTACLE}.make_from_two_points(352, 288, 192,  64))
		end

	level_too_much:LEVEL
		local
			l_texture:GAME_TEXTURE
		do
			l_texture := open_texture("Images/backtoomuch.png")
			create Result.make (l_texture, level_easy_obstacles)
		end

	level_too_much_obstacles:LIST[OBSTACLE]
		do
			Result := level_easy_obstacles
			Result.extend (create {OBSTACLE}.make_from_two_points(416,  64,  64,  64))
			Result.extend (create {OBSTACLE}.make_from_two_points(32, 224, 160,  32))
			Result.extend (create {OBSTACLE}.make_from_two_points(32, 256, 224,  96))
			Result.extend (create {OBSTACLE}.make_from_two_points(384, 224, 160,  32))
			Result.extend (create {OBSTACLE}.make_from_two_points(320, 256, 224,  96))
			Result.extend (create {OBSTACLE}.make_from_two_points(256, 448,  64,  64))
		end

feature {NONE} -- Implementation

	images_factory:IMAGES_FACTORY

	renderer:GAME_RENDERER

	default_format:GAME_PIXEL_FORMAT
		do
			create Result
			Result.set_index1lsb
		end

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
				end
			else
				create Result.make_not_lockable (renderer, default_format, 1, 1)
			end
		end


end
