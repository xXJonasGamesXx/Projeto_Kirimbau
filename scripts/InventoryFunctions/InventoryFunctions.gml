#macro INVENTORY_SLOTS 15

if (!variable_global_exists("inventory")) {
    global.inventory = array_create(INVENTORY_SLOTS, -1);
}

function InventorySearch(itemType) {
    for (var i = 0; i < INVENTORY_SLOTS; i += 1) {
        if (global.inventory[i] == itemType) {
            return i;
        }
    }
    return -1;
}

function InventoryRemove(itemType) {
    var _slot = InventorySearch(itemType);
    if (_slot != -1) {
        global.inventory[_slot] = -1;
        return true;
    }
    return false;
}

function InventoryAdd(itemType) {
    var _slot = InventorySearch(-1);
    if (_slot != -1) {
        global.inventory[_slot] = itemType;
        return true;
    }
    return false;
}