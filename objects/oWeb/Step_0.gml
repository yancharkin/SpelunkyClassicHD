image_alpha = life/12;
if (dying) life -= 0.02;
if (life <= 1) instance_destroy();
