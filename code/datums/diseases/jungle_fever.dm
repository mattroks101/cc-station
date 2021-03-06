// SPDX-License-Identifier: CC-BY-NC-SA-3.0

/datum/ailment/disease/jungle_fever
	name = "Jungle Fever"
	max_stages = 1
	cure = "Incurable"
	associated_reagent = "banana peel"
	affected_species = list("Monkey")

	stage_act(var/mob/living/carbon/human/affected_mob,var/datum/ailment_data/D)
		if (..() || !istype(affected_mob))
			return 1


		if (!affected_mob:mutantrace)
			affected_mob:monkeyize()

		return 0