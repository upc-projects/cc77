import random

class Position:
    def __init__(self, posx = random.randint(1, 20), posy = random.randint(1, 20)):
        self.posx = posx
        self.posy = posy