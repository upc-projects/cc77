import Constants.Companion.MAP_HEIGHT
import Constants.Companion.MAP_WIDTH
import kotlin.random.Random

data class Position(var x : Int = Random.nextInt(1,MAP_WIDTH), var y : Int = Random.nextInt(1,MAP_HEIGHT))