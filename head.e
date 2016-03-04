note
	description: "Summary description for {HEAD}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	HEAD

inherit
	BODY_PART

create
	make

feature {NONE} -- Initialization

	make(a_image_factory:IMAGES_FACTORY)
		do
			x := 288
			y := 288
			angle := 0
		end

end
