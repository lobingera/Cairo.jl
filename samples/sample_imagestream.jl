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
# example, following here

inline_png2 = b"\x89PNG\r\n\x1a\n\x00\x00\x00\rIHDR\x00\x00\x00d\x00\x00\x00d\x08\x02\x00\x00\x00\xff\x80\x02\x03\x00\x00\x00\x06bKGD\x00\xff\x00\xff\x00\xff\xa0\xbd\xa7\x93\x00\x00\x01=IDATx\x9c\xed\xdc\xc1i\x85@\x14@\xd1IH!\x96bi\x96f)\x96\x92E@!\x01\x7f\xeeF\xfdp\xce\xca\x9d\xc3\xe5\xb9{\xce\xc7\xb2,\x83\xff\xf9\xbc\xfb\x00\xefD\xac@\xac@\xac@\xac@\xac@\xac@\xac@\xac\xe0\xeb\xee\x03\xfc\xb1\xaec]\xc7\x18c\x9e\xc7<\xdf{\x96_LV V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V\xf0j[\xf9gq\xf8J\xdbv<\\\xff\xf6\xd3\xfd\xe8\xe7\xc5\xdam\xdb\x11\xee2\xa7\xb1|\x86\xc1\xab\xc9\xba~m\x7f\x1f\xa8i\x1a\xd3t\xf5\xdbO=/\xd6\xba\x1e\xb1\xfca\xf1\xbe\xc4\n\xc4\n\xc4\n\xc4\n\xc4\n\xc4\n\xc4\n\xc4\n\xc4\n\xc4\n\xc4\n\xc4\n\xc4\n\xc4\n\xc4\n\xc4\n\xc4\n\xc4\n\xc4\n\xc4\n\xc4\n\xc4\n\xc4\n\xc4\n\xc4\n\xc4\n\xc4\n\xc4\n\xc4\n\xc4\n\xc4\n\xc4\n\xc4\n\xc4\n\xc4\n\xc4\n\x9ew\x1f\xfc\xf3\xae\x81\xdf\x99\xac@\xac@\xac@\xac@\xac@\xac@\xac@\xac@\xac\xe0\x1b\xaf\xef\x1c\xd4\x17\xfe\xcaX\x00\x00\x00\x00IEND\xaeB`\x82"
png_stream = IOBuffer();
write(png_stream,inline_png2);
seekstart(png_stream);

imagesurface = read_from_png(png_stream);
set_source_surface(cr, imagesurface, 0, 0);
paint(cr);

## mark picture with current date
restore(cr);
move_to(cr,0.0,12.0);
set_source_rgb(cr, 0,0,0);
show_text(cr,Libc.strftime(time()));
write_to_png(c,"sample_imagestream.png");
