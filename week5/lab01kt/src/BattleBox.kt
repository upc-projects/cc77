import Constants.Companion.MAP_HEIGHT
import Constants.Companion.MAP_WIDTH

data class BattleBox(
    var robots: MutableList<Robot> = mutableListOf(),
    var obstacles: MutableList<Obstacle> = mutableListOf()
) {

    var twoDArray = Array(MAP_WIDTH) { IntArray(MAP_HEIGHT) }

    init {
        for (i in 0..MAP_WIDTH - 1) {
            var rowArray = IntArray(MAP_WIDTH)
            for (j in 0..MAP_HEIGHT - 1) {
                rowArray[j] = 0
            }
            twoDArray[i] = rowArray
        }

    }


    fun addRobot(robot: Robot) {
        robots.add(robot)
        twoDArray[robot.position.x][robot.position.y] = 1
    }

    fun addObstacle(obstacle: Obstacle) {
        obstacles.add(obstacle)
        twoDArray[obstacle.position.x][obstacle.position.y] = 2
    }

    private fun printMap() {
        for (i in 0 until MAP_WIDTH) {
            for (j in 0 until MAP_HEIGHT) {
                when (twoDArray[i][j]) {
                    0 -> print(".")
                    1 -> print("R")
                    2 -> print("O")
                }
            }
            println()
        }
    }


    fun showBattleBoxInfo() {
        printMap()
        println("======================")
        println("INFORMACION :")
        for (robot in robots) {
            println("${robot.name} : Tiene ${robot.life} vidas restantes y esta en la posicion [ ${robot.position.x} , ${robot.position.y} ]")
        }

        for (obstacle in obstacles) {
            println("Hay un obstaculo  en la posicion [ ${obstacle.position.x} , ${obstacle.position.y} ] que hace ${obstacle.damage} daño")
        }
    }
}