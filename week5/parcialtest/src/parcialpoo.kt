abstract class AnimalBase(var name: String) {

    var age: Int = 12
    // polymorphism
    open fun talk() {
        println("hello soy $name")
    }

    // inhierance
    fun walk() {
        println("me movu")
    }
}


class Mammal(name: String) : AnimalBase(name) {
    override fun talk() {
        super.talk()
    }

}

class Reptil(name: String) : AnimalBase(name) {
    override fun talk() {
        println("tsssss soy $name")
    }
}

fun main() {
    val animal = Mammal("mati")
    val reptile = Reptil("snake")
    println(animal.age.toString())
    println(reptile.age.toString())
    animal.talk()
    reptile.talk()
    reptile.walk()
    animal.walk()
}