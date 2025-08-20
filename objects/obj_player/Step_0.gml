var right_key = keyboard_check(vk_right);
var left_key = keyboard_check(vk_left);
var up_key = keyboard_check(vk_up);
var down_key = keyboard_check(vk_down);

//get xspd and yspd
xspd = (right_key - left_key) * move_spd;
yspd = (down_key - up_key) * move_spd;


if instance_exists(obj_pauser)
{
	xspd = 0;
	yspd = 0;
}



//set sprite

mask_index = sprite[MOVE_DOWN]; //the collision mask is from the MOVE_DOWN sprite

if yspd == 0 
{
	if xspd > 0 {face = MOVE_RIGHT};
	if xspd < 0 {face = MOVE_LEFT};
}

if xspd > 0 and face != MOVE_RIGHT {face = MOVE_RIGHT};
if xspd < 0 and face != MOVE_LEFT {face = MOVE_LEFT};

if xspd == 0
{
	if yspd > 0 {face = MOVE_DOWN};
	if yspd < 0 {face = MOVE_UP};
}

//if yspd > 0 and face == MOVE_UP {face = MOVE_DOWN};
//if yspd < 0 and face == MOVE_DOWN {face = MOVE_UP};

if xspd == 0 and yspd == 0 
{
	if face == MOVE_UP {face = FACE_UP};
	if face == MOVE_DOWN {face = FACE_DOWN};
	if face == MOVE_RIGHT {face = FACE_RIGHT};
	if face == MOVE_LEFT {face = FACE_LEFT};
}


//collisions
if place_meeting(x + xspd, y, obj_wall) == true
{
	xspd = 0;
}


if place_meeting(x, y + yspd, obj_wall) == true
{
	yspd = 0;
}


//move the player
x += xspd;
y += yspd;


sprite_index = sprite[face];

//depth
depth = -bbox_bottom;