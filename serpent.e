note
	description: "Summary description for {SERPENT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	SERPENT

feature -- Access

	body_parts:LIST[BODY_PART]
		attribute
			create {ARRAYED_LIST[BODY_PART]}Result.make (0)
		end

end
