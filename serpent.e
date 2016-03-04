note
	description: "Summary description for {SERPENT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	SERPENT

create
	make

feature {NONE} -- Initialization

	make(a_images_factory:IMAGES_FACTORY)
		do
			create {LINKED_LIST[BODY_PART]}body_parts.make
			body_parts.extend (create {HEAD})
		end

feature -- Access

	body_parts:LIST[BODY_PART]

end
