import simplegui

class ShapeAttributes:
    
    def __init__(self, color,dawg,p, poo):
        self.line_height = poo
        self.line_width = p
        self.line_color = color
        self.fill_color = dawg
        
        
class Circle:
    
    def __init__(self, width, height, radius):
        self.radius = radius
        self.center_point = ( width, height)
        
    def update_x(self, shift_x):
        self.update_center(shift_x, 0)
            
    def update_y(self, shift_y):
        self.update_center(0, shift_y)
     
    def update_center(self, shift_x, shift_y):
        self.center_point = (
            self.center_point[0] + shift_x,
            self.center_point[1] + shift_y)

key_map = {
        "left": 37,
        "right": 39,
        "down": 40,
        "up": 38,
        "space": 32,
        "alt":17,
        "riolu":18,
        "w":87,
        "i":73,
        "b":66,
        "n":78
         }     
        
class Character:
 




   
    
    def __init__(self, width, height, color, sup, p, poo):
        self.circle_shape = Circle(width, height,poo)
        self.shape_attributes = ShapeAttributes(color, sup, p, poo)
        self.movement = 20
        
        
        
    def draw_me(self, canvas):
        canvas.draw_circle(
            self.circle_shape.center_point,
            self.circle_shape.radius,
            self.shape_attributes.line_width,
            self.shape_attributes.line_color,
            self.shape_attributes.fill_color,
        )
        
    def move(self, key):
                print key
            #if self.key_map['right'] == key:
              #  if key == 39:
                if key_map["right"] == key:
                    self.circle_shape.update_x(self.movement)
                if key_map["left"] == key:
                    self.circle_shape.update_x(-1 * self.movement)
                if key_map["down"] == key:
                    self.circle_shape.update_y(self.movement)
                if key_map["up"] == key:
                    self.circle_shape.update_y(-1 * self.movement)
        
        #canvas.draw_circle((100, 50), 200, 500, 'Blue', 'White')
bryantsFavoriteColor = "grey"       
linewidth = 40
poo = 200
cliq = Character(175, 250,"blue", "green", 30, 200)
volcanion = Character(250, 250, "brown", "black", 22, 230)
wartortle = Character(325, 250, "red", bryantsFavoriteColor,linewidth, 130)
print type(cliq)
list_circles = [cliq, wartortle, volcanion]

list_colors = ["blue", "black", "red", "white", "grey", "brown", "orange", "green","maroon", "purple" ]
current_color = 0 

def change_fill(character):
        new_color = get_next_color()
        character.shape_attributes.fill_color = new_color
           
    
    
def change_line(character):      
        new_color = get_next_color()
        character.shape_attributes.line_color = new_color
            
def get_next_color ():
    global current_color
    new_color = list_colors[current_color]
    current_color = current_color + 1
    if current_color >= len(list_colors):
        current_color = 0
    return new_color


def reverse():
    tmp = list_circles[2]
    list_circles[2] = list_circles[0]
    list_circles[0] = tmp


def rotate_list():
    tmp = list_circles[0]
    list_circles[0] = list_circles[1]
    list_circles[1] = list_circles[2]
    list_circles[2] = tmp
    
# Handler to draw on canvas
def draw(canvas):
    list_circles[0].draw_me(canvas)
    list_circles[1].draw_me(canvas)
    list_circles[2].draw_me(canvas)

class KeyHandler:
    def __init__(self, char):
        self.characterToMove = char
        
        
#resize characters
#change color

        
    def handle(self, key):
        if key_map["space"] == key:
            self.characterToMove = volcanion
        elif key_map["alt"] == key:
            self.characterToMove = wartortle
        elif key_map["riolu"] == key:
            self.characterToMove = cliq
        elif key_map["w"] == key:
            rotate_list()
        elif key_map["i"] == key:
            reverse()
        elif key_map["b"] == key:
            change_fill(self.characterToMove)
        elif key_map["n"] == key:
            change_line(self.characterToMove)
        else:
            self.characterToMove.move(key)

keyHandler = KeyHandler(cliq)
            
# Create a frame and assign callbacks to event handlers
frame = simplegui.create_frame("Home", 600, 600)
frame.set_draw_handler(draw)
frame.set_keydown_handler(keyHandler.handle)

# Start the frame animation
frame.start()
