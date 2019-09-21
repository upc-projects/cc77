class Vehicle:
    def __init__(self, fuel_quantity, fuel_consume, tanq_capacity):
        self.fuel_quantity = fuel_quantity
        self.fuel_consume = fuel_consume
        self.tanq_capacity = tanq_capacity

    @staticmethod
    def drive(km):
        print('manejando')

    @staticmethod
    def refuel(liters):
        print('recarga')
