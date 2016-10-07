## header to provide surface and context
using Cairo
c = CairoRGBSurface(256,256);
cr = CairoContext(c);

save(cr);
set_source_rgb(cr,0.8,0.8,0.8);    # light gray
rectangle(cr,0.0,0.0,256.0,256.0); # background
fill(cr);
restore(cr);

save(cr);

s = read_from_png("data/mulberry.png"); 
Cairo.image(cr,s,0,0,128,128)

c1 = copy(cr)

save(cr)
rectangle(cr,128,0,256,256)
clip(cr)
#set_source_rgb(cr,0.8,0.2,0.8)
set_source(cr,c1)
paint(cr)
restore(cr)

## mark picture with current date
restore(cr); 
move_to(cr,0.0,12.0);
set_source_rgb(cr, 0,0,0);
show_text(cr,Libc.strftime(time()));
write_to_png(c,"sample_image_copy.png");
