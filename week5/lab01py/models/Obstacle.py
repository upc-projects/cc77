from models.CustomObject import CustomObject
from models.Position import *

class Obstacle(CustomObject):
    def __init__(self,name, color, damage, position: Position):
        super().__init__(name, color)
        self.damage = damage
        self.position = position
        
        