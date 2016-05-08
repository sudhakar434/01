from PIL import Image
from PIL import ImageFont
from PIL import ImageDraw


# img = Image.open("a.jpg")
img=Image.new("RGBA", (500,250),(255,255,255))
draw = ImageDraw.Draw(img)
draw.text((0, 0),"Krishna Chaitnya",(255,255,255))
img.save('a.jpg')
