

fun main() {
    val r1  = Robot("wall-e", 12.1, 12.5, 5, "rojo")
    val r2  = Robot("eva", 12.1, 12.5, 5, "azul")
    val o1 = Obstacle(2)
    val o2 = Obstacle(3)
    val o3 = Obstacle(1)
    val o4 = Obstacle(4)

    val battleBox = BattleBox()

    battleBox.apply {
        addRobot(r1)
        addRobot(r2)
        addObstacle(o1)
        addObstacle(o2)
        addObstacle(o3)
        addObstacle(o4)
    }
    battleBox.showBattleBoxInfo()
    r1.moveDown()
    r1.moveLeft()
    r1.hit(r2)

    battleBox.showBattleBoxInfo()



}


