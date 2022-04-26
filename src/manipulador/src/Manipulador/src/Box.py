class Box:
    """
    This class is used to get and set different box sizes
    Each box has an ID
    """
    def __init__(self, width, height, depth, box_id, box_position):
        self.width = width
        self.height = height
        self.depth = depth
        self.box_id = box_id
        self.box_position = box_position

    def get_box_id(self):
        """
        Returns the box id
        """
        return self.box_id

    def get_box_position(self):
        """
        Returns the box position
        """
        return self.box_position

    def get_box_position(self):
        """
        Returns the box position
        """
        return self.box_position