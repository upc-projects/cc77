from Child import Child
from Adult import Adult
from Microbus import Microbus

if __name__ == '__main__':
    persons: list = [Child(), Child(), Child(), Child(), Child(), Child(), Child(), Child(), Child()]
    micro = Microbus(460, persons, 10, 100, 2, 200)
    micro.drive(5)
    micro.drive(5)
    micro.refuel(100)
    micro.drive(5)
