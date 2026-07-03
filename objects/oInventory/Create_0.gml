rowLength = 6;
show_inventory = false;

if (instance_number(object_index) > 1) {
    instance_destroy();
    exit;
}