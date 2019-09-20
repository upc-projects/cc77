

data class Robot(var name: String, var weight: Double, var size: Double, var life: Int, var color: String, var position: Position = Position()) {

    fun moveUp() {
        this.position.y--
    }

    fun moveDown() {
        this.position.y++
    }

    fun moveRight() {
        this.position.x++
    }

    fun moveLeft() {
        this.position.x--
    }


    fun hit(robot: Robot){
        println("${this.name} hits ${robot.name}")
        robot.life--
        if(robot.life == 0) robot.die()
        if (robot.life < 0) println("Ya dejalo, ya esta muerto :(")
    }

    fun die() : String{
        life = 0
        return " ${this.name} die's :("
    }

    fun showData() : String{
       return this.toString()
    }

    override fun toString(): String {
        return "Hola mi nombre es $name y soy de color $color y tengo $life vidas"
    }
}