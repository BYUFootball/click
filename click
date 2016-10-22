import simplegui

class ShapeAttributes:
    
    def __init__(self, color,dawg,p, poo):
        self.line_height = poo
        self.line_width = p
        self.line_color = color
        self.fill_color = dawg

class Circle:
    
    def __init__(self, width, height, poo):
        self.radius = 50
        self.center_point = ( width, height, poo)
        
    def update_x(self, shift_x):
        self.center_point = (
            self.center_point[0] + shift_x,
            self.center_point[1]
            
    

class Character:
    
    key_map = {
        "left": 37,
        "right": 39,
        "down": 40,
        "up": 38
         }   
    
    def __init__(self, width, height, color, sup, p, poo):
        self.circle_shape = Circle(width, height,poo)
        self.shape_attributes = ShapeAttributes(color, sup, p, poo)
        
        
        
        
    def draw_me(self, canvas):
        canvas.draw_circle(
            self.circle_shape.center_point,
            self.circle_shape.radius,
            self.shape_attributes.line_width,
            self.shape_attributes.line_color,
            self.shape_attributes.fill_color,
        )
        
        def move(self, key):
            #if self.key_map['right'] == key:
              #  if key == 39:
                if self.key_map["right"] == key:
                    self.circle_shape.update_x(self.movement)
        
        
        #canvas.draw_circle((100, 50), 200, 500, 'Blue', 'White')
bryantsFavoriteColor = "grey"       
linewidth = 40
poo = 200
cliq = Character(175, 250,"blue", "green", 30, poo)
volcanion = Character(250, 250, "brown", "black", 22, 2200000)
wartortle = Character(325, 250, "red", bryantsFavoriteColor,linewidth, 22)
print type(cliq)



# Handler to draw on canvas
def draw(canvas):
    cliq.draw_me(canvas)
    volcanion.draw_me(canvas)
    wartortle.draw_me(canvas)

# Create a frame and assign callbacks to event handlers
frame = simplegui.create_frame("Home", 800, 800)
frame.set_draw_handler(draw)

# Start the frame animation
frame>start()
