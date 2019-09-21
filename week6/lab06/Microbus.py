from Vehicle import Vehicle
from Person import Person


class Microbus(Vehicle):
    def __init__(self, carga_util, lista_pasajeros: list, max_pasajeros, quantity, consume, capacity):
        super().__init__(quantity, consume, capacity)
        self.carga_util = carga_util
        self.lista_pasajeros = lista_pasajeros
        self.max_pasajeros = max_pasajeros
        weight_pasajeros = 0
        for pasajero in lista_pasajeros:
            weight_pasajeros = weight_pasajeros + pasajero.weight

        if weight_pasajeros > carga_util:
            diff = weight_pasajeros - carga_util
            aditional = diff * 0.5
            print('Hay ' + str(diff) + 'kg de peso de diferencia , el consumo aumenta en ' + str(aditional))
            self.fuel_consume = self.fuel_consume + aditional

        if len(lista_pasajeros) == 0:
            print('No hay pasajeros')
        elif len(lista_pasajeros) > max_pasajeros:
            print('Microbus tiene exceso de pasajeros')

    def drive(self, km):
        require_fuel = self.fuel_consume * km
        if self.fuel_quantity - require_fuel < 0:
            print('Microbus necesita combustible')
        else:
            super().drive(km)
            self.fuel_quantity = self.fuel_quantity - require_fuel
            print('Microbus llega al destino recorriendo ' + str(km) + 'km')

    def refuel(self, liters):
        super().refuel(liters)
        if self.tanq_capacity - self.fuel_quantity >= liters:
            self.fuel_quantity = self.fuel_quantity + liters
        else:
            print('No se puede recargar esa cantidad')
