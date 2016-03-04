note
	description: "Summary description for {GAME_ENGINE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	GAME_ENGINE

create
	make

feature {NONE} -- Initialization

	make
		do

		end

feature -- Access

	run
		do

		end

	level:LEVEL
	attribute check False then end end --| Remove line when `serpent' is initialized in creation procedure.

	serpent: SERPENT
			-- `serpent'
		attribute check False then end end --| Remove line when `serpent' is initialized in creation procedure.


	drawables: LIST[DRAWABLE]
			-- `images_factory'
		attribute check False then end end --| Remove line when `images_factory' is initialized in creation procedure.


	pickables: LIST[PICKABLE]
			-- `images_factory'
		attribute check False then end end --| Remove line when `images_factory' is initialized in creation procedure.


	images_factory: IMAGES_FACTORY
			-- `images_factory'
		attribute check False then end end --| Remove line when `images_factory' is initialized in creation procedure.

	level_factory:LEVEL_FACTORY
		attribute check False then end end
end
