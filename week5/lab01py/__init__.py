from models.Robot import Robot
from models.Position import Position
from models.Obstacle import Obstacle
from random import randrange

if __name__ == "__main__":
    robot = Robot(name='kiko', size=12, color="green",
                  position=Position(randrange(0, 20), randrange(0, 20)))
    print(robot.name)
    print(robot.color)
    print(robot.position.posx)
    print(robot.position.posy)

    obstacle = Obstacle('obstaculo 1', 'rojo', 12, position=Position(
        randrange(0, 20), randrange(0, 20)))
    print(obstacle.name)
    print(obstacle.damage)
    print(obstacle.position.posx)
    print(obstacle.position.posy)
