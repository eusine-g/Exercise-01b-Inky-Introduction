/*
This is a comment block. It won't be read as an Ink story.
Comments are very useful for leaving ideas for story and functionalty

This exercise will demonstrate the following in the example video:
 * Basic Choices
 * Knot structure
 * Recurring choices
 * Conditionals in descriptions
 * Conditionals in choices
 
 In the assignment:
 - Add four more knots (and feel free to change any of the example text, this is YOUR story)
 - Add at least one more conditional
*/

-> cave_mouth

== cave_mouth ==
You are at the entrance to a cave. {not torch_pickup:There is a torch on the floor.} The cave extends to the east and west.
+ [Take the east tunnel] -> east_tunnel
+ [Take the west tunnel] -> west_tunnel
* [Pick up the torch] -> torch_pickup

== east_tunnel ==
{not east_tunnel_lit:You are in the east tunnel. It is very dark, you can't see anything.}{east_tunnel_lit: The light of your torch glints off of the thousands of coins in the room.}{rich_room: there is a quantity of coins missing that now line your pockets.}
* {torch_pickup}{not rich_room} [Light Torch] -> east_tunnel_lit
* {east_tunnel_lit}{not rich_room} [Gather as many as you can] -> rich_room
+ [Go Back] -> cave_mouth
-> END

== west_tunnel ==
You are in the west tunnel. {torch_pickup: {not open_wall_west:There is a mural on the wall with two figures. They are holding unlit torches.}} {open_wall_west: There is a hole in the wall where a mural used to be.}{not torch_pickup: It is too dark to make anything out.}
* {torch_pickup} [Light their torches] -> open_wall_west
+ [Go Back] -> cave_mouth
+ {open_wall_west} [Delve deeper] -> scary_room
-> END

=== torch_pickup ===
You now have a torch. May it light the way.
* [Go Back] -> cave_mouth
-> END

== east_tunnel_lit ==
The light of your torch glints off of the thousands of coins in the room.{rich_room: there is a quantity of coins missing that now line your pockets.}
* [Gather as many as you can] -> rich_room
+ [Go Back] -> cave_mouth
-> END

== open_wall_west ==
The two figures crumble away revealing a hole in the wall.
+ [Go back] -> west_tunnel

== scary_room ==
The opening suddenly closes behind you. As you look forward you see a massive room with thousands of the same mural from before. They seem to be lighting the way to the center of the room, which is shrouded in darkness.
+ [Walk to the center] -> scary_center
+ [Go Back] -> too_bad
-> END

== rich_room ==
You were able to fit many of the coins into your inventory, but many still remain.
+ [Go Back] -> east_tunnel

== too_bad ==
You are unable to return.
+ [Weigh your options] -> scary_room

== scary_center ==
You stumble around the center of the room, you look around above you and in front of you to try and see what the murals could be pointing to. Because of this you don't see the ground beneath you. You take a misstep and fall into a hole. This is where your journey ends.
-> END 