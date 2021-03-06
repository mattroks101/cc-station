// SPDX-License-Identifier: CC-BY-NC-SA-3.0

/obj/artifact/lamp
	name = "artifact lamp"
	associated_datum = /datum/artifact/lamp
	var/light_brightness = 1
	var/light_R = 1
	var/light_G = 1
	var/light_B = 1
	var/datum/light/light

	New()
		..()
		light_brightness = max(0.5, (rand(5, 20) / 10))
		light_R = rand(25,100) / 100
		light_G = rand(25,100) / 100
		light_B = rand(25,100) / 100
		light = new /datum/light/point
		light.set_brightness(light_brightness)
		light.set_color(light_R, light_G, light_B)
		light.attach(src)

/datum/artifact/lamp
	associated_object = /obj/artifact/lamp
	rarity_class = 1
	validtypes = list("martian","wizard","precursor")
	validtriggers = list(/datum/artifact_trigger/force,/datum/artifact_trigger/electric,/datum/artifact_trigger/heat,
	/datum/artifact_trigger/radiation,/datum/artifact_trigger/carbon_touch,/datum/artifact_trigger/silicon_touch,
	/datum/artifact_trigger/cold)
	activ_text = "begins to emit a steady light!"
	deact_text = "goes dark and quiet."
	react_xray = list(10,90,90,11,"NONE")

	effect_activate(var/obj/O)
		if (..())
			return
		var/obj/artifact/lamp/L = O
		if (L.light)
			L.light.enable()

	effect_deactivate(var/obj/O)
		if (..())
			return
		var/obj/artifact/lamp/L = O
		if (L.light)
			L.light.disable()