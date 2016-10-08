import simplegui

class ShapeAttributes:
    
    def __init__(self):
        self.line_width = 10
        self.line_color = "navy"
        self.fill_color = "teal"

class Circle:
    
    def __init__(self, height, width):
        self.radius = 50
        self.center_point = ( height, width)
    

class Character:
    
    def __init__(self, height, width):
        self.circle_shape = Circle(height, width)
        self.shape_attributes = ShapeAttributes()
        
        
    def draw_me(self, canvas):
        canvas.draw_circle(
            self.circle_shape.center_point,
            self.circle_shape.radius,
            self.shape_attributes.line_width,
            self.shape_attributes.line_color,
            self.shape_attributes.fill_color
        )
        
        
        #canvas.draw_circle((100, 50), 200, 500, 'Blue', 'White')
       
cliq = Character(500, 50)
volcanion = Character(250, 250)
wartortle = Character(400, 250)
print type(cliq)



# Handler to draw on canvas
def draw(canvas):
    cliq.draw_me(canvas)
    volcanion.draw_me(canvas)
    wartortle.draw_me(canvas)

# Create a frame and assign callbacks to event handlers
frame = simplegui.create_frame("Home", 500, 500)
frame.set_draw_handler(draw)

# Start the frame animation
frame.start()
