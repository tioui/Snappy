note
	description: "Summary description for {COLLIDABLE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	COLLIDABLE

feature {NONE} -- Initialization

	make_from_two_points(a_x1, a_y1, a_x2, a_y2:INTEGER)
		do
			x1 := a_x1
			y1 := a_y1
			x2 := a_x2
			y2 := a_y2
		end

	make_from_point_and_dimension(a_x, a_y, a_width, a_height:INTEGER)
		do
			x1 := a_x
			y1 := a_y
			x2 := a_x + a_width
			y2 := a_y + a_height
		end

feature -- feature

	x1:INTEGER

	y1:INTEGER

	x2:INTEGER

	y2:INTEGER

end
