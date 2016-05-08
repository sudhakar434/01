import PIL

from PIL import Image
from PIL import ImageDraw


img=Image.new("RGBA", (200,200),(120,20,20))
draw = ImageDraw.Draw(img)
draw.text((0, 0),"Krishna chaitanya", (255,255,0))
draw = ImageDraw.Draw(img)
img.save("foo.png")
