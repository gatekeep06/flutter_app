package main.classes

import main.classes.*

class Constants(
    val mainList: ItemList
){
    val locItem: Item = object : Item("Beer","WOW, it's a DRG reference!",2.28);
    val locAnotherItem : Item = object : Item("Knife","Big knife for cutting balls",3.37);

    val mainList = (locItem,locAnotherItem)

}

