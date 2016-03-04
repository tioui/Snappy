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

	make(a_images_factory:IMAGES_FACTORY)
		do
			images_factory := a_images_factory
		end


feature -- Access

	level_easy:LEVEL
		local
			l_texture:GAME_TEXTURE
		do
			l_texture := images_factory.background_easy
			create Result.make (l_texture, level_easy_obstacles)
		end

	level_normal:LEVEL
		local
			l_texture:GAME_TEXTURE
		do
			l_texture := images_factory.background_normal
			create Result.make (l_texture, level_easy_obstacles)
		end

	level_hard:LEVEL
		local
			l_texture:GAME_TEXTURE
		do
			l_texture := images_factory.background_hard
			create Result.make (l_texture, level_easy_obstacles)
		end

	level_too_much:LEVEL
		local
			l_texture:GAME_TEXTURE
		do
			l_texture := images_factory.background_too_much
			create Result.make (l_texture, level_easy_obstacles)
		end

	default_level:LEVEL
		local
			l_texture:GAME_TEXTURE
		do
			l_texture := images_factory.default_image
			create Result.make (l_texture, create {ARRAYED_LIST[OBSTACLE]}.make (0))
		end

feature -- Status report

	has_error:BOOLEAN
		do
			Result := images_factory.has_error
		end

feature {NONE} -- Implementation

	level_easy_obstacles:LIST[OBSTACLE]
		do
			create {ARRAYED_LIST[OBSTACLE]}Result.make (4)
			Result.extend (create {OBSTACLE}.make_from_two_points(0,   0, 576,  32))
			Result.extend (create {OBSTACLE}.make_from_two_points(0,   0,  32, 576))
			Result.extend (create {OBSTACLE}.make_from_two_points(0, 544, 576,  32))
			Result.extend (create {OBSTACLE}.make_from_two_points(544,   0,  32, 576))
		end

	level_normal_obstacles:LIST[OBSTACLE]
		do
			Result := level_easy_obstacles
			Result.extend (create {OBSTACLE}.make_from_two_points(96, 224, 160,  64))
			Result.extend (create {OBSTACLE}.make_from_two_points(96, 288, 192,  64))
		end

	level_hard_obstacles:LIST[OBSTACLE]
		do
			Result := level_easy_obstacles
			Result.extend (create {OBSTACLE}.make_from_two_points(32, 224, 160,  64))
			Result.extend (create {OBSTACLE}.make_from_two_points(32, 288, 192,  64))
			Result.extend (create {OBSTACLE}.make_from_two_points(384, 224, 160, 64))
			Result.extend (create {OBSTACLE}.make_from_two_points(352, 288, 192,  64))
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

	images_factory:IMAGES_FACTORY


end
