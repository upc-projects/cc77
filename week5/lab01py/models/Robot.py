from models.CustomObject import CustomObject
from models.Position import Position


class Robot(CustomObject):
    def __init__(self, name: str, size: int, color: str, position: Position):
        super().__init__(name, color)
        self.color = color
        self.position = position
