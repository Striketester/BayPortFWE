#include "meatstation_areas.dm"

/obj/overmap/visitable/sector/meatstation
	name = "Unpowered Research Station"
	desc = "An unpowered research station. A large quantity of nearby debris blocks more detail."
	icon_state = "object"

	initial_generic_waypoints = list(
		"nav_meatstation_1",
		"nav_meatstation_2",
		"nav_meatstation_3",
		"nav_meatstation_4",
		"nav_meatstation_antag"
	)

/datum/map_template/ruin/away_site/meatstation
	name = "Meatstation"
	id = "awaysite_meatstation"
	description = "It's a research station full of baddies and some unique loot."
	suffixes = list("meatstation/meatstation.dmm")
	spawn_cost = 1
	area_usage_test_exempted_root_areas = list(/area/meatstation)

/obj/shuttle_landmark/nav_meatstation/nav1
	name = "Navpoint #1"
	landmark_tag = "nav_meatstation_1"

/obj/shuttle_landmark/nav_meatstation/nav2
	name = "Navpoint #2"
	landmark_tag = "nav_meatstation_2"

/obj/shuttle_landmark/nav_meatstation/nav3
	name = "Navpoint #3"
	landmark_tag = "nav_meatstation_3"

/obj/shuttle_landmark/nav_meatstation/nav4
	name = "Navpoint #4"
	landmark_tag = "nav_meatstation_4"

/obj/shuttle_landmark/nav_meatstation/nav5
	name = "Navpoint #5"
	landmark_tag = "nav_meatstation_antag"

//structural

/obj/paint/meatstation
	color = "#543333"

/obj/paint/meatstation/lab
	color = "#301f1f"

/obj/machinery/power/apc/meatstation
	cell_type = /obj/item/cell/crap
	operating = 0
	locked = 0
	coverlocked = 0

//mobs

/mob/living/simple_animal/hostile/meatstation
	name = "meatstation mob"
	desc = "it's meaty!"
	icon = 'maps/away/meatstation/meatstation_sprites.dmi'
	response_help = "pats"
	response_disarm = "shoves"
	response_harm = "stomps"
	flash_vulnerability = 0 //eyeless
	turns_per_move = 5
	natural_weapon = /obj/item/natural_weapon/bite/weak
	faction = "meat"
	min_gas = null
	minbodytemp = 0
	meat_type = /obj/item/reagent_containers/food/snacks/meat/meatstationmeat
	meat_amount = 1
	can_escape = TRUE

	ai_holder = /datum/ai_holder/simple_animal/melee/meatstation

/mob/living/simple_animal/hostile/meatstation/meatworm
	name = "flesh worm"
	desc = "A toothy little thing. It won't stop gnashing and thrashing!"
	icon_state = "meatworm"
	icon_living = "meatworm"
	icon_dead = "meatworm_dead"
	turns_per_move = 3
	speed = -2
	maxHealth = 20
	health = 20
	natural_weapon = /obj/item/natural_weapon/bite/weak
	mob_size = MOB_SMALL
	meat_amount = 2
	can_escape = FALSE

	say_list_type = /datum/say_list/meatstation/meatworm

/mob/living/simple_animal/hostile/meatstation/meatball
	name = "animated meat"
	desc = "A crude creature of meat and teeth."
	icon_state = "meatball"
	icon_living = "meatball"
	icon_dead = "meatball_dead"
	speed = 2
	maxHealth = 50
	health = 50
	natural_weapon = /obj/item/natural_weapon/meatball
	meat_amount = 2
	can_escape = FALSE

	say_list_type = /datum/say_list/meatstation/meatball

/obj/item/natural_weapon/meatball
	force = 12
	attack_verb = list("thwacked")

/mob/living/simple_animal/hostile/meatstation/wormscientist
	name = "infested scientist"
	desc = "A scientist infested with some sort of parasitic worms."
	icon_state = "wormscientist"
	icon_living = "wormscientist"
	icon_dead = "wormscientist_dead"
	speed = 7
	maxHealth = 90
	health = 90
	natural_weapon = /obj/item/natural_weapon/wormscience
	meat_amount = 3

	say_list_type = /datum/say_list/meatstation/meat_human

/obj/item/natural_weapon/wormscience
	force = 15
	attack_verb = list("whacked")

/mob/living/simple_animal/hostile/meatstation/wormguard
	name = "infested guard"
	desc = "An armed guard infested with some sort of parasitic worms. It looks like their hands have melded with their weapon."
	icon_state = "wormguard"
	icon_living = "wormguard"
	icon_dead = "wormguard_dead"
	speed = 7
	maxHealth = 60
	health = 60
	natural_weapon = /obj/item/natural_weapon/wormguard
	meat_amount = 3
	projectilesound = 'sound/weapons/Laser.ogg'
	ranged = 1
	projectiletype = /obj/item/projectile/beam/smalllaser

	say_list_type = /datum/say_list/meatstation/meat_human
/obj/item/natural_weapon/wormguard
	force = 17
	attack_verb = list("slammed")

/mob/living/simple_animal/hostile/meatstation/meatmound
	name = "meat horror"
	desc = "A gnashing mound of flesh and teeth."
	icon_state = "meatmound"
	icon_living = "meatmound"
	icon_dead = "meatmound_dead"
	flash_vulnerability = 1
	speed = 10
	maxHealth = 160
	health = 160
	natural_weapon = /obj/item/natural_weapon/meatmound
	meat_amount = 4
	mob_size = MOB_LARGE

	say_list_type = /datum/say_list/meatstation/meatmound

/obj/item/natural_weapon/meatmound
	force = 25
	sharp = TRUE
	attack_verb = list("chomped")

//items

/obj/item/reagent_containers/food/snacks/meat/meatstationmeat
	name = "tainted meat"
	desc = "A disgusting slab of meat."
	icon = 'maps/away/meatstation/meatstation_sprites.dmi'
	icon_state = "meat"
	filling_color = "#f41d7e"
	slice_path = /obj/item/reagent_containers/food/snacks/rawcutlet/meatstation

/obj/item/reagent_containers/food/snacks/meat/meatstationmeat/New()
	..()
	reagents.add_reagent(/datum/reagent/nutriment/protein, 6)
	reagents.add_reagent(/datum/reagent/lexorin, 6)
	reagents.add_reagent(/datum/reagent/toxin/bromide, 3)
	bitesize = 3

/obj/item/reagent_containers/food/snacks/rawcutlet/meatstation
	name = "tainted meat chunk"
	desc = "A disgusting chunk of meat."
	icon = 'maps/away/meatstation/meatstation_sprites.dmi'
	icon_state = "meatchunk"

/obj/item/cell/infinite/meatstation
	name = "biological power cell"
	desc = "A throbbing, biological power cell."
	icon = 'maps/away/meatstation/meatstation_sprites.dmi'
	icon_state = "biocell"
	origin_tech =  list(TECH_ENGINEERING = 3, TECH_MATERIAL = 4, TECH_BIO = 7)
	maxcharge = 500
	matter = null

//notes
//they're kinda rough, if you want to take another stab at these please do

/obj/item/paper/meatstation/biocell_note//this one's here to let players know those meat cells aren't just trash 500W power cells
	name = "journal entry"
	info = "Davis finally did it! After months of trial and error, he actually did it. All those tedious hours he spent in the lab recombobulating mitochondrial strands weren't a total waste. All to produce a biological power cell capable of producing power indefinitely through - well I'm actually not sure how. I think Davis said something about latent bluespace particles. I'll get a more concrete answer from him later. I think Robertson is upset her worms have taken a back seat. We're just excited about the implications of Davis's success is all. I'll have to make sure to tell her we'll keep them in mind."

/obj/item/paper/meatstation/xenoflora_note//this one is to try and justify the breaches all over
	name = "apology letter"
	info = "Dear Chief Daniels,<br><br>I'm sorry I'm a brilliant scientist. I'm sorry I spent months of my life perfecting the genes of a highly volatile xenoflora sample. I'm sorry your idiot dockhand thought that xenoflora sample was a plum tree. I'm sorry that idiot dockhand decided to pick some fruit from the xenoflora sample. I'm sorry that Mr. Idiot Dockhand decided to consume said fruit while standing in the cargo airlock. I'm sorry you whined and cried about how it was all my fault. I'm sorry I'm now required to hand write you an apology letter. I'm sorry you've been avoiding me these past few days. Most of all, I'm sorry I haven't been able to share my thoughts with you on this matter in person, one on one.<br><br>Regards,<br><br>You know who I am, you little shit.<br><br><br>P.S.<br>I know you'll be at Robertson's demonstration tomorrow. Maybe we can have a little chat afterwards."

/obj/item/paper/meatstation/weapon_note//and this one's here to give players some mechanical knowledge about the gun unique to this away site
	name = "note"
	info = "Okay, admittedly going with the LP76's wouldn't be all sunshine and rainbows, but it's still the right call. Yeah sure, maybe they've got a slower fire rate. And yes, you could argue that technically, since they were originally designed to be a non-lethal alternative, they might not pack the punch of today's weapons. But we're getting a hell of a deal here! If we go with the LP76's, we'll actually be able to afford enough of them to arm the entire security team, and then some! And just because they're non-lethal weapons doesn't mean they're not effective. They hurt like hell, and those stun beams are intense enough to burn flesh!<br>Look, let's be real here: the security team is pretty much just pirate deterrent. If some pirates do decide to raid us, once they see we're shooting back they'll go running back to whatever 'roid base they call home. I guarantee we won't need anything beefier than the LP76. Trust me."

//random spawns

/obj/random/single/meatstation
	icon = 'maps/away/meatstation/meatstation_sprites.dmi'
	icon_state = "50template"

/obj/random/single/meatstation/low
	icon_state = "10template"
	spawn_nothing_percentage = 90

/obj/random/single/meatstation/meatworm
	icon_state = "meatworm50"
	spawn_object = /mob/living/simple_animal/hostile/meatstation/meatworm

/obj/random/single/meatstation/meatball
	icon_state = "meatball50"
	spawn_object = /mob/living/simple_animal/hostile/meatstation/meatball

/obj/random/single/meatstation/wormscientist
	icon_state = "wormscientist50"
	spawn_object = /mob/living/simple_animal/hostile/meatstation/wormscientist

/obj/random/single/meatstation/wormguard
	icon_state = "wormguard50"
	spawn_object = /mob/living/simple_animal/hostile/meatstation/wormguard

/obj/random/single/meatstation/meatmound
	icon_state = "meatmound50"
	spawn_object = /mob/living/simple_animal/hostile/meatstation/meatmound

/obj/random/single/meatstation/cell
	icon_state = "biocell50"
	spawn_object = /obj/item/cell/infinite/meatstation

/obj/random/single/meatstation/laser
	icon_state = "laser50"
	spawn_object = /obj/item/gun/energy/laser/xenofauna/broken

/obj/random/single/meatstation/low/biocell
	icon_state = "biocell10"
	spawn_object = /obj/item/cell/infinite/meatstation

/obj/random/single/meatstation/low/wormguard
	icon_state = "wormguard10"
	spawn_object = /mob/living/simple_animal/hostile/meatstation/wormguard

/obj/random/single/meatstation/low/wormscientist
	icon_state = "wormscientist10"
	spawn_object = /mob/living/simple_animal/hostile/meatstation/wormscientist

/datum/ai_holder/simple_animal/melee/meatstation

/datum/say_list/meatstation/meatworm
	emote_see = list("gnashes", "thrashes about", "chomps the air")

/datum/say_list/meatstation/meatball
	emote_hear = list("cackles","gibbers")
	emote_see = list("gnashes", "writhes", "gurgles","clicks its teeth")

/datum/say_list/meatstation/meat_human
	emote_hear = list("gurgles","moans")
	emote_see = list("wobbles", "writhes", "twitches","shudders", "trembles")

/datum/say_list/meatstation/meatmound
	emote_hear = list("roars","moans","growls")
	emote_see = list("gnashes", "undulates", "gurgles","chomps")
