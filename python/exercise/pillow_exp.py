from PIL import Image

img = Image.open('foo.jpg')
new_width, new_height = 0, 0
img = img.resize((1, 1), Image.ANTIALIAS)
img.save('bar.jpg')
