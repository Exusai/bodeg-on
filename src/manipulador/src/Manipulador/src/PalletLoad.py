from . import Box
class Pallet:
    """
    this class has to count how many boxes there are in the pallet
    It has a maximum width, height and depth measured in how many box fit
    It has to know the size of the boxes that is carring and based on that
    it must know where to put a box o where to take it from
    """
    def __init__(self, max_width, max_height, max_depth):
        self.max_width = max_width
        self.max_height = max_height
        self.max_depth = max_depth
        self.boxes = []

    def add_box(self, box, boxposition):
        """
        Adds a box to the pallet
        """
        self.boxes.append(box)

    def remove_box(self, box, boxposition):
        """
        Removes a box from the pallet
        """
        self.boxes.remove(box)

    def get_free_space(self):
        """
        Returns the free space in the pallet
        """
        free_space = [self.max_width, self.max_height, self.max_depth]
        for box in self.boxes:
            free_space[0] -= box.width
            free_space[1] -= box.height
            free_space[2] -= box.depth
        return free_space
    
    # get a place to put a new box
    def get_place(self, box):
        """
        Returns a place to put a new box
        """
        free_space = self.get_free_space()
        if free_space[0] >= box.width and free_space[1] >= box.height and free_space[2] >= box.depth:
            return [free_space[0] - box.width, free_space[1] - box.height, free_space[2] - box.depth]
        else:
            return None