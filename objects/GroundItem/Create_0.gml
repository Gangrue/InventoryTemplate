item_id = irandom(ITEMS.LENGTH);
if (item_id < 0) item_id = 0;
if (item_id >= ITEMS.LENGTH) item_id = ITEMS.LENGTH - 1;

item_qty = irandom(10);
if (item_qty < 1) item_qty = 1;
image_speed = 0;