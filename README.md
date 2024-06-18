# InventoryTemplate
A base template for Inventory System and Management.

Free for anyone to use, if you do use it in your game, maybe give me credit, maybe don't, I don't care

How to Use:
1. Define items in the "Inventory/Create/define_items" method.
2. Define item enumerators in the "Inventory/Create/define_inventory_enums" method. (To define items, you should use these enums).
3. Make sure "Inventory/Create/define_inventory_arrays" references all the correct enums/2d array parameters.
4. Place an object of "GroundItem" in the world, set it's item_id in the room code to whatever "ITEMS.x" enum you set up earlier.
5. If you need to change the sprites, they should more or less look okay! Just make sure to modify "Inventory/Create/create_inventory_spriting_positions" method x and y values.
6. Enjoy!
