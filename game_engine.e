note
	description: "Summary description for {GAME_ENGINE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	GAME_ENGINE

inherit
	GAME_LIBRARY_SHARED

create
	make

feature {NONE} -- Initialization

	make
		local
			l_builder:GAME_WINDOW_RENDERED_BUILDER
		do
			has_error := False
			l_builder.set_dimension (576, 576)
			l_builder.set_title ("Snappy the sssserpent")
			window := l_builder.generate_window
			has_error := window.has_error
			create images_factory.make (window.renderer)
			has_error := has_error or images_factory.has_error
			create level_factory.make (images_factory)
			level := level_factory.level_easy
			has_error := has_error or level_factory.has_error
			create {LINKED_LIST[PICKABLE]}pickables.make
			create serpent.make (images_factory)
		end

feature -- Access

	run
		do
			game_library.quit_signal_actions.extend (agent on_quit (?))
			game_library.iteration_actions.extend (agent on_iteration (?))
			game_library.launch
		end

	level:LEVEL

	serpent: SERPENT

	pickables: LIST[PICKABLE]

	images_factory: IMAGES_FACTORY

	level_factory:LEVEL_FACTORY

	window:GAME_WINDOW_RENDERED

feature -- Status Report

	has_error:BOOLEAN

feature {NONE} -- Implementation

	on_iteration(a_timestamp:NATURAL)
		do
			level.draw (window.renderer)
			across pickables as la_drawables loop
				la_drawables.item.draw(window.renderer)
			end
			across serpent.body_parts as la_drawables loop
				la_drawables.item.draw(window.renderer)
			end
			window.update
		end

	on_quit(a_timestamp:NATURAL)
		do
			game_library.stop
		end

end
