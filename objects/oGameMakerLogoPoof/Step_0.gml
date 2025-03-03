if image_xscale>1 image_xscale+=0.08
else image_xscale+=0.04

if image_xscale>1 image_yscale=max(image_yscale-0.03,0)

if image_yscale==0 instance_destroy()

image_alpha=clamp(image_yscale*0.75,0,1)

